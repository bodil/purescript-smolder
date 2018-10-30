module Text.Smolder.Renderer.String
  ( render
  ) where

import Prelude

import Control.Comonad (extend)
import Control.Comonad.Cofree (Cofree, head, mkCofree, tail, (:<))
import Control.Monad.Free (foldFree)
import Control.Monad.State (State, evalState, execState, get, put, state)
import Data.Array (notElem, (..))
import Data.CatList (CatList)
import Data.Char (toCharCode)
import Data.Foldable (elem, fold, foldr)
import Data.Map (Map, lookup, fromFoldable)
import Data.Maybe (Maybe(..), fromMaybe)
import Data.String (length)
import Data.String.CodeUnits (fromCharArray, toCharArray)
import Data.Tuple (Tuple(..))
import Data.Tuple.Nested ((/\))
import Global.Unsafe (unsafeEncodeURI)
import Text.Smolder.Markup (Attr(..), Markup, MarkupM(..), NS(..))

escapeMap :: Map Char String
escapeMap = fromFoldable
  [ '&' /\ "&amp;"
  , '<' /\ "&lt;"
  , '>' /\ "&gt;"
  , '"' /\ "&quot;"
  , '\'' /\ "&#39;"
  , '/' /\ "&#x2F;"
  ]

escapeMIMEMap :: Map Char String
escapeMIMEMap = fromFoldable
  [ '&' /\ "&amp;"
  , '<' /\ "&lt;"
  , '"' /\ "&quot;"
  , '\'' /\ "&#39;"
  ]

isMIMEAttr :: String -> String -> Boolean
isMIMEAttr tag attr
  | attr == "type" && tag == "embed" = true
  | attr == "type" && tag == "object" = true
  | attr == "type" && tag == "script" = true
  | attr == "type" && tag == "source" = true
  | attr == "type" && tag == "style" = true
  | otherwise = false

-- url attributes according to:
-- https://developer.mozilla.org/en-US/docs/Web/HTML/Attributes
isURLAttr :: String -> String -> Boolean
isURLAttr tag attr
  | attr == "href" && tag == "a" = true
  | attr == "href" && tag == "area" = true
  | attr == "href" && tag == "base" = true
  | attr == "href" && tag == "link" = true
  | attr == "src" && tag == "audio" = true
  | attr == "src" && tag == "embed" = true
  | attr == "src" && tag == "iframe" = true
  | attr == "src" && tag == "img" = true
  | attr == "src" && tag == "input" = true
  | attr == "src" && tag == "script" = true
  | attr == "src" && tag == "source" = true
  | attr == "src" && tag == "track" = true
  | attr == "src" && tag == "video" = true
  | attr == "code" && tag == "applet" = true
  | attr == "codebase" && tag == "applet" = true
  | attr == "data" && tag == "object" = true
  | attr == "manifest" && tag == "html" = true
  | attr == "poster" && tag == "video" = true
  | otherwise = false

toStream :: String -> Cofree Maybe Char
toStream s = foldr (\c t -> c :< (Just t)) (mkCofree '\0' Nothing) cs
  where
  cs = toCharArray s

fromStream :: Cofree Maybe String -> String
fromStream = go ""
  where
    go :: String -> Cofree Maybe String -> String
    go result cof =
      case (head cof), (tail cof) of
        _, Nothing -> result
        s, (Just cof') -> go (result <> s) cof'

escape :: Map Char String -> String -> String
escape m = fromStream <<< extend escapeS <<< toStream
  where
    startsEntity :: Maybe (Cofree Maybe Char) -> Boolean
    startsEntity (Just w) =
              case head w, tail w of
                '#',  Just w' -> checkTail (48..57) w'
                '#',  Nothing -> false
                _,    _       -> checkTail (65..90 <> 97..122) w
    startsEntity Nothing = false

    checkTail :: Array Int -> Cofree Maybe Char -> Boolean
    checkTail allowed = flip evalState false <<< checkTail'
      where
        -- keep if `;` is allowed in `State` monad
        checkTail' :: Cofree Maybe Char -> State Boolean Boolean
        checkTail' w =
          case toCharCode $ head w of
            cc  | cc `elem` allowed -> do
              put true
              fromMaybe (pure false) $ checkTail' <$> tail w
                | cc == 59 -> get
                | otherwise -> pure false

    escapeS :: Cofree Maybe Char -> String
    escapeS w =
      case head w of
        '&' | startsEntity (tail w) -> "&"
            | otherwise             -> "&amp;"
        c                           -> fromMaybe (fromCharArray [c]) $ lookup c m

escapeAttrValue :: String -> String -> String -> String
escapeAttrValue tag key value
  | isURLAttr tag key   = unsafeEncodeURI value
  | isMIMEAttr tag key  = escape escapeMIMEMap value
  | otherwise           = escape escapeMap value

showAttrs :: String -> CatList Attr → String
showAttrs tag = map showAttr >>> fold
  where showAttr (Attr key value) = " "
          <> key
          <> "=\""
          <> escapeAttrValue tag key value
          <> "\""

voidTags :: Array String 
voidTags = ["area", "base", "br", "col", "embed", "hr", "img", "input", "link", "meta", "param", "source", "track", "wbr"]

renderItem :: ∀ e. MarkupM e ~> State String
renderItem (Element ns name children attrs _ rest) =
  let c = render children
      b = "<" <> name <> showAttrs name attrs <>
          (if length c > 0 || (ns == HTMLns && notElem name voidTags)
           then ">" <> c <> "</" <> name <> ">"
           else "/>")
  in state \s → Tuple rest $ append s b
renderItem (Content text rest) = state \s → Tuple rest $ append s $ escape escapeMap text
renderItem (Empty rest) = pure rest

-- | Render markup as an HTML string.
render :: ∀ e. Markup e → String
render f = execState (foldFree renderItem f) ""
