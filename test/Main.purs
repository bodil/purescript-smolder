module Test.Main where

import Control.Monad
import Test.Unit
import Text.Smolder.Markup
import Text.Smolder.HTML (h1, input, ol, li)
import Text.Smolder.HTML.Attributes (type', className, name)
import Text.Smolder.Renderer.String


main = runTest do
  test "Text.Smolder.Renderer.String" do
   assertEqual (render testMarkup) compactMarkup
   assertEqual (prettyPrint twoSpc testMarkup) prettyMarkup

assertEqual :: forall a e. (Eq a, Show a) => a -> a -> Assertion e
assertEqual a b = assert reason $ a == b
  where
    reason = show a ++ " /= " ++ show b

twoSpc = PPOptions { indentStr: "  "}

compactMarkup =
  "<h1 class=\"huge\">Programming Languages</h1><input name=\"addPL\" type=\"text\"/><ol><li>PureScript</li><li>Haskell</li></ol>"

prettyMarkup = """<h1 class="huge">
  Programming Languages
</h1>
<input name="addPL" type="text"/>
<ol>
  <li>
    PureScript
  </li>
  <li>
    Haskell
  </li>
</ol>"""


testMarkup = do
  h1 ! className "huge" $ text "Programming Languages"
  input ! type' "text" ! name "addPL"
  ol do
    li $ text "PureScript"
    li $ text "Haskell"

