module Text.Smolder.SVG where

import Text.Smolder.Markup (Markup, NS(..))
import Text.Smolder.Markup (parent, leaf) as M

type Svg e = Markup e

parent :: ∀ e. String → Markup e → Markup e
parent = M.parent SVGns

leaf :: ∀ e. String → Markup e
leaf = M.leaf SVGns

a :: forall e. Markup e -> Markup e
a = parent "a"
altGlyph :: forall e. Markup e -> Markup e
altGlyph = parent "altGlyph"
altGlyphDef :: forall e. Markup e -> Markup e
altGlyphDef = parent "altGlyphDef"
altGlyphItem :: forall e. Markup e -> Markup e
altGlyphItem = parent "altGlyphItem"
animate :: forall e. Markup e -> Markup e
animate = parent "animate"
animateColor :: forall e. Markup e -> Markup e
animateColor = parent "animateColor"
animateMotion :: forall e. Markup e -> Markup e
animateMotion = parent "animateMotion"
animateTransform :: forall e. Markup e -> Markup e
animateTransform = parent "animateTransform"
audio :: forall e. Markup e -> Markup e
audio = parent "audio"
canvas :: forall e. Markup e -> Markup e
canvas = parent "canvas"
circle :: forall e. Markup e
circle = leaf "circle"
clipPath :: forall e. Markup e -> Markup e
clipPath = parent "clipPath"
colorProfile :: forall e. Markup e -> Markup e
colorProfile = parent "color-profile"
cursor :: forall e. Markup e -> Markup e
cursor = parent "cursor"
defs :: forall e. Markup e -> Markup e
defs = parent "defs"
desc :: forall e. Markup e -> Markup e
desc = parent "desc"
discard :: forall e. Markup e -> Markup e
discard = parent "discard"
ellipse :: forall e. Markup e
ellipse = leaf "ellipse"
feBlend :: forall e. Markup e -> Markup e
feBlend = parent "feBlend"
feColorMatrix :: forall e. Markup e -> Markup e
feColorMatrix = parent "feColorMatrix"
feComponentTransfer :: forall e. Markup e -> Markup e
feComponentTransfer = parent "feComponentTransfer"
feComposite :: forall e. Markup e -> Markup e
feComposite = parent "feComposite"
feConvolveMatrix :: forall e. Markup e -> Markup e
feConvolveMatrix = parent "feConvolveMatrix"
feDiffuseLighting :: forall e. Markup e -> Markup e
feDiffuseLighting = parent "feDiffuseLighting"
feDisplacementMap :: forall e. Markup e -> Markup e
feDisplacementMap = parent "feDisplacementMap"
feDistantLight :: forall e. Markup e -> Markup e
feDistantLight = parent "feDistantLight"
feDropShadow :: forall e. Markup e -> Markup e
feDropShadow = parent "feDropShadow"
feFlood :: forall e. Markup e -> Markup e
feFlood = parent "feFlood"
feFuncA :: forall e. Markup e -> Markup e
feFuncA = parent "feFuncA"
feFuncB :: forall e. Markup e -> Markup e
feFuncB = parent "feFuncB"
feFuncG :: forall e. Markup e -> Markup e
feFuncG = parent "feFuncG"
feFuncR :: forall e. Markup e -> Markup e
feFuncR = parent "feFuncR"
feGaussianBlur :: forall e. Markup e -> Markup e
feGaussianBlur = parent "feGaussianBlur"
feImage :: forall e. Markup e -> Markup e
feImage = parent "feImage"
feMerge :: forall e. Markup e -> Markup e
feMerge = parent "feMerge"
feMergeNode :: forall e. Markup e -> Markup e
feMergeNode = parent "feMergeNode"
feMorphology :: forall e. Markup e -> Markup e
feMorphology = parent "feMorphology"
feOffset :: forall e. Markup e -> Markup e
feOffset = parent "feOffset"
fePointLight :: forall e. Markup e -> Markup e
fePointLight = parent "fePointLight"
feSpecularLighting :: forall e. Markup e -> Markup e
feSpecularLighting = parent "feSpecularLighting"
feSpotLight :: forall e. Markup e -> Markup e
feSpotLight = parent "feSpotLight"
feTile :: forall e. Markup e -> Markup e
feTile = parent "feTile"
feTurbulence :: forall e. Markup e -> Markup e
feTurbulence = parent "feTurbulence"
filter :: forall e. Markup e -> Markup e
filter = parent "filter"
font :: forall e. Markup e -> Markup e
font = parent "font"
fontFace :: forall e. Markup e -> Markup e
fontFace = parent "font-face"
fontFaceFormat :: forall e. Markup e -> Markup e
fontFaceFormat = parent "font-face-format"
fontFaceName :: forall e. Markup e -> Markup e
fontFaceName = parent "font-face-name"
fontFaceSrc :: forall e. Markup e -> Markup e
fontFaceSrc = parent "font-face-src"
fontFaceUri :: forall e. Markup e -> Markup e
fontFaceUri = parent "font-face-uri"
foreignObject :: forall e. Markup e -> Markup e
foreignObject = parent "foreignObject"
g :: forall e. Markup e -> Markup e
g = parent "g"
glyph :: forall e. Markup e -> Markup e
glyph = parent "glyph"
glyphRef :: forall e. Markup e -> Markup e
glyphRef = parent "glyphRef"
hatch :: forall e. Markup e -> Markup e
hatch = parent "hatch"
hatchpath :: forall e. Markup e -> Markup e
hatchpath = parent "hatchpath"
hkern :: forall e. Markup e -> Markup e
hkern = parent "hkern"
iframe :: forall e. Markup e -> Markup e
iframe = parent "iframe"
image :: forall e. Markup e -> Markup e
image = parent "image"
line :: forall e. Markup e
line = leaf "line"
linearGradient :: forall e. Markup e -> Markup e
linearGradient = parent "linearGradient"
marker :: forall e. Markup e -> Markup e
marker = parent "marker"
mask :: forall e. Markup e -> Markup e
mask = parent "mask"
mesh :: forall e. Markup e -> Markup e
mesh = parent "mesh"
meshgradient :: forall e. Markup e -> Markup e
meshgradient = parent "meshgradient"
meshpatch :: forall e. Markup e -> Markup e
meshpatch = parent "meshpatch"
meshrow :: forall e. Markup e -> Markup e
meshrow = parent "meshrow"
metadata :: forall e. Markup e -> Markup e
metadata = parent "metadata"
missingGlyph :: forall e. Markup e -> Markup e
missingGlyph = parent "missing-glyph"
mpath :: forall e. Markup e -> Markup e
mpath = parent "mpath"
path :: forall e. Markup e -> Markup e
path = parent "path"
pattern :: forall e. Markup e -> Markup e
pattern = parent "pattern"
polygon :: forall e. Markup e
polygon = leaf "polygon"
polyline :: forall e. Markup e
polyline = leaf "polyline"
radialGradient :: forall e. Markup e -> Markup e
radialGradient = parent "radialGradient"
rect :: forall e. Markup e
rect = leaf "rect"
script :: forall e. Markup e -> Markup e
script = parent "script"
set :: forall e. Markup e -> Markup e
set = parent "set"
solidcolor :: forall e. Markup e -> Markup e
solidcolor = parent "solidcolor"
stop :: forall e. Markup e -> Markup e
stop = parent "stop"
style :: forall e. Markup e -> Markup e
style = parent "style"
svg :: forall e. Markup e -> Markup e
svg = parent "svg"
switch :: forall e. Markup e -> Markup e
switch = parent "switch"
symbol :: forall e. Markup e -> Markup e
symbol = parent "symbol"
text :: forall e. Markup e -> Markup e
text = parent "text"
textPath :: forall e. Markup e -> Markup e
textPath = parent "textPath"
title :: forall e. Markup e -> Markup e
title = parent "title"
tref :: forall e. Markup e -> Markup e
tref = parent "tref"
tspan :: forall e. Markup e -> Markup e
tspan = parent "tspan"
unknown :: forall e. Markup e -> Markup e
unknown = parent "unknown"
use :: forall e. Markup e -> Markup e
use = parent "use"
video :: forall e. Markup e -> Markup e
video = parent "video"
view :: forall e. Markup e -> Markup e
view = parent "view"
vkern :: forall e. Markup e -> Markup e
vkern = parent "vkern"
