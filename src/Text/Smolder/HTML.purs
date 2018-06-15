module Text.Smolder.HTML where

import Text.Smolder.Markup (Markup, NS(..))
import Text.Smolder.Markup (parent, leaf) as M

type Html e = Markup e

parent :: ∀ e. String → Markup e → Markup e
parent = M.parent HTMLns

leaf :: ∀ e. String → Markup e
leaf = M.leaf HTMLns

a :: forall e. Markup e -> Markup e
a = parent "a"
abbr :: forall e. Markup e -> Markup e
abbr = parent "abbr"
address :: forall e. Markup e -> Markup e
address = parent "address"
article :: forall e. Markup e -> Markup e
article = parent "article"
aside :: forall e. Markup e -> Markup e
aside = parent "aside"
audio :: forall e. Markup e -> Markup e
audio = parent "audio"
b :: forall e. Markup e -> Markup e
b = parent "b"
bdi :: forall e. Markup e -> Markup e
bdi = parent "bdi"
bdo :: forall e. Markup e -> Markup e
bdo = parent "bdo"
blockquote :: forall e. Markup e -> Markup e
blockquote = parent "blockquote"
body :: forall e. Markup e -> Markup e
body = parent "body"
button :: forall e. Markup e -> Markup e
button = parent "button"
canvas :: forall e. Markup e -> Markup e
canvas = parent "canvas"
caption :: forall e. Markup e -> Markup e
caption = parent "caption"
cite :: forall e. Markup e -> Markup e
cite = parent "cite"
code :: forall e. Markup e -> Markup e
code = parent "code"
colgroup :: forall e. Markup e -> Markup e
colgroup = parent "colgroup"
command :: forall e. Markup e -> Markup e
command = parent "command"
data' :: forall e. Markup e -> Markup e
data' = parent "data"
datalist :: forall e. Markup e -> Markup e
datalist = parent "datalist"
dd :: forall e. Markup e -> Markup e
dd = parent "dd"
del :: forall e. Markup e -> Markup e
del = parent "del"
details :: forall e. Markup e -> Markup e
details = parent "details"
dialog :: forall e. Markup e -> Markup e
dialog = parent "dialog"
dfn :: forall e. Markup e -> Markup e
dfn = parent "dfn"
div :: forall e. Markup e -> Markup e
div = parent "div"
dl :: forall e. Markup e -> Markup e
dl = parent "dl"
dt :: forall e. Markup e -> Markup e
dt = parent "dt"
em :: forall e. Markup e -> Markup e
em = parent "em"
fieldset :: forall e. Markup e -> Markup e
fieldset = parent "fieldset"
figcaption :: forall e. Markup e -> Markup e
figcaption = parent "figcaption"
figure :: forall e. Markup e -> Markup e
figure = parent "figure"
footer :: forall e. Markup e -> Markup e
footer = parent "footer"
form :: forall e. Markup e -> Markup e
form = parent "form"
h1 :: forall e. Markup e -> Markup e
h1 = parent "h1"
h2 :: forall e. Markup e -> Markup e
h2 = parent "h2"
h3 :: forall e. Markup e -> Markup e
h3 = parent "h3"
h4 :: forall e. Markup e -> Markup e
h4 = parent "h4"
h5 :: forall e. Markup e -> Markup e
h5 = parent "h5"
h6 :: forall e. Markup e -> Markup e
h6 = parent "h6"
head :: forall e. Markup e -> Markup e
head = parent "head"
header :: forall e. Markup e -> Markup e
header = parent "header"
hgroup :: forall e. Markup e -> Markup e
hgroup = parent "hgroup"
html :: forall e. Markup e -> Markup e
html = parent "html"
i :: forall e. Markup e -> Markup e
i = parent "i"
iframe :: forall e. Markup e -> Markup e
iframe = parent "iframe"
ins :: forall e. Markup e -> Markup e
ins = parent "ins"
kbd :: forall e. Markup e -> Markup e
kbd = parent "kbd"
label :: forall e. Markup e -> Markup e
label = parent "label"
legend :: forall e. Markup e -> Markup e
legend = parent "legend"
li :: forall e. Markup e -> Markup e
li = parent "li"
main ::forall e. Markup e -> Markup e
main = parent "main"
map :: forall e. Markup e -> Markup e
map = parent "map"
mark :: forall e. Markup e -> Markup e
mark = parent "mark"
menu :: forall e. Markup e -> Markup e
menu = parent "menu"
meter :: forall e. Markup e -> Markup e
meter = parent "meter"
nav :: forall e. Markup e -> Markup e
nav = parent "nav"
noscript :: forall e. Markup e -> Markup e
noscript = parent "noscript"
object :: forall e. Markup e -> Markup e
object = parent "object"
ol :: forall e. Markup e -> Markup e
ol = parent "ol"
optgroup :: forall e. Markup e -> Markup e
optgroup = parent "optgroup"
option :: forall e. Markup e -> Markup e
option = parent "option"
output :: forall e. Markup e -> Markup e
output = parent "output"
p :: forall e. Markup e -> Markup e
p = parent "p"
picture :: forall e. Markup e -> Markup e
picture = parent "picture"
pre :: forall e. Markup e -> Markup e
pre = parent "pre"
progress :: forall e. Markup e -> Markup e
progress = parent "progress"
q :: forall e. Markup e -> Markup e
q = parent "q"
rp :: forall e. Markup e -> Markup e
rp = parent "rp"
rt :: forall e. Markup e -> Markup e
rt = parent "rt"
rtc :: forall e. Markup e -> Markup e
rtc = parent "rtc"
ruby :: forall e. Markup e -> Markup e
ruby = parent "ruby"
s :: forall e. Markup e -> Markup e
s = parent "s"
samp :: forall e. Markup e -> Markup e
samp = parent "samp"
script :: forall e. Markup e -> Markup e
script = parent "script"
section :: forall e. Markup e -> Markup e
section = parent "section"
select :: forall e. Markup e -> Markup e
select = parent "select"
small :: forall e. Markup e -> Markup e
small = parent "small"
span :: forall e. Markup e -> Markup e
span = parent "span"
strong :: forall e. Markup e -> Markup e
strong = parent "strong"
style :: forall e. Markup e -> Markup e
style = parent "style"
sub :: forall e. Markup e -> Markup e
sub = parent "sub"
summary :: forall e. Markup e -> Markup e
summary = parent "summary"
sup :: forall e. Markup e -> Markup e
sup = parent "sup"
slot :: forall e. Markup e -> Markup e
slot = parent "slot"
table :: forall e. Markup e -> Markup e
table = parent "table"
tbody :: forall e. Markup e -> Markup e
tbody = parent "tbody"
td :: forall e. Markup e -> Markup e
td = parent "td"
template :: forall e. Markup e -> Markup e
template = parent "template"
textarea :: forall e. Markup e -> Markup e
textarea = parent "textarea"
tfoot :: forall e. Markup e -> Markup e
tfoot = parent "tfoot"
th :: forall e. Markup e -> Markup e
th = parent "th"
thead :: forall e. Markup e -> Markup e
thead = parent "thead"
time :: forall e. Markup e -> Markup e
time = parent "time"
title :: forall e. Markup e -> Markup e
title = parent "title"
tr :: forall e. Markup e -> Markup e
tr = parent "tr"
u :: forall e. Markup e -> Markup e
u = parent "u"
ul :: forall e. Markup e -> Markup e
ul = parent "ul"
var :: forall e. Markup e -> Markup e
var = parent "var"
video :: forall e. Markup e -> Markup e
video = parent "video"
area :: forall e. Markup e
area = leaf "area"
base :: forall e. Markup e
base = leaf "base"
br :: forall e. Markup e
br = leaf "br"
col :: forall e. Markup e
col = leaf "col"
embed :: forall e. Markup e
embed = leaf "embed"
hr :: forall e. Markup e
hr = leaf "hr"
img :: forall e. Markup e
img = leaf "img"
input :: forall e. Markup e
input = leaf "input"
keygen :: forall e. Markup e
keygen = leaf "keygen"
link :: forall e. Markup e
link = leaf "link"
menuitem :: forall e. Markup e
menuitem = leaf "menuitem"
meta :: forall e. Markup e
meta = leaf "meta"
param :: forall e. Markup e
param = leaf "param"
source :: forall e. Markup e
source = leaf "source"
track :: forall e. Markup e
track = leaf "track"
wbr :: forall e. Markup e
wbr = leaf "wbr"
