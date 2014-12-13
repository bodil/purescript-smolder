module Text.Smolder.Renderer.Util
  ( renderMarkup
  , Node(..)
  ) where

import Data.Maybe
import Data.Tuple

import qualified Data.Map as Map
import qualified Text.Smolder.Markup as Markup

data Node
  = Element String (Map.Map String String) [Node]
  | Text String

renderMarkup :: forall a. Markup.MarkupM a -> [Node]
renderMarkup (Markup.Element name (Just children) attrs rest) = 
  Element name (renderAttrs attrs) (renderMarkup children) : renderMarkup rest
renderMarkup (Markup.Element name Nothing attrs rest) = 
  Element name (renderAttrs attrs) [] : renderMarkup rest
renderMarkup (Markup.Content text rest) = Text text : renderMarkup rest
renderMarkup (Markup.Return _) = []

renderAttrs :: [Markup.Attr] -> Map.Map String String
renderAttrs xs = Map.fromList $ toTuple <$> xs 
  where
  toTuple (Markup.Attr key value) = Tuple key value
