module Text.Smolder.Renderer.String
  ( render
  , renderNode
  ) where

import Prelude

import qualified Data.Map as Map
import qualified Text.Smolder.Markup as Markup

import Data.List (fromList)
import Data.Maybe
import Data.String
import Text.Smolder.Renderer.Util

-- TODO: attr values and text content must be properly escaped.
renderNode :: Node -> String
renderNode (Element n a c) = "<" ++ n ++ showAttrs a ++ showTail c
  where showTail [] = "/>"
        showTail c = ">" ++ joinWith "" (show <$> c) ++ "</" ++ n ++ ">"
        showAttrs a = joinWith "" $ fromList $ pair <$> (Map.keys a)
          where pair k = " " ++ k ++ case Map.lookup k a of
                  Just v -> "=\"" ++ v ++ "\""
                  Nothing -> ""
renderNode (Text s) = s

render :: forall a. Markup.MarkupM a -> String
render m = joinWith "" $ renderNode <$> renderMarkup m

instance showNode :: Show Node where
  show = renderNode

instance showMarkup :: Show (Markup.MarkupM Unit) where
  show = render
