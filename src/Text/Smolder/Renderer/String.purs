module Text.Smolder.Renderer.String
  ( render
  , renderNode
  ) where

import Prelude
import Data.Foldable (fold, foldMap)
import Data.List (List(Nil))
import Data.Maybe (maybe)
import Data.StrMap (fromFoldable, keys, lookup, StrMap)
import Data.String (split, joinWith)
import Data.Tuple.Nested ((/\))
import Text.Smolder.Markup (MarkupM)
import Text.Smolder.Renderer.Util (Node(Text, Element), renderMarkup)

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
escape s = joinWith "" (escapeChar <$> (split "" s))

-- | Render a node as an HTML string.
-- |
-- | TODO: attr values and text content must be properly escaped.
renderNode :: Node -> String
renderNode (Element n a c) = "<" <> n <> showAttrs a <> showTail c
  where
  showTail :: List Node -> String
  showTail Nil = "/>"
  showTail c = ">" <> fold (map renderNode c) <> "</" <> n <> ">"

  showAttrs :: StrMap String -> String
  showAttrs a = fold $ map pair (keys a)
    where
    pair :: String -> String
    pair k = " " <> k <> foldMap (\v -> "=\"" <> escape v <> "\"") (lookup k a)
renderNode (Text s) = escape s

-- | Render markup as an HTML string.
render :: forall a. MarkupM a -> String
render = fold <<< map renderNode <<< renderMarkup
