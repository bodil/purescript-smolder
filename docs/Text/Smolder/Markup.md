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
Semigroup (MarkupM a)
Monoid (MarkupM Unit)
Functor MarkupM
Apply MarkupM
Applicative MarkupM
Bind MarkupM
Monad MarkupM
Attributable (MarkupM Unit)
Attributable (MarkupM Unit -> MarkupM Unit)
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
text :: String -> Markup
```

#### `Attribute`

``` purescript
data Attribute
```

##### Instances
``` purescript
Semigroup Attribute
Monoid Attribute
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
Attributable (MarkupM Unit)
Attributable (MarkupM Unit -> MarkupM Unit)
```

#### `(!)`

``` purescript
infixl 4 with as !
```

_left-associative / precedence 4_

#### `optionalWith`

``` purescript
optionalWith :: forall h. (Attributable h) => h -> Boolean -> Attribute -> h
```

#### `(!?)`

``` purescript
infixl 4 optionalWith as !?
```

_left-associative / precedence 4_


