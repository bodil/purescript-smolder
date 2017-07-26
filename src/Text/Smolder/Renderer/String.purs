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

escapeChar :: String -> String
escapeChar s = fromMaybe s $ lookup s escapeMap

escape :: String -> String
escape s = joinWith "" (escapeChar <$> (split (Pattern "") s))

-- url attributes according to:
-- https://developer.mozilla.org/en-US/docs/Web/HTML/Attributes 
isURLAttr :: String -> String -> Boolean
isURLAttr n s
  | s == "href" && n == "a" = true
  | s == "href" && n == "area" = true
  | s == "href" && n == "base" = true
  | s == "href" && n == "link" = true
  | s == "src" && n == "audio" = true
  | s == "src" && n == "embed" = true
  | s == "src" && n == "iframe" = true
  | s == "src" && n == "img" = true
  | s == "src" && n == "input" = true
  | s == "src" && n == "script" = true
  | s == "src" && n == "source" = true
  | s == "src" && n == "track" = true
  | s == "src" && n == "video" = true
  | s == "code" && n == "applet" = true
  | s == "codebase" && n == "applet" = true
  | s == "data" && n == "object" = true
  | s == "manifest" && n == "html" = true
  | s == "poster" && n == "video" = true
  | otherwise = false

showAttrs :: String -> CatList Attr → String
showAttrs tag = map showAttr >>> fold
  where showAttr (Attr key value) = " "
          <> key
          <> "=\""
          <> (if isURLAttr tag key then encodeURI value else escape value)
          <> "\""

renderItem :: ∀ e. MarkupM e ~> State String
renderItem (Element name children attrs _ rest) =
  let c = render children
      b = "<" <> name <> showAttrs name attrs <>
          (if length c > 0
           then ">" <> c <> "</" <> name <> ">"
           else "/>")
  in state \s → Tuple rest $ append s b
renderItem (Content text rest) = state \s → Tuple rest $ append s $ escape text
renderItem (Empty rest) = pure rest

-- | Render markup as an HTML string.
render :: ∀ e. Markup e → String
render f = execState (foldFree renderItem f) ""
