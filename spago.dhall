{-
Welcome to a Spago project!
You can edit this file as you like.
-}
{ name =
    "googlemaps"
, dependencies =
    [ "debug"
    , "foreign"
    , "functions"
    , "psci-support"
    , "read"
    , "spec-mocha"
    , "web-html"
    ]
, packages =
    ./packages.dhall
, sources =
    [ "src/**/*.purs", "test/**/*.purs" ]
}
