module Text.Smolder.Renderer.String
  ( render
  ) where

import Prelude
import Data.CatList (CatList)
import Data.Foldable (fold)
import Data.Maybe (maybe)
import Data.StrMap (StrMap, fromFoldable, lookup)
import Data.String (Pattern(Pattern), joinWith, length, split)
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

-- | Render markup as an HTML string.
render :: ∀ e. Markup e → String
render (Element name children attrs _ rest) =
  let c = render children
  in "<" <> name <> showAttrs attrs <>
     (if length c > 0
      then ">" <> c <> "</" <> name <> ">"
      else "/>") <> render rest
render (Content text rest) = escape text <> render rest
render (Return _) = ""
