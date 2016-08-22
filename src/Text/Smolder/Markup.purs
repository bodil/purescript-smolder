module Text.Smolder.Markup
  ( MarkupM(..)
  , Markup()
  , Attr(..)
  , parent
  , leaf
  , text
  , Attribute()
  , class Attributable
  , with
  , attribute
  , (!)
  , optionalWith
  , (!?)
  ) where

import Prelude
import Data.CatList (CatList)
import Data.Maybe (Maybe(Just, Nothing))
import Data.Monoid (class Monoid, mempty)

data Attr = Attr String String

data MarkupM a
  = Element String (Maybe Markup) (CatList Attr) (MarkupM a)
  | Content String (MarkupM a)
  | Return a 

type Markup = MarkupM Unit

parent :: String -> Markup -> Markup
parent el kids = Element el (Just kids) mempty (Return unit)

leaf :: String -> Markup
leaf el = Element el Nothing mempty (Return unit)

text :: String -> Markup
text s = Content s (Return unit)

instance semigroupMarkupM :: Semigroup (MarkupM a) where
  append x y = x *> y

instance monoidMarkup :: Monoid (MarkupM Unit) where
  mempty = Return unit

instance functorMarkupM :: Functor MarkupM where
  map f (Element el kids attrs rest) = Element el kids attrs (map f rest)
  map f (Content s rest) = Content s (map f rest)
  map f (Return a) = Return (f a)

instance applyMarkupM :: Apply MarkupM where
  apply = ap

instance applicativeMarkupM :: Applicative MarkupM where
  pure = Return

instance bindMarkupM :: Bind MarkupM where
  bind (Element el kids attrs rest) f = Element el kids attrs (bind rest f)
  bind (Content s rest) f = Content s (bind rest f)
  bind (Return a) f = f a

instance monadMarkupM :: Monad MarkupM

data Attribute = Attribute (CatList Attr)

instance semigroupAttribute :: Semigroup Attribute where
  append (Attribute xs) (Attribute ys) = Attribute (append xs ys)

instance monoidAttribute :: Monoid Attribute where
  mempty = Attribute mempty

attribute :: String -> String -> Attribute
attribute key value = Attribute (pure $ Attr key value)

class Attributable a where
  with :: a -> Attribute -> a

instance attributableMarkupM :: Attributable (MarkupM Unit) where
  with (Element el kids attrs rest) (Attribute xs) = Element el kids (attrs <> xs) rest
  with xs _ = xs

instance attributableMarkupMF :: Attributable (MarkupM Unit -> MarkupM Unit) where
  with k xs m = k m `with` xs

infixl 4 with as !

optionalWith :: forall h. (Attributable h) => h -> Boolean -> Attribute -> h
optionalWith h c a = if c then h ! a else h

infixl 4 optionalWith as !?
