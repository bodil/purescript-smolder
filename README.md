# Module Documentation

A simple combinator library for generating HTML in PureScript, heavily
inspired by Haskell's [BlazeHtml](http://jaspervdj.be/blaze/).

```purescript
module Main where

import Text.Smolder.HTML (html, head, meta, link, title, body, h1, p)
import Text.Smolder.HTML.Attributes (lang, charset, httpEquiv, content, name, rel, href)
import Text.Smolder.Markup (text, (!))
import Text.Smolder.Renderer.String (render)
import Debug.Trace

doc = html ! lang "en" $ do
  head $ do
    meta ! charset "utf-8"
    meta ! httpEquiv "X-UA-Compatible" ! content "IE=edge,chrome=1"
    title $ text "OMG HAI LOL"
    meta ! name "description" ! content "YES OMG HAI LOL"
    meta ! name "viewport" ! content "width=device-width"
    link ! rel "stylesheet" ! href "css/screen.css"
  body $ do
    h1 $ text "OMG HAI LOL"
    p $ text "This is clearly the best HTML DSL ever invented."

main = trace $ render doc
```

## Module Text.Smolder.HTML.Attributes

### Values

    accept :: String -> Attribute

    acceptCharset :: String -> Attribute

    accesskey :: String -> Attribute

    action :: String -> Attribute

    alt :: String -> Attribute

    async :: String -> Attribute

    autocomplete :: String -> Attribute

    autofocus :: String -> Attribute

    autoplay :: String -> Attribute

    challenge :: String -> Attribute

    charset :: String -> Attribute

    checked :: String -> Attribute

    cite :: String -> Attribute

    className :: String -> Attribute

    cols :: String -> Attribute

    colspan :: String -> Attribute

    content :: String -> Attribute

    contenteditable :: String -> Attribute

    contextmenu :: String -> Attribute

    controls :: String -> Attribute

    coords :: String -> Attribute

    data' :: String -> Attribute

    datetime :: String -> Attribute

    defer :: String -> Attribute

    dir :: String -> Attribute

    disabled :: String -> Attribute

    draggable :: String -> Attribute

    enctype :: String -> Attribute

    for :: String -> Attribute

    form :: String -> Attribute

    formaction :: String -> Attribute

    formenctype :: String -> Attribute

    formmethod :: String -> Attribute

    formnovalidate :: String -> Attribute

    formtarget :: String -> Attribute

    headers :: String -> Attribute

    height :: String -> Attribute

    hidden :: String -> Attribute

    high :: String -> Attribute

    href :: String -> Attribute

    hreflang :: String -> Attribute

    httpEquiv :: String -> Attribute

    icon :: String -> Attribute

    id :: String -> Attribute

    ismap :: String -> Attribute

    item :: String -> Attribute

    itemprop :: String -> Attribute

    keytype :: String -> Attribute

    label :: String -> Attribute

    lang :: String -> Attribute

    list :: String -> Attribute

    loop :: String -> Attribute

    low :: String -> Attribute

    manifest :: String -> Attribute

    max :: String -> Attribute

    maxlength :: String -> Attribute

    media :: String -> Attribute

    method :: String -> Attribute

    min :: String -> Attribute

    multiple :: String -> Attribute

    name :: String -> Attribute

    novalidate :: String -> Attribute

    onbeforeonload :: String -> Attribute

    onbeforeprint :: String -> Attribute

    onblur :: String -> Attribute

    oncanplay :: String -> Attribute

    oncanplaythrough :: String -> Attribute

    onchange :: String -> Attribute

    onclick :: String -> Attribute

    oncontextmenu :: String -> Attribute

    ondblclick :: String -> Attribute

    ondrag :: String -> Attribute

    ondragend :: String -> Attribute

    ondragenter :: String -> Attribute

    ondragleave :: String -> Attribute

    ondragover :: String -> Attribute

    ondragstart :: String -> Attribute

    ondrop :: String -> Attribute

    ondurationchange :: String -> Attribute

    onemptied :: String -> Attribute

    onended :: String -> Attribute

    onerror :: String -> Attribute

    onfocus :: String -> Attribute

    onformchange :: String -> Attribute

    onforminput :: String -> Attribute

    onhaschange :: String -> Attribute

    oninput :: String -> Attribute

    oninvalid :: String -> Attribute

    onkeydown :: String -> Attribute

    onkeyup :: String -> Attribute

    onload :: String -> Attribute

    onloadeddata :: String -> Attribute

    onloadedmetadata :: String -> Attribute

    onloadstart :: String -> Attribute

    onmessage :: String -> Attribute

    onmousedown :: String -> Attribute

    onmousemove :: String -> Attribute

    onmouseout :: String -> Attribute

    onmouseover :: String -> Attribute

    onmouseup :: String -> Attribute

    onmousewheel :: String -> Attribute

    ononline :: String -> Attribute

    onpagehide :: String -> Attribute

    onpageshow :: String -> Attribute

    onpause :: String -> Attribute

    onplay :: String -> Attribute

    onplaying :: String -> Attribute

    onprogress :: String -> Attribute

    onpropstate :: String -> Attribute

    onratechange :: String -> Attribute

    onreadystatechange :: String -> Attribute

    onredo :: String -> Attribute

    onresize :: String -> Attribute

    onscroll :: String -> Attribute

    onseeked :: String -> Attribute

    onseeking :: String -> Attribute

    onselect :: String -> Attribute

    onstalled :: String -> Attribute

    onstorage :: String -> Attribute

    onsubmit :: String -> Attribute

    onsuspend :: String -> Attribute

    ontimeupdate :: String -> Attribute

    onundo :: String -> Attribute

    onunload :: String -> Attribute

    onvolumechange :: String -> Attribute

    onwaiting :: String -> Attribute

    open :: String -> Attribute

    optimum :: String -> Attribute

    pattern :: String -> Attribute

    ping :: String -> Attribute

    placeholder :: String -> Attribute

    preload :: String -> Attribute

    pubdate :: String -> Attribute

    radiogroup :: String -> Attribute

    readonly :: String -> Attribute

    rel :: String -> Attribute

    required :: String -> Attribute

    reversed :: String -> Attribute

    rows :: String -> Attribute

    rowspan :: String -> Attribute

    sandbox :: String -> Attribute

    scope :: String -> Attribute

    scoped :: String -> Attribute

    seamless :: String -> Attribute

    selected :: String -> Attribute

    shape :: String -> Attribute

    size :: String -> Attribute

    sizes :: String -> Attribute

    span :: String -> Attribute

    spellcheck :: String -> Attribute

    src :: String -> Attribute

    srcdoc :: String -> Attribute

    start :: String -> Attribute

    step :: String -> Attribute

    style :: String -> Attribute

    subject :: String -> Attribute

    summary :: String -> Attribute

    tabindex :: String -> Attribute

    target :: String -> Attribute

    title :: String -> Attribute

    type' :: String -> Attribute

    usemap :: String -> Attribute

    value :: String -> Attribute

    width :: String -> Attribute

    wrap :: String -> Attribute

    xmlns :: String -> Attribute


## Module Text.Smolder.HTML

### Types

    type Html = Markup


### Values

    a :: Markup -> Markup

    abbr :: Markup -> Markup

    address :: Markup -> Markup

    area :: Markup

    article :: Markup -> Markup

    aside :: Markup -> Markup

    audio :: Markup -> Markup

    b :: Markup -> Markup

    base :: Markup

    bdo :: Markup -> Markup

    blockquote :: Markup -> Markup

    body :: Markup -> Markup

    br :: Markup

    button :: Markup -> Markup

    canvas :: Markup -> Markup

    caption :: Markup -> Markup

    cite :: Markup -> Markup

    code :: Markup -> Markup

    col :: Markup

    colgroup :: Markup -> Markup

    command :: Markup -> Markup

    datalist :: Markup -> Markup

    dd :: Markup -> Markup

    del :: Markup -> Markup

    details :: Markup -> Markup

    dfn :: Markup -> Markup

    div :: Markup -> Markup

    dl :: Markup -> Markup

    dt :: Markup -> Markup

    em :: Markup -> Markup

    embed :: Markup

    fieldset :: Markup -> Markup

    figcaption :: Markup -> Markup

    figure :: Markup -> Markup

    footer :: Markup -> Markup

    form :: Markup -> Markup

    h1 :: Markup -> Markup

    h2 :: Markup -> Markup

    h3 :: Markup -> Markup

    h4 :: Markup -> Markup

    h5 :: Markup -> Markup

    h6 :: Markup -> Markup

    head :: Markup -> Markup

    header :: Markup -> Markup

    hgroup :: Markup -> Markup

    hr :: Markup

    html :: Markup -> Markup

    i :: Markup -> Markup

    iframe :: Markup -> Markup

    img :: Markup

    input :: Markup

    ins :: Markup -> Markup

    kbd :: Markup -> Markup

    keygen :: Markup

    label :: Markup -> Markup

    legend :: Markup -> Markup

    li :: Markup -> Markup

    link :: Markup

    map :: Markup -> Markup

    mark :: Markup -> Markup

    menu :: Markup -> Markup

    menuitem :: Markup

    meta :: Markup

    meter :: Markup -> Markup

    nav :: Markup -> Markup

    noscript :: Markup -> Markup

    object :: Markup -> Markup

    ol :: Markup -> Markup

    optgroup :: Markup -> Markup

    option :: Markup -> Markup

    output :: Markup -> Markup

    p :: Markup -> Markup

    param :: Markup

    pre :: Markup -> Markup

    progress :: Markup -> Markup

    q :: Markup -> Markup

    rp :: Markup -> Markup

    rt :: Markup -> Markup

    ruby :: Markup -> Markup

    samp :: Markup -> Markup

    script :: Markup -> Markup

    section :: Markup -> Markup

    select :: Markup -> Markup

    small :: Markup -> Markup

    source :: Markup

    span :: Markup -> Markup

    strong :: Markup -> Markup

    style :: Markup -> Markup

    sub :: Markup -> Markup

    summary :: Markup -> Markup

    sup :: Markup -> Markup

    table :: Markup -> Markup

    tbody :: Markup -> Markup

    td :: Markup -> Markup

    textarea :: Markup -> Markup

    tfoot :: Markup -> Markup

    th :: Markup -> Markup

    thead :: Markup -> Markup

    time :: Markup -> Markup

    title :: Markup -> Markup

    tr :: Markup -> Markup

    track :: Markup

    ul :: Markup -> Markup

    var :: Markup -> Markup

    video :: Markup -> Markup

    wbr :: Markup


## Module Text.Smolder.Markup

### Types

    data Attr where
      Attr :: String -> String -> Attr

    data Attribute

    type Markup = MarkupM Unit

    data MarkupM a where
      Element :: String -> Maybe Markup -> [Attr] -> MarkupM a -> MarkupM a
      Content :: String -> MarkupM a -> MarkupM a
      Return :: a -> MarkupM a


### Type Classes

    class Attributable a where
      (!) :: a -> Attribute -> a


### Type Class Instances

    instance applicativeMarkupM :: Applicative MarkupM

    instance applyMarkupM :: Apply MarkupM

    instance attributableMarkupM :: Attributable (MarkupM Unit)

    instance attributableMarkupMF :: Attributable (MarkupM Unit -> MarkupM Unit)

    instance bindMarkupM :: Bind MarkupM

    instance functorMarkupM :: Functor MarkupM

    instance monadMarkupM :: Monad MarkupM

    instance monoidAttribute :: Monoid Attribute

    instance monoidMarkup :: Monoid (MarkupM Unit)

    instance semigroupAttribute :: Semigroup Attribute

    instance semigroupMarkupM :: Semigroup (MarkupM a)


### Values

    (!?) :: forall h. (Attributable h) => h -> Boolean -> Attribute -> h

    attribute :: String -> String -> Attribute

    leaf :: String -> Markup

    parent :: String -> Markup -> Markup

    text :: forall a. String -> Markup


## Module Text.Smolder.Renderer.String

### Type Class Instances

    instance showMarkup :: Show (Markup.MarkupM Unit)

    instance showNode :: Show Node


### Values

    render :: forall a. Markup.MarkupM a -> String

    renderNode :: Node -> String


## Module Text.Smolder.Renderer.Util

### Types

    data Node where
      Element :: String -> Map.Map String String -> [Node] -> Node
      Text :: String -> Node


### Values

    renderMarkup :: forall a. Markup.MarkupM a -> [Node]


## Module Text.Smolder.Renderer.VTree

### Types

    data VNode :: *


### Type Class Instances

    instance showVNode :: Show VNode


### Values

    render :: forall a. Markup.MarkupM a -> VNode

    render' :: forall a. Markup.MarkupM a -> [VNode]



