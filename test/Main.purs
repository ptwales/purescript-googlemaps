module Test.Main where

import Effect (Effect)
import Prelude (Unit)

--import GMaps.Marker (Marker, MarkerOptions)
--import GMaps.Marker as Marker
--import GMaps.LatLng (LatLng)

{-
  Requirements to run unit tests:
    1. Have `dotenv` and `scriptjs` installed with `npm` or `yarn`
    2. Have a gmaps API key for the ApiMap in `.env`, see `.env.sample`
    3. Run in a node environment with `npx pulp test` or `yarn pulp test`
  See `test/Main.js` for all the work done to setup the client. 

  The main problem is I haven't figured out how to "create" a client like we can for geocoding with
  `@google/maps`.
-}

foreign import setupApiMap :: Effect Unit

main :: Effect Unit
main = setupApiMap

{-
testMarker :: Type -> Effect Unit
testMarker client = do
  latLng <- createLatLng client 0.0 0.0
  newMarker <- createMarker client (Marker.defMarkerOptions latLng)
  titledMarker <- Marker.setTitle newMarker "Hello"
  traceM (Marker.getTitle titledMarker)
-}
