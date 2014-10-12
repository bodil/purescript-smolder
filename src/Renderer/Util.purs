module Text.Smolder.Renderer.Util
  ( renderMarkup
  , Node(..)
  ) where

import qualified Data.Map as Map
import Text.Smolder.Markup

data Node
  = Element String (Map.Map String String) [Node]
  | Text String

renderMarkup :: Markup -> [Node]
renderMarkup (Parent name children) = [Element name Map.empty $ renderMarkup children]
renderMarkup (Leaf name) = [Element name Map.empty []]
renderMarkup (Content text) = [Text text]
renderMarkup (Append a b) = renderMarkup a ++ renderMarkup b
renderMarkup (AddAttribute k v n) = case renderMarkup n of
  (Element n a c : xs) -> [Element n (Map.insert k v a) c] ++ xs
renderMarkup Empty = []
