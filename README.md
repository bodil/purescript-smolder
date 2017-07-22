# purescript-smolder

A simple combinator library for generating HTML in PureScript, heavily inspired by Haskell's [BlazeHtml](http://jaspervdj.be/blaze/).

- [Module Documentation](https://pursuit.purescript.org/packages/purescript-smolder/)

## Usage

Write HTML elements as functions, with the `!` combinator to add attributes, and do notation to add child elements:

```purescript
doc = html ! lang "en" $ do
  h1 $ text "My HTML Document"
  p $ do
    text "This is my HTML document. It is "
    em $ text "very"
    text " nice. "
    a ! href "more.html" $ text "There is more."
```

You can render lists of items inside the do notation using `traverse_` or `for_`:

```purescript
import Data.Foldable (for_, traverse_)

items = ["fear", "surprise", "ruthless efficiency"]

item i = li $ text i

bulletList = ul $ do
  for_ items item
  -- or traverse_ item items
```

(Note that the `Data.Foldable` versions of `traverse_` and `for_` can blow the stack if you have a lot of items (just short of 10k items will do it), but because `Markup` has a `MonadRec` instance, you can use the implementations from [purescript-safely](https://pursuit.purescript.org/packages/purescript-safely/) if you're worried about this.)

Use the `#!` combinator to attach event handlers:

```purescript
import Control.Monad.Eff.Console (log)

doc = div ! className "not-a-form" $ do
  button #! on "click" (\event → log "boom!") $ text "boom"
```

You can render the markup to a string:

```purescript
import Text.Smolder.Renderer.String (render)

doc = html ! lang "en" $ do
  body $ do
    h1 $ text "Hello Joe"

docAsString = render doc
-- "<html lang=\"en\"><body><h1>Hello Joe</h1></body></html>"
```

There are other renderers available, such as [a renderer for DOM nodes](https://pursuit.purescript.org/packages/purescript-smolder-dom).

### Types

The type of the markup is `Markup e`, where the `e` is the type of the event handler, which is only important when you want to render your markup. For rendering to the DOM, this would have to be `EventListener (dom :: DOM | eff)`. The string renderer accepts any type for `e`, as it ignores event handlers altogether.

`Markup e` is a type alias for `Free (MarkupM e) Unit`, a free monad over markup nodes, but you don't need to worry about free monads at all. Unless you're writing your own renderer, you should just use `Markup e` in your own code.

## Licence

Copyright 2015 Bodil Stokke

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU Lesser General Public License as
published by the Free Software Foundation, either version 3 of the
License, or (at your option) any later version.

This program is distributed in the hope that it will be useful, but
WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
Lesser General Public License for more details.

You should have received a copy of the GNU Lesser General Public
License along with this program. If not, see
<http://www.gnu.org/licenses/>.
