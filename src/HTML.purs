module Text.Smolder.HTML where

import Prelude ()
import Text.Smolder.Markup

type Html = Markup

a :: Markup -> Markup
a = Parent "a"
abbr :: Markup -> Markup
abbr = Parent "abbr"
address :: Markup -> Markup
address = Parent "address"
article :: Markup -> Markup
article = Parent "article"
aside :: Markup -> Markup
aside = Parent "aside"
audio :: Markup -> Markup
audio = Parent "audio"
b :: Markup -> Markup
b = Parent "b"
bdo :: Markup -> Markup
bdo = Parent "bdo"
blockquote :: Markup -> Markup
blockquote = Parent "blockquote"
body :: Markup -> Markup
body = Parent "body"
button :: Markup -> Markup
button = Parent "button"
canvas :: Markup -> Markup
canvas = Parent "canvas"
caption :: Markup -> Markup
caption = Parent "caption"
cite :: Markup -> Markup
cite = Parent "cite"
code :: Markup -> Markup
code = Parent "code"
colgroup :: Markup -> Markup
colgroup = Parent "colgroup"
command :: Markup -> Markup
command = Parent "command"
datalist :: Markup -> Markup
datalist = Parent "datalist"
dd :: Markup -> Markup
dd = Parent "dd"
del :: Markup -> Markup
del = Parent "del"
details :: Markup -> Markup
details = Parent "details"
dfn :: Markup -> Markup
dfn = Parent "dfn"
div :: Markup -> Markup
div = Parent "div"
dl :: Markup -> Markup
dl = Parent "dl"
dt :: Markup -> Markup
dt = Parent "dt"
em :: Markup -> Markup
em = Parent "em"
fieldset :: Markup -> Markup
fieldset = Parent "fieldset"
figcaption :: Markup -> Markup
figcaption = Parent "figcaption"
figure :: Markup -> Markup
figure = Parent "figure"
footer :: Markup -> Markup
footer = Parent "footer"
form :: Markup -> Markup
form = Parent "form"
h1 :: Markup -> Markup
h1 = Parent "h1"
h2 :: Markup -> Markup
h2 = Parent "h2"
h3 :: Markup -> Markup
h3 = Parent "h3"
h4 :: Markup -> Markup
h4 = Parent "h4"
h5 :: Markup -> Markup
h5 = Parent "h5"
h6 :: Markup -> Markup
h6 = Parent "h6"
head :: Markup -> Markup
head = Parent "head"
header :: Markup -> Markup
header = Parent "header"
hgroup :: Markup -> Markup
hgroup = Parent "hgroup"
html :: Markup -> Markup
html = Parent "html"
i :: Markup -> Markup
i = Parent "i"
iframe :: Markup -> Markup
iframe = Parent "iframe"
ins :: Markup -> Markup
ins = Parent "ins"
kbd :: Markup -> Markup
kbd = Parent "kbd"
label :: Markup -> Markup
label = Parent "label"
legend :: Markup -> Markup
legend = Parent "legend"
li :: Markup -> Markup
li = Parent "li"
map :: Markup -> Markup
map = Parent "map"
mark :: Markup -> Markup
mark = Parent "mark"
menu :: Markup -> Markup
menu = Parent "menu"
meter :: Markup -> Markup
meter = Parent "meter"
nav :: Markup -> Markup
nav = Parent "nav"
noscript :: Markup -> Markup
noscript = Parent "noscript"
object :: Markup -> Markup
object = Parent "object"
ol :: Markup -> Markup
ol = Parent "ol"
optgroup :: Markup -> Markup
optgroup = Parent "optgroup"
option :: Markup -> Markup
option = Parent "option"
output :: Markup -> Markup
output = Parent "output"
p :: Markup -> Markup
p = Parent "p"
pre :: Markup -> Markup
pre = Parent "pre"
progress :: Markup -> Markup
progress = Parent "progress"
q :: Markup -> Markup
q = Parent "q"
rp :: Markup -> Markup
rp = Parent "rp"
rt :: Markup -> Markup
rt = Parent "rt"
ruby :: Markup -> Markup
ruby = Parent "ruby"
samp :: Markup -> Markup
samp = Parent "samp"
script :: Markup -> Markup
script = Parent "script"
section :: Markup -> Markup
section = Parent "section"
select :: Markup -> Markup
select = Parent "select"
small :: Markup -> Markup
small = Parent "small"
span :: Markup -> Markup
span = Parent "span"
strong :: Markup -> Markup
strong = Parent "strong"
style :: Markup -> Markup
style = Parent "style"
sub :: Markup -> Markup
sub = Parent "sub"
summary :: Markup -> Markup
summary = Parent "summary"
sup :: Markup -> Markup
sup = Parent "sup"
table :: Markup -> Markup
table = Parent "table"
tbody :: Markup -> Markup
tbody = Parent "tbody"
td :: Markup -> Markup
td = Parent "td"
textarea :: Markup -> Markup
textarea = Parent "textarea"
tfoot :: Markup -> Markup
tfoot = Parent "tfoot"
th :: Markup -> Markup
th = Parent "th"
thead :: Markup -> Markup
thead = Parent "thead"
time :: Markup -> Markup
time = Parent "time"
title :: Markup -> Markup
title = Parent "title"
tr :: Markup -> Markup
tr = Parent "tr"
ul :: Markup -> Markup
ul = Parent "ul"
var :: Markup -> Markup
var = Parent "var"
video :: Markup -> Markup
video = Parent "video"
area :: Markup
area = Leaf "area"
base :: Markup
base = Leaf "base"
br :: Markup
br = Leaf "br"
col :: Markup
col = Leaf "col"
embed :: Markup
embed = Leaf "embed"
hr :: Markup
hr = Leaf "hr"
img :: Markup
img = Leaf "img"
input :: Markup
input = Leaf "input"
keygen :: Markup
keygen = Leaf "keygen"
link :: Markup
link = Leaf "link"
menuitem :: Markup
menuitem = Leaf "menuitem"
meta :: Markup
meta = Leaf "meta"
param :: Markup
param = Leaf "param"
source :: Markup
source = Leaf "source"
track :: Markup
track = Leaf "track"
wbr :: Markup
wbr = Leaf "wbr"
