module Text.Smolder.Renderer.Util
  ( renderMarkup
  , Node(..)
  ) where

import Prelude

import Data.Array
import Data.Maybe
import Data.List (toList)
import Data.Tuple
import Data.Foldable

import qualified Data.Map as Map
import qualified Text.Smolder.Markup as Markup

data Node
  = Element String (Map.Map String String) (Array Node)
  | Text String

renderMarkup :: forall a. Markup.MarkupM a -> Array Node
renderMarkup (Markup.Element name (Just children) attrs rest) = 
  Element name (renderAttrs attrs) (renderMarkup children) : renderMarkup rest
renderMarkup (Markup.Element name Nothing attrs rest) = 
  Element name (renderAttrs attrs) [] : renderMarkup rest
renderMarkup (Markup.Content text rest) = Text text : renderMarkup rest
renderMarkup (Markup.Return _) = []

renderAttrs :: Array Markup.Attr -> Map.Map String String
renderAttrs xs = Map.fromList $ toList $ toTuple <$> xs
  where
  toTuple (Markup.Attr key value) = Tuple key value
