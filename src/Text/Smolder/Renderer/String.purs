module Text.Smolder.Renderer.String
  ( render
  ) where

import Prelude

import Control.Monad.Free (foldFree)
import Control.Monad.State (execState, State, state)
import Data.CatList (CatList)
import Data.Foldable (fold)
import Data.Maybe (maybe)
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

escapeChar :: String -> String
escapeChar s = maybe s id $ lookup s escapeMap

escape :: String -> String
escape s = joinWith "" (escapeChar <$> (split (Pattern "") s))

showAttrs :: CatList Attr → String
showAttrs = map showAttr >>> fold
  where showAttr (Attr key value) = " " <> key <> "=\"" <> escape value <> "\""

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
