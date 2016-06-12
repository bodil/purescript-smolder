module Text.Smolder.Renderer.Util
  ( renderMarkup
  , Node(..)
  ) where

import Prelude

import Data.Maybe (Maybe(..))
import Data.Tuple (Tuple(..))
import Data.List (List(..), fromFoldable, (:))

import Data.Map as Map
import Text.Smolder.Markup as Markup

data Node
  = Element String (Map.Map String String) (List Node)
  | Text String

renderMarkup :: forall a. Markup.MarkupM a -> List Node
renderMarkup (Markup.Element name (Just children) attrs rest) = 
  Element name (renderAttrs attrs) (renderMarkup children) : renderMarkup rest
renderMarkup (Markup.Element name Nothing attrs rest) = 
  Element name (renderAttrs attrs) Nil : renderMarkup rest
renderMarkup (Markup.Content text rest) = Text text : renderMarkup rest
renderMarkup (Markup.Return _) = Nil

renderAttrs :: Array Markup.Attr -> Map.Map String String
renderAttrs = Map.fromList <<< map toTuple <<< fromFoldable
  where
  toTuple (Markup.Attr key value) = Tuple key value
