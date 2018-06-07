module Test.SVG where

import Prelude

import Test.Unit (TestSuite, test)
import Test.Unit.Assert (equal)
import Text.Smolder.Markup (Markup, (!))
import Text.Smolder.Renderer.String (render)
import Text.Smolder.SVG (svg, g, rect, circle)
import Text.Smolder.SVG.Attributes (width, height, x, y, fill, cx, cy, r)

img :: forall a. Markup a
img = svg ! width "300" ! height "250" $ do
  g $ do
    rect ! x "0" ! y "200" ! width "20" ! height "50" ! fill "blue"
    rect ! x "20" ! y "200" ! width "20" ! height "50" ! fill "blue"
    rect ! x "40" ! y "200" ! width "20" ! height "50" ! fill "blue"
    rect ! x "60" ! y "200" ! width "20" ! height "50" ! fill "blue"
  g $ do
    circle ! cx "100" ! cy "100" ! r "10" ! fill "red"

expected :: String
expected = """<svg width="300" height="250"><g><rect x="0" y="200" width="20" height="50" fill="blue"/><rect x="20" y="200" width="20" height="50" fill="blue"/><rect x="40" y="200" width="20" height="50" fill="blue"/><rect x="60" y="200" width="20" height="50" fill="blue"/></g><g><circle cx="100" cy="100" r="10" fill="red"/></g></svg>"""

tests :: TestSuite
tests =
  test "render SVG to string" do
    equal expected $ render img
