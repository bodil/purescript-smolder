module Test.Main where

import Prelude

import Control.Monad.Aff.AVar (AVAR)
import Control.Monad.Eff (Eff)
import Control.Monad.Eff.Console (CONSOLE, log)
import Test.SVG as SvgTest
import Test.Unit (test)
import Test.Unit.Assert (equal)
import Test.Unit.Console (TESTOUTPUT)
import Test.Unit.Main (runTest)
import Text.Smolder.HTML (body, h1, head, html, link, meta, p, script, title)
import Text.Smolder.HTML.Attributes (charset, content, href, httpEquiv, lang, name, rel, src)
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
  body $ do
    h1 #! on "click" (\_ -> log "click") $ text "OMG HAI LOL"
    p $ text "This is clearly the best HTML DSL ever invented.<script>alert(\"lol pwned\");</script>"

expected :: String
expected = """<html lang="en"><head><meta charset="utf-8"/><meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/><title>OMG HAI LOL</title><meta name="description" content="YES OMG HAI LOL&quot;&gt;&lt;script&gt;alert(&quot;lol pwned&quot;);&lt;&#x2F;script&gt;"/><meta name="viewport" content="width=device-width"/><link rel="stylesheet" href="css&#x2F;screen.css"/><script src="index.js"></script></head><body><h1>OMG HAI LOL</h1><p>This is clearly the best HTML DSL ever invented.&lt;script&gt;alert(&quot;lol pwned&quot;);&lt;&#x2F;script&gt;</p></body></html>"""

main :: Eff (console :: CONSOLE, avar :: AVAR, testOutput :: TESTOUTPUT) Unit
main = runTest do
  test "render HTML to string" do
    equal expected $ render doc
  SvgTest.tests
