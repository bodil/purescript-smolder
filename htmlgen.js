var fs = require("fs");

var reservedWords = {
  "class": "className",
  "type": "type'",
  "data": "data'"
};

function sanitise(n) {
  return (reservedWords[n] || n).replace(/-\w/g, function(s) {return s[1].toUpperCase()});
}

var html = fs.createWriteStream("src/Text/Smolder/HTML.purs");

html.write("module Text.Smolder.HTML where\n\nimport Text.Smolder.Markup (Markup, parent, leaf)\n\ntype Html = Markup\n\n");

[
  "a", "abbr", "address", "article", "aside", "audio", "b", "bdo", "blockquote",
  "body", "button", "canvas", "caption", "cite", "code", "colgroup", "command",
  "datalist", "dd", "del", "details", "dfn", "div", "dl", "dt", "em", "fieldset",
  "figcaption", "figure", "footer", "form", "h1", "h2", "h3", "h4", "h5", "h6",
  "head", "header", "hgroup", "html", "i", "iframe", "ins", "kbd", "label",
  "legend", "li", "map", "mark", "menu", "meter", "nav", "noscript", "object",
  "ol", "optgroup", "option", "output", "p", "pre", "progress", "q", "rp", "rt",
  "ruby", "samp", "script", "section", "select", "small", "span", "strong",
  "style", "sub", "summary", "sup", "table", "tbody", "td", "textarea", "tfoot",
  "th", "thead", "time", "title", "tr", "ul", "var", "video"
].forEach(function(el) {
  html.write(sanitise(el) + " :: Markup -> Markup\n" + sanitise(el) +
            " = parent \"" + el + "\"\n");
});

[
  "area", "base", "br", "col", "embed", "hr", "img", "input", "keygen", "link",
  "menuitem", "meta", "param", "source", "track", "wbr"
].forEach(function(el) {
  html.write(sanitise(el) + " :: Markup\n" + sanitise(el) +
            " = leaf \"" + el + "\"\n");
});

var attrs = fs.createWriteStream("src/Text/Smolder/HTML/Attributes.purs");

attrs.write("module Text.Smolder.HTML.Attributes where\n\nimport Text.Smolder.Markup (Attribute, attribute)\n\n");

[
  "accept", "accept-charset", "accesskey", "action", "alt", "async",
  "autocomplete", "autofocus", "autoplay", "challenge", "charset", "checked",
  "cite", "class", "cols", "colspan", "content", "contenteditable", "contextmenu",
  "controls", "coords", "data", "datetime", "defer", "dir", "disabled",
  "draggable", "enctype", "for", "form", "formaction", "formenctype",
  "formmethod", "formnovalidate", "formtarget", "headers", "height", "hidden",
  "high", "href", "hreflang", "http-equiv", "icon", "id", "ismap", "item",
  "itemprop", "keytype", "label", "lang", "list", "loop", "low", "manifest",
  "max", "maxlength", "media", "method", "min", "multiple", "name", "novalidate",
  "onbeforeonload", "onbeforeprint", "onblur", "oncanplay", "oncanplaythrough",
  "onchange", "oncontextmenu", "onclick", "ondblclick", "ondrag", "ondragend",
  "ondragenter", "ondragleave", "ondragover", "ondragstart", "ondrop",
  "ondurationchange", "onemptied", "onended", "onerror", "onfocus",
  "onformchange", "onforminput", "onhaschange", "oninput", "oninvalid",
  "onkeydown", "onkeyup", "onload", "onloadeddata", "onloadedmetadata",
  "onloadstart", "onmessage", "onmousedown", "onmousemove", "onmouseout",
  "onmouseover", "onmouseup", "onmousewheel", "ononline", "onpagehide",
  "onpageshow", "onpause", "onplay", "onplaying", "onprogress", "onpropstate",
  "onratechange", "onreadystatechange", "onredo", "onresize", "onscroll",
  "onseeked", "onseeking", "onselect", "onstalled", "onstorage", "onsubmit",
  "onsuspend", "ontimeupdate", "onundo", "onunload", "onvolumechange",
  "onwaiting", "open", "optimum", "pattern", "ping", "placeholder", "preload",
  "pubdate", "radiogroup", "readonly", "rel", "required", "reversed", "rows",
  "rowspan", "sandbox", "scope", "scoped", "seamless", "selected", "shape",
  "size", "sizes", "span", "spellcheck", "src", "srcdoc", "start", "step",
  "style", "subject", "summary", "tabindex", "target", "title", "type", "usemap",
  "value", "width", "wrap", "xmlns"
].forEach(function(el) {
  attrs.write(sanitise(el) + " :: String -> Attribute\n" + sanitise(el) +
            " = attribute \"" + el + "\"\n");
});
