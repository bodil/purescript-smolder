## Module Text.Smolder.Renderer.Util

#### `Node`

``` purescript
data Node
  = Element String (Map String String) (List Node)
  | Text String
```

#### `renderMarkup`

``` purescript
renderMarkup :: forall a. MarkupM a -> List Node
```


