module Text.Smolder.Renderer.Util
  ( renderMarkup
  , Node(..)
  ) where

import Prelude
import Data.StrMap as Map
import Text.Smolder.Markup as Markup
import Data.CatList (CatList)
import Data.List (List(Nil), (:))
import Data.Maybe (Maybe(Just, Nothing))
import Data.StrMap (StrMap)
import Data.Tuple (Tuple(Tuple))

data Node
  = Element String (StrMap String) (List Node)
  | Text String

renderMarkup :: forall a. Markup.MarkupM a -> List Node
renderMarkup (Markup.Element name (Just children) attrs rest) =
  Element name (renderAttrs attrs) (renderMarkup children) : renderMarkup rest
renderMarkup (Markup.Element name Nothing attrs rest) =
  Element name (renderAttrs attrs) Nil : renderMarkup rest
renderMarkup (Markup.Content text rest) = Text text : renderMarkup rest
renderMarkup (Markup.Return _) = Nil

renderAttrs :: CatList Markup.Attr -> StrMap String
renderAttrs = map toTuple >>> Map.fromFoldable
  where
  toTuple (Markup.Attr key value) = Tuple key value
