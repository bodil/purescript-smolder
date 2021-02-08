{-
Welcome to a Spago project!
You can edit this file as you like.
-}
{ name = "purescript-smolder"
, dependencies =
  [ "bifunctors"
  , "catenable-lists"
  , "console"
  , "effect"
  , "free"
  , "ordered-collections"
  , "prelude"
  , "psci-support"
  , "strings"
  , "test-unit"
  , "transformers"
  , "tuples"
  , "js-uri"
  ]
, packages = ./packages.dhall
, sources = [ "src/**/*.purs", "test/**/*.purs" ]
}
