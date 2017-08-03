module Test.Main where

import Prelude hiding (div)

import Control.Monad.Aff.AVar (AVAR)
import Control.Monad.Eff (Eff)
import Control.Monad.Eff.Console (CONSOLE, log)
import Test.SVG as SvgTest
import Test.Unit (suite, test)
import Test.Unit.Assert (equal)
import Test.Unit.Console (TESTOUTPUT)
import Test.Unit.Main (runTest)
import Text.Smolder.HTML (body, div, h1, head, html, img, link, meta, p, script, style, title)
import Text.Smolder.HTML.Attributes (charset, content, href, httpEquiv, lang, name, rel, src, type')
import Text.Smolder.Markup (Markup, on, text, (!), (#!))
import Text.Smolder.Renderer.String (render)

doc :: forall a e. Markup (a -> Eff (console :: CONSOLE | e) Unit)
doc = html ! lang "en" $ do
  head $ do
    meta ! charset "utf-8"
    meta ! httpEquiv "X-UA-Compatible" ! content "IE=edge,chrome=1"
    title $ text "OMG HAI LOL"
    meta ! name "description" ! content "YES OMG HAI LOL\"><script>alert(\"lol pwned\");</script>"
    meta ! name "viewport" ! content "width=device-width"
    link ! rel "stylesheet" ! href "css/screen.css"
    script ! src "index.js" $ text ""
    style ! type' "text/css" $ text " "
  body $ do
    h1 #! on "click" (\_ -> log "click") $ text "OMG HAI LOL"
    img ! src "images/img.png?id=123&a=true"
    p $ text "This is clearly the best HTML DSL ever invented.<script>alert(\"lol pwned\");</script>"

expected :: String
expected = """<html lang="en"><head><meta charset="utf-8"/><meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/><title>OMG HAI LOL</title><meta name="description" content="YES OMG HAI LOL&quot;&gt;&lt;script&gt;alert(&quot;lol pwned&quot;);&lt;&#x2F;script&gt;"/><meta name="viewport" content="width=device-width"/><link rel="stylesheet" href="css/screen.css"/><script src="index.js"></script><style type="text/css"> </style></head><body><h1>OMG HAI LOL</h1><img src="images/img.png?id=123&a=true"/><p>This is clearly the best HTML DSL ever invented.&lt;script&gt;alert(&quot;lol pwned&quot;);&lt;&#x2F;script&gt;</p></body></html>"""

main :: Eff (console :: CONSOLE, avar :: AVAR, testOutput :: TESTOUTPUT) Unit
main = runTest do
  test "render HTML to string" do
    equal expected $ render doc
  suite "escaping entities" do
    test "allow string entities" do
      equal "<div>&hearts;</div>" $ render $ div $ text "&hearts;"
    test "allow numeric entities" do
      equal "<div>&#39;</div>" $ render $ div $ text "&#39;"
    test "escape &" do
      equal "<div>&amp;</div>" $ render $ div $ text "&"
      equal "<div>&amp;gt.</div>" $ render $ div $ text "&gt."
      equal "<div>&amp;#.</div>" $ render $ div $ text "&#."
      equal "<div>&amp;#;</div>" $ render $ div $ text "&#;"
    test "quirks" do
      -- this renders invalid HTML
      equal "<div>&#1;</div>" $ render $ div $ text "&#1;"
      equal "<div>&abc;</div>" $ render $ div $ text "&abc;"
  SvgTest.tests
