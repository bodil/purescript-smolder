## Module Text.Smolder.Renderer.String

#### `renderNode`

``` purescript
renderNode :: Node -> String
```

Render a node as a HTML string.

TODO: attr values and text content must be properly escaped.

#### `render`

``` purescript
render :: forall a. MarkupM a -> String
```

Render markup as a HTML string.


