module Text.Smolder.Markup
  ( MarkupM(..)
  , Markup()
  , Attr(..)
  , parent
  , leaf
  , text
  , Attribute()
  , Attributable
  , attribute
  , (!)
  , (!?)
  ) where

import Data.Maybe
import Data.Monoid

import Control.Apply ((*>))

data Attr = Attr String String

data MarkupM a
  = Element String (Maybe Markup) [Attr] (MarkupM a)
  | Content String (MarkupM a)
  | Return a 

type Markup = MarkupM Unit

parent :: String -> Markup -> Markup
parent el kids = Element el (Just kids) [] (Return unit)

leaf :: String -> Markup
leaf el = Element el Nothing [] (Return unit)

text :: forall a. String -> Markup
text s = Content s (Return unit)

instance semigroupMarkupM :: Semigroup (MarkupM a) where
  (<>) x y = x *> y

instance monoidMarkup :: Monoid (MarkupM Unit) where
  mempty = Return unit

instance functorMarkupM :: Functor MarkupM where
  (<$>) f (Element el kids attrs rest) = Element el kids attrs (f <$> rest)
  (<$>) f (Content s rest) = Content s (f <$> rest)
  (<$>) f (Return a) = Return (f a)

instance applyMarkupM :: Apply MarkupM where
  (<*>) = ap

instance applicativeMarkupM :: Applicative MarkupM where
  pure = Return

instance bindMarkupM :: Bind MarkupM where
  (>>=) (Element el kids attrs rest) f = Element el kids attrs (rest >>= f)
  (>>=) (Content s rest) f = Content s (rest >>= f)
  (>>=) (Return a) f = f a

instance monadMarkupM :: Monad MarkupM



data Attribute = Attribute [Attr]

instance semigroupAttribute :: Semigroup Attribute where
  (<>) (Attribute xs) (Attribute ys) = Attribute (xs <> ys)

instance monoidAttribute :: Monoid Attribute where
  mempty = Attribute mempty

attribute :: String -> String -> Attribute
attribute key value = Attribute [Attr key value]

infixl 4 !
class Attributable a where
  (!) :: a -> Attribute -> a

instance attributableMarkupM :: Attributable (MarkupM Unit) where
  (!) (Element el kids attrs rest) (Attribute xs) = Element el kids (attrs <> xs) rest

instance attributableMarkupMF :: Attributable (MarkupM Unit -> MarkupM Unit) where
  (!) k xs m = k m ! xs

infixl 4 !?

(!?) :: forall h. (Attributable h) => h -> Boolean -> Attribute -> h
(!?) h c a = if c then h ! a else h
