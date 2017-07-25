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

escapeURLMap :: StrMap String
escapeURLMap = fromFoldable
  [ "<" /\ "%3C"
  , ">" /\ "%3E"
  , "\"" /\ "5%C"
  , " " /\ "%20"
  , "%" /\ "%25"
  , "$" /\ "%24"
  , "\"" /\ "%22"
  , "`" /\ "%60"
  , ";" /\ "%3B"
  , ":" /\ "%3A"
  , "@" /\ "%40"
  ]

escape :: String -> String
escape s = joinWith "" (escapeChar <$> (split (Pattern "") s))
  where
    escapeChar :: String -> String
    escapeChar c = fromMaybe c $ lookup s escapeMap

escapeURL :: String -> String
escapeURL s = joinWith "" $ escapeChar <$> (split (Pattern "") s)
  where
    escapeChar :: String -> String
    escapeChar c = fromMaybe c $ lookup c escapeURLMap

showAttrs :: CatList Attr → String
showAttrs = map showAttr >>> fold
  where showAttr (Attr key value) = " "
          <> key
          <> "=\""
          <> (if key == "src" || key == "href" then escapeURL value else escape value)
          <> "\""

renderItem :: ∀ e. MarkupM e ~> State String
renderItem (Element name children attrs _ rest) =
  let c = render children
      b = "<" <> name <> showAttrs attrs <>
          (if length c > 0
           then ">" <> c <> "</" <> name <> ">"
           else "/>")
  in state \s → Tuple rest $ append s b
renderItem (Content text rest) = state \s → Tuple rest $ append s $ escape text
renderItem (Empty rest) = pure rest

-- | Render markup as an HTML string.
render :: ∀ e. Markup e → String
render f = execState (foldFree renderItem f) ""
