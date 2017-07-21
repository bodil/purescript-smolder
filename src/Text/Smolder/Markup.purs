module Text.Smolder.Markup
  ( MarkupM(..)
  , Markup
  , Attr(..)
  , EventHandler(..)
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
  , EventHandlers(..)
  , class Eventable
  , withEvent
  , on
  , (#!)
  ) where

import Prelude
import Data.CatList (CatList)
import Data.Monoid (class Monoid, mempty)
import Control.Monad.Free (Free, liftF, hoistFree)

data Attr = Attr String String

data EventHandler e = EventHandler String e

instance functorEventHandler ∷ Functor EventHandler where
  map f (EventHandler s e) = EventHandler s (f e)

data MarkupM e a
  = Element String (Markup e) (CatList Attr) (CatList (EventHandler e)) a
  | Content String a
  | Empty a

type Markup e = Free (MarkupM e) Unit

parent :: forall e. String -> Markup e -> Markup e
parent el kids = liftF $ Element el kids mempty mempty unit

leaf :: forall e. String -> Markup e
leaf el = liftF $ Element el (liftF $ Empty unit) mempty mempty unit

text :: forall e. String -> Markup e
text s = liftF $ Content s unit

data Attribute = Attribute (CatList Attr)

instance semigroupAttribute :: Semigroup Attribute where
  append (Attribute xs) (Attribute ys) = Attribute (append xs ys)

instance monoidAttribute :: Monoid Attribute where
  mempty = Attribute mempty

attribute :: String -> String -> Attribute
attribute key value = Attribute (pure $ Attr key value)

class Attributable a where
  with :: a -> Attribute -> a

infixl 4 with as !

optionalWith :: forall h. (Attributable h) => h -> Boolean -> Attribute -> h
optionalWith h c a = if c then h ! a else h

infixl 4 optionalWith as !?

instance attributableMarkup :: Attributable (Free (MarkupM e) Unit) where
  with f (Attribute attr) = hoistFree withF f
    where
      withF :: ∀ a. MarkupM e a → MarkupM e a
      withF (Element el kids attrs events rest) = Element el kids (attrs <> attr) events rest
      withF el = el

instance attributableMarkupF :: Attributable (Free (MarkupM e) Unit -> Free (MarkupM e) Unit) where
  with k xs m = k m `with` xs

data EventHandlers e = EventHandlers (CatList (EventHandler e))

class Eventable e a | a -> e where
  withEvent :: a -> EventHandlers e -> a

infixl 4 withEvent as #!

on :: forall e. String -> e -> EventHandlers e
on name handler = EventHandlers (pure $ EventHandler name handler)

instance eventableMarkup :: Eventable e (Free (MarkupM e) Unit) where
  withEvent f (EventHandlers es) = hoistFree withEventF f
    where
      withEventF :: ∀ a. MarkupM e a → MarkupM e a
      withEventF (Element el kids attrs events rest) =
        Element el kids attrs (events <> es) rest
      withEventF xs = xs

instance eventableMarkupMF :: Eventable e (Free (MarkupM e) Unit -> Free (MarkupM e) Unit) where
  withEvent k xs m = k m `withEvent` xs
