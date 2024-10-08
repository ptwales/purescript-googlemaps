module Test.Util
  ( testIso
  , SetOpt
  , Setter
  , setMarker
  , initMarker
  , setWindow
  , initWindow
  , setPolygon
  , initPolygon
  , setPolyline
  , initPolyline
  ) where

import Prelude
import Effect (Effect)
import Effect.Aff (Aff)
import Effect.Class (liftEffect)
import GMaps.Draw.Polygon (Polygon, PolygonOptions)
import GMaps.Draw.Polygon (defPolygonOptions, newPolygon) as G
import GMaps.Draw.Polyline (Polyline, PolylineOptions)
import GMaps.Draw.Polyline (defPolylineOptions, newPolyline) as G
import GMaps.InfoWindow (InfoWindow, InfoWindowOptions)
import GMaps.InfoWindow (defInfoWindowOptions_, newInfoWindow) as G
import GMaps.Marker (Marker, MarkerOptions)
import GMaps.Marker (defMarkerOptions_, newMarker) as G
import Test.Defaults as Def
import Test.Spec.Assertions (shouldEqual)

-- TODO: probably misnamed
testIso :: forall a b. Eq a => Show a => a -> (a -> Effect b) -> (b -> a) -> Aff Unit
testIso a set get = do
  b <- liftEffect (set a)
  (get b) `shouldEqual` a

type SetOpt o a = o -> a -> o

type Setter a b = a -> b -> Effect a

setMarker :: forall a. Eq a => Show a => Setter Marker a -> a -> Effect Marker
setMarker set a = (flip set a) =<< Def.marker

initMarker :: forall a. Eq a => Show a => SetOpt MarkerOptions a -> a -> Effect Marker
initMarker set a = G.newMarker <<< flip set a <<< G.defMarkerOptions_ =<< Def.latLng

setWindow :: forall a. Eq a => Show a => Setter InfoWindow a -> a -> Effect InfoWindow
setWindow set a = (flip set a) =<< Def.infoWindow

initWindow :: forall a. Eq a => Show a => SetOpt InfoWindowOptions a -> a -> Effect InfoWindow
initWindow set a = G.newInfoWindow <<< flip set a <<< G.defInfoWindowOptions_ =<< Def.latLng

setPolygon :: forall a. Eq a => Show a => Setter Polygon a -> a -> Effect Polygon
setPolygon set a = flip set a =<< Def.polygon

initPolygon :: forall a. Eq a => Show a => SetOpt PolygonOptions a -> a -> Effect Polygon
initPolygon set = G.newPolygon <<< set (G.defPolygonOptions [ Def.path ])

setPolyline :: forall a. Eq a => Show a => Setter Polyline a -> a -> Effect Polyline
setPolyline set a = flip set a =<< Def.polyline

initPolyline :: forall a. Eq a => Show a => SetOpt PolylineOptions a -> a -> Effect Polyline
initPolyline set = G.newPolyline <<< set (G.defPolylineOptions Def.path)
