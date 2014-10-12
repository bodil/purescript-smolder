module Text.Smolder.Renderer.String
  ( render
  , renderNode
  ) where

import qualified Data.Map as Map
import Data.Maybe
import Data.String
import Text.Smolder.Markup
import Text.Smolder.Renderer.Util

-- TODO: attr values and text content must be properly escaped.
renderNode :: Node -> String
renderNode (Element n a c) = "<" ++ n ++ showAttrs a ++ showTail c
  where showTail [] = "/>"
        showTail c = ">" ++ joinWith "" (show <$> c) ++ "</" ++ n ++ ">"
        showAttrs a = joinWith "" $ pair <$> (Map.keys a)
          where pair k = " " ++ k ++ case Map.lookup k a of
                  Just v -> "=\"" ++ v ++ "\""
                  Nothing -> ""
renderNode (Text s) = s

render :: Markup -> String
render m = joinWith "" $ renderNode <$> renderMarkup m

instance showNode :: Show Node where
  show = renderNode

instance showMarkup :: Show (MarkupM Unit) where
  show = render
