module Text.Smolder.Renderer.String
  ( render
  ) where

import Prelude

import Control.Monad.Free (foldFree)
import Control.Monad.State (execState, State, state)
import Data.CatList (CatList)
import Data.Foldable (fold)
import Data.Maybe (fromMaybe)
import Data.StrMap (StrMap, fromFoldable, lookup)
import Data.String (Pattern(Pattern), joinWith, length, split)
import Data.Tuple (Tuple(..))
import Data.Tuple.Nested ((/\))
import Global (encodeURI)
import Text.Smolder.Markup (Attr(..), Markup, MarkupM(..))

escapeMap :: StrMap String
escapeMap = fromFoldable
  [ "&" /\ "&amp;"
  , "<" /\ "&lt;"
  , ">" /\ "&gt;"
  , "\"" /\ "&quot;"
  , "'" /\ "&#39;"
  , "/" /\ "&#x2F;"
  ]

escapeMIMEMap :: StrMap String
escapeMIMEMap = fromFoldable
  [ "&" /\ "&amp;"
  , "<" /\ "&lt;"
  , "\"" /\ "&quot;"
  , "'" /\ "&#39;"
  ]

isMIMEAttr :: String -> String -> Boolean
isMIMEAttr tag attr
  | attr == "type" && tag == "embed" = true
  | attr == "type" && tag == "object" = true
  | attr == "type" && tag == "script" = true
  | attr == "type" && tag == "source" = true
  | attr == "type" && tag == "style" = true
  | attr == "type" && tag == "link" = true
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

escape :: StrMap String -> String -> String
escape m s = joinWith "" (escapeChar <$> (split (Pattern "") s))
  where
    escapeChar :: String -> String
    escapeChar c = fromMaybe c $ lookup c m

escapeAttrValue :: String -> String -> String -> String
escapeAttrValue tag key value
  | isURLAttr tag key   = encodeURI value
  | isMIMEAttr tag key  = escape escapeMIMEMap value
  | otherwise           = escape escapeMap value

showAttrs :: String -> CatList Attr → String
showAttrs tag = map showAttr >>> fold
  where showAttr (Attr key value) = " "
          <> key
          <> "=\""
          <> escapeAttrValue tag key value
          <> "\""

renderItem :: ∀ e. MarkupM e ~> State String
renderItem (Element name children attrs _ rest) =
  let c = render children
      b = "<" <> name <> showAttrs name attrs <>
          (if length c > 0
           then ">" <> c <> "</" <> name <> ">"
           else "/>")
  in state \s → Tuple rest $ append s b
renderItem (Content text rest) = state \s → Tuple rest $ append s $ escape escapeMap text
renderItem (Empty rest) = pure rest

-- | Render markup as an HTML string.
render :: ∀ e. Markup e → String
render f = execState (foldFree renderItem f) ""
