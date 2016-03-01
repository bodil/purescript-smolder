module Text.Smolder.HTML where

import Text.Smolder.Markup

type Html = Markup

a :: Markup -> Markup
a = parent "a"
abbr :: Markup -> Markup
abbr = parent "abbr"
address :: Markup -> Markup
address = parent "address"
article :: Markup -> Markup
article = parent "article"
aside :: Markup -> Markup
aside = parent "aside"
audio :: Markup -> Markup
audio = parent "audio"
b :: Markup -> Markup
b = parent "b"
bdo :: Markup -> Markup
bdo = parent "bdo"
blockquote :: Markup -> Markup
blockquote = parent "blockquote"
body :: Markup -> Markup
body = parent "body"
button :: Markup -> Markup
button = parent "button"
canvas :: Markup -> Markup
canvas = parent "canvas"
caption :: Markup -> Markup
caption = parent "caption"
cite :: Markup -> Markup
cite = parent "cite"
code :: Markup -> Markup
code = parent "code"
colgroup :: Markup -> Markup
colgroup = parent "colgroup"
command :: Markup -> Markup
command = parent "command"
datalist :: Markup -> Markup
datalist = parent "datalist"
dd :: Markup -> Markup
dd = parent "dd"
del :: Markup -> Markup
del = parent "del"
details :: Markup -> Markup
details = parent "details"
dfn :: Markup -> Markup
dfn = parent "dfn"
div :: Markup -> Markup
div = parent "div"
dl :: Markup -> Markup
dl = parent "dl"
dt :: Markup -> Markup
dt = parent "dt"
em :: Markup -> Markup
em = parent "em"
fieldset :: Markup -> Markup
fieldset = parent "fieldset"
figcaption :: Markup -> Markup
figcaption = parent "figcaption"
figure :: Markup -> Markup
figure = parent "figure"
footer :: Markup -> Markup
footer = parent "footer"
form :: Markup -> Markup
form = parent "form"
h1 :: Markup -> Markup
h1 = parent "h1"
h2 :: Markup -> Markup
h2 = parent "h2"
h3 :: Markup -> Markup
h3 = parent "h3"
h4 :: Markup -> Markup
h4 = parent "h4"
h5 :: Markup -> Markup
h5 = parent "h5"
h6 :: Markup -> Markup
h6 = parent "h6"
head :: Markup -> Markup
head = parent "head"
header :: Markup -> Markup
header = parent "header"
hgroup :: Markup -> Markup
hgroup = parent "hgroup"
html :: Markup -> Markup
html = parent "html"
i :: Markup -> Markup
i = parent "i"
iframe :: Markup -> Markup
iframe = parent "iframe"
ins :: Markup -> Markup
ins = parent "ins"
kbd :: Markup -> Markup
kbd = parent "kbd"
label :: Markup -> Markup
label = parent "label"
legend :: Markup -> Markup
legend = parent "legend"
li :: Markup -> Markup
li = parent "li"
map :: Markup -> Markup
map = parent "map"
mark :: Markup -> Markup
mark = parent "mark"
menu :: Markup -> Markup
menu = parent "menu"
meter :: Markup -> Markup
meter = parent "meter"
nav :: Markup -> Markup
nav = parent "nav"
noscript :: Markup -> Markup
noscript = parent "noscript"
object :: Markup -> Markup
object = parent "object"
ol :: Markup -> Markup
ol = parent "ol"
optgroup :: Markup -> Markup
optgroup = parent "optgroup"
option :: Markup -> Markup
option = parent "option"
output :: Markup -> Markup
output = parent "output"
p :: Markup -> Markup
p = parent "p"
pre :: Markup -> Markup
pre = parent "pre"
progress :: Markup -> Markup
progress = parent "progress"
q :: Markup -> Markup
q = parent "q"
rp :: Markup -> Markup
rp = parent "rp"
rt :: Markup -> Markup
rt = parent "rt"
ruby :: Markup -> Markup
ruby = parent "ruby"
samp :: Markup -> Markup
samp = parent "samp"
script :: Markup -> Markup
script = parent "script"
section :: Markup -> Markup
section = parent "section"
select :: Markup -> Markup
select = parent "select"
small :: Markup -> Markup
small = parent "small"
span :: Markup -> Markup
span = parent "span"
strong :: Markup -> Markup
strong = parent "strong"
style :: Markup -> Markup
style = parent "style"
sub :: Markup -> Markup
sub = parent "sub"
summary :: Markup -> Markup
summary = parent "summary"
sup :: Markup -> Markup
sup = parent "sup"
table :: Markup -> Markup
table = parent "table"
tbody :: Markup -> Markup
tbody = parent "tbody"
td :: Markup -> Markup
td = parent "td"
textarea :: Markup -> Markup
textarea = parent "textarea"
tfoot :: Markup -> Markup
tfoot = parent "tfoot"
th :: Markup -> Markup
th = parent "th"
thead :: Markup -> Markup
thead = parent "thead"
time :: Markup -> Markup
time = parent "time"
title :: Markup -> Markup
title = parent "title"
tr :: Markup -> Markup
tr = parent "tr"
ul :: Markup -> Markup
ul = parent "ul"
var :: Markup -> Markup
var = parent "var"
video :: Markup -> Markup
video = parent "video"
area :: Markup
area = leaf "area"
base :: Markup
base = leaf "base"
br :: Markup
br = leaf "br"
col :: Markup
col = leaf "col"
embed :: Markup
embed = leaf "embed"
hr :: Markup
hr = leaf "hr"
img :: Markup
img = leaf "img"
input :: Markup
input = leaf "input"
keygen :: Markup
keygen = leaf "keygen"
link :: Markup
link = leaf "link"
menuitem :: Markup
menuitem = leaf "menuitem"
meta :: Markup
meta = leaf "meta"
param :: Markup
param = leaf "param"
source :: Markup
source = leaf "source"
track :: Markup
track = leaf "track"
wbr :: Markup
wbr = leaf "wbr"
