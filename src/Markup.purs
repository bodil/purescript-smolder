module Text.Smolder.Markup
  ( MarkupM(..)
  , Markup(..)
  , Attribute(..)
  , Attributable
  , text
  , attribute
  , (!)
  , (!?)
  ) where

import Data.Monoid



data MarkupM a
  = Parent String (MarkupM a)
  | Leaf String
  | Content String
  | Append (MarkupM a) (MarkupM a)
  | AddAttribute String String (MarkupM a)
  | Empty

type Markup = MarkupM Unit

text :: forall a. String -> MarkupM a
text s = Content s



foreign import slightlyUnsafeCoerce
  "function slightlyUnsafeCoerce(a) {return a;}" :: forall a b. a -> b

foreign import horriblyUnsafeBind """
  function horriblyUnsafeBind(ma) {
    return function(f) {
      return new Append(ma, f());
    }
  }
""" :: forall a b. MarkupM a -> (a -> MarkupM b) -> MarkupM b



instance semigroupMarkupM :: Semigroup (MarkupM a) where
  (<>) = Append

instance monoidMarkupM :: Monoid (MarkupM a) where
  mempty = Empty

instance functorMarkupM :: Functor MarkupM where
  (<$>) _ = slightlyUnsafeCoerce

instance applyMarkupM :: Apply MarkupM where
  (<*>) = ap

instance applicativeMarkupM :: Applicative MarkupM where
  pure _ = Empty

instance bindMarkupM :: Bind MarkupM where
  (>>=) = horriblyUnsafeBind

instance monadMarkupM :: Monad MarkupM



newtype Attribute = Attribute (forall a. MarkupM a -> MarkupM a)

instance semigroupAttribute :: Semigroup Attribute where
  (<>) (Attribute f) (Attribute g) = Attribute (f >>> g)

instance monoidAttribute :: Monoid Attribute where
  mempty = Attribute id

attribute :: String -> String -> Attribute
attribute key value = Attribute (AddAttribute key value)

infixl 4 !
class Attributable a where
  (!) :: a -> Attribute -> a

instance attributableMarkupM :: Attributable (MarkupM a) where
  (!) h (Attribute f) = f h

instance attributableMarkupMF :: Attributable (MarkupM a -> MarkupM b) where
  (!) h (Attribute f) = f <<< h

infixl 4 !?
(!?) :: forall h. (Attributable h) => h -> Boolean -> Attribute -> h
(!?) h c a = if c then h ! a else h
