let upstream =
      https://github.com/purescript/package-sets/releases/download/psc-0.13.3-20190831/packages.dhall sha256:852cd4b9e463258baf4e253e8524bcfe019124769472ca50b316fe93217c3a47

let overrides = {=}

let additions =
  { spec-mocha =
      { dependencies =
          [ "console"
          , "foldable-traversable"
          , "exceptions"
          , "spec"
          ]
      , repo =
          "https://github.com/owickstrom/purescript-spec-mocha.git"
      , version =
          "v4.0.0"
      }
  }

in  upstream // overrides // additions
