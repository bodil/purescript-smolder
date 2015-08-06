## Module Text.Smolder.Markup

#### `Attr`

``` purescript
data Attr
  = Attr String String
```

#### `MarkupM`

``` purescript
data MarkupM a
  = Element String (Maybe Markup) (Array Attr) (MarkupM a)
  | Content String (MarkupM a)
  | Return a
```

##### Instances
``` purescript
instance semigroupMarkupM :: Semigroup (MarkupM a)
instance monoidMarkup :: Monoid (MarkupM Unit)
instance functorMarkupM :: Functor MarkupM
instance applyMarkupM :: Apply MarkupM
instance applicativeMarkupM :: Applicative MarkupM
instance bindMarkupM :: Bind MarkupM
instance monadMarkupM :: Monad MarkupM
instance attributableMarkupM :: Attributable (MarkupM Unit)
instance attributableMarkupMF :: Attributable (MarkupM Unit -> MarkupM Unit)
```

#### `Markup`

``` purescript
type Markup = MarkupM Unit
```

#### `parent`

``` purescript
parent :: String -> Markup -> Markup
```

#### `leaf`

``` purescript
leaf :: String -> Markup
```

#### `text`

``` purescript
text :: forall a. String -> Markup
```

#### `Attribute`

``` purescript
data Attribute
```

##### Instances
``` purescript
instance semigroupAttribute :: Semigroup Attribute
instance monoidAttribute :: Monoid Attribute
```

#### `attribute`

``` purescript
attribute :: String -> String -> Attribute
```

#### `Attributable`

``` purescript
class Attributable a where
  with :: a -> Attribute -> a
```

##### Instances
``` purescript
instance attributableMarkupM :: Attributable (MarkupM Unit)
instance attributableMarkupMF :: Attributable (MarkupM Unit -> MarkupM Unit)
```

#### `(!)`

``` purescript
(!) :: forall a. (Attributable a) => a -> Attribute -> a
```

_left-associative / precedence 4_

#### `(!?)`

``` purescript
(!?) :: forall h. (Attributable h) => h -> Boolean -> Attribute -> h
```

_left-associative / precedence 4_


