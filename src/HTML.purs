module Text.Smolder.HTML where

import Prelude ()
import Text.Smolder.Markup

type Html = Markup

abbr :: Markup -> Markup
abbr = parent "abbr"

address :: Markup -> Markup
address = parent "address"

a :: Markup -> Markup
a = parent "a"

area :: Markup
area = leaf "area"

article :: Markup -> Markup
article = parent "article"

aside :: Markup -> Markup
aside = parent "aside"

audio :: Markup -> Markup
audio = parent "audio"

base :: Markup
base = leaf "base"

bdo :: Markup -> Markup
bdo = parent "bdo"

blockquote :: Markup -> Markup
blockquote = parent "blockquote"

b :: Markup -> Markup
b = parent "b"

body :: Markup -> Markup
body = parent "body"

br :: Markup
br = leaf "br"

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

col :: Markup
col = leaf "col"

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

embed :: Markup
embed = leaf "embed"

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

header :: Markup -> Markup
header = parent "header"

head :: Markup -> Markup
head = parent "head"

hgroup :: Markup -> Markup
hgroup = parent "hgroup"

hr :: Markup
hr = leaf "hr"

html :: Markup -> Markup
html = parent "html"

iframe :: Markup -> Markup
iframe = parent "iframe"

i :: Markup -> Markup
i = parent "i"

img :: Markup
img = leaf "img"

input :: Markup
input = leaf "input"

ins :: Markup -> Markup
ins = parent "ins"

kbd :: Markup -> Markup
kbd = parent "kbd"

keygen :: Markup
keygen = leaf "keygen"

label :: Markup -> Markup
label = parent "label"

legend :: Markup -> Markup
legend = parent "legend"

li :: Markup -> Markup
link = leaf "link"

link :: Markup
li = parent "li"

map :: Markup -> Markup
map = parent "map"

mark :: Markup -> Markup
mark = parent "mark"

menuitem :: Markup
menuitem = leaf "menuitem"

menu :: Markup -> Markup
menu = parent "menu"

meta :: Markup
meta = leaf "meta"

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

param :: Markup
param = leaf "param"

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

source :: Markup
source = leaf "source"

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

thead :: Markup -> Markup
thead = parent "thead"

th :: Markup -> Markup
th = parent "th"

time :: Markup -> Markup
time = parent "time"

title :: Markup -> Markup
title = parent "title"

track :: Markup
track = leaf "track"

tr :: Markup -> Markup
tr = parent "tr"

ul :: Markup -> Markup
ul = parent "ul"

var :: Markup -> Markup
var = parent "var"

video :: Markup -> Markup
video = parent "video"

wbr :: Markup
wbr = leaf "wbr"
