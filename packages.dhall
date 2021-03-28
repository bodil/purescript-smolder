let upstream =
      https://github.com/purescript/package-sets/releases/download/psc-0.14.0-20210324/packages.dhall

in    upstream
    ⫽ { js-uri =
        { dependencies = [ "functions", "maybe" ]
        , repo = "https://github.com/srghma/purescript-js-uri.git"
        , version = "main"
        }
      }
