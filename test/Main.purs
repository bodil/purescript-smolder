module Test.Main where

import Prelude

import Control.Monad.Eff.Console (log)

import Text.Smolder.HTML (html, head, meta, link, title, body, h1, p)
import Text.Smolder.HTML.Attributes (lang, charset, httpEquiv, content, name, rel, href)
import Text.Smolder.Markup (text, (!))
import Text.Smolder.Renderer.String (render)

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

main = log $ render doc