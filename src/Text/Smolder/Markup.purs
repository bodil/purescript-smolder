module Text.Smolder.Markup
  ( MarkupM(..)
  , Markup
  , Attr(..)
  , EventHandler(..)
  , mapEvent
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

import Control.Monad.Free (Free, foldFree, hoistFree, liftF)
import Data.Bifunctor (class Bifunctor, lmap)
import Data.CatList (CatList)
import Data.Monoid (class Monoid, mempty)

data Attr = Attr String String

data EventHandler e = EventHandler String e

instance functorEventHandler ∷ Functor EventHandler where
  map f (EventHandler s e) = EventHandler s (f e)

-- | Representation of a markup node.
-- |
-- | This is either an `Element`, which maps to a DOM element,
-- | a `Content` node, which maps to a DOM text node, or `Empty`,
-- | which maps to an empty `NodeList`.
data MarkupM e a
  = Element String (Markup e) (CatList Attr) (CatList (EventHandler e)) a
  | Content String a
  | Empty a

-- | The type of a sequence of markup nodes.
type Markup e = Free (MarkupM e) Unit

instance bifunctorMarkupM :: Bifunctor MarkupM where
  bimap l r (Empty a) = Empty (r a)
  bimap l r (Content t a) = Content t (r a)
  bimap l r (Element el kids attrs events a) =
    Element el (mapEvent l kids) attrs (map l <$> events) (r a)

-- | Change the event type of a markup sequence.
mapEvent :: ∀ l r. (l → r) → Free (MarkupM l) ~> Free (MarkupM r)
mapEvent f fm = foldFree (\m → liftF $ lmap f m) fm

-- | Create a named parent node with a sequence of children.
parent :: ∀ e. String → Markup e → Markup e
parent el kids = liftF $ Element el kids mempty mempty unit

-- | Create a named leaf node.
leaf :: ∀ e. String → Markup e
leaf el = liftF $ Element el (liftF $ Empty unit) mempty mempty unit

-- | Create a text node.
text :: ∀ e. String → Markup e
text s = liftF $ Content s unit

data Attribute = Attribute (CatList Attr)

instance semigroupAttribute :: Semigroup Attribute where
  append (Attribute xs) (Attribute ys) = Attribute (append xs ys)

instance monoidAttribute :: Monoid Attribute where
  mempty = Attribute mempty

-- | Create an attribute.
attribute :: String → String → Attribute
attribute key value = Attribute (pure $ Attr key value)

class Attributable a where
  -- | Add an attribute to a markup node.
  with :: a → Attribute → a

infixl 4 with as !

-- | Add an attribute to a markup node only if the supplied boolean value is true.
optionalWith :: ∀ h. (Attributable h) ⇒ h → Boolean → Attribute → h
optionalWith h c a = if c then h ! a else h

infixl 4 optionalWith as !?

instance attributableMarkup :: Attributable (Free (MarkupM e) Unit) where
  with f (Attribute attr) = hoistFree withF f
    where
      withF :: ∀ a. MarkupM e a → MarkupM e a
      withF (Element el kids attrs events rest) = Element el kids (attrs <> attr) events rest
      withF el = el

instance attributableMarkupF :: Attributable (Free (MarkupM e) Unit → Free (MarkupM e) Unit) where
  with k xs m = k m `with` xs

newtype EventHandlers e = EventHandlers (CatList (EventHandler e))

derive newtype instance semigroupEventHandlers :: Semigroup (EventHandlers e)

derive newtype instance monoidEventHandlers :: Monoid (EventHandlers e)

class Eventable e a | a → e where
  -- | Add an event handler to a markup node.
  withEvent :: a → EventHandlers e → a

infixl 4 withEvent as #!

-- | Construct an event handler for a named event.
on :: ∀ e. String → e → EventHandlers e
on name handler = EventHandlers (pure $ EventHandler name handler)

instance eventableMarkup :: Eventable e (Free (MarkupM e) Unit) where
  withEvent f (EventHandlers es) = hoistFree withEventF f
    where
      withEventF :: ∀ a. MarkupM e a → MarkupM e a
      withEventF (Element el kids attrs events rest) =
        Element el kids attrs (events <> es) rest
      withEventF xs = xs

instance eventableMarkupMF :: Eventable e (Free (MarkupM e) Unit → Free (MarkupM e) Unit) where
  withEvent k xs m = k m `withEvent` xs
