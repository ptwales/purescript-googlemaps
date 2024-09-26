module Test.Main where

import Prelude
import Effect (Effect)
import Data.Maybe (Maybe, maybe)
import GMaps.Map (Map) as G
import Test.Defaults (googleMap) as Defaults
import Test.Draw.Polygon as Polygon
import Test.Draw.Polyline as Polyline
import Test.Geometry.Poly as Poly
import Test.InfoWindow as InfoWindow
import Test.LatLng as LatLng
import Test.Map as Map
import Test.Marker as Marker
import Test.Spec (describe, it)
import Test.Spec.Assertions (fail)
import Test.Spec.Mocha (runMocha)
import Test.Types (Spec')

main :: Effect Unit
main = do
  googleMap <- Defaults.googleMap
  runMocha do
    withMap googleMap Map.specs
    describe "GMaps.Draw.Polygon" Polygon.specs
    describe "GMaps.Draw.Polyline" Polyline.specs
    describe "GMaps.InfoWindow" InfoWindow.specs
    describe "GMaps.LatLng" LatLng.specs
    describe "GMaps.Marker" Marker.specs
    describe "GMaps.Geometry.Poly" Poly.specs

withMap :: Maybe G.Map -> (G.Map -> Spec' Unit) -> Spec' Unit
withMap googleMap suite = maybe failedToLoadMap suite googleMap
  where
  failedToLoadMap = it "CRITICAL" $ fail "FAILED TO LOAD MAP"
