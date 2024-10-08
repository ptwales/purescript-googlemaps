module GMaps.Draw.Polygon
  ( Polygon
  , PolygonOptions
  , defPolygonOptions
  , defPolygonOptions_
  , newPolygon
  , deletePolygon
  , getMap
  , setMap
  , remove
  , getPaths
  , getPaths_
  , setOptions
  , setPaths
  , setPaths_
  ) where

import Data.Function.Uncurried (Fn1, runFn1, Fn2, runFn2)
import Data.Maybe (Maybe(..))
import Effect (Effect)
import GMaps.Draw.Polygon.PolygonEvent (PolygonEvent)
import GMaps.Internal (maybeNothing, orUndefined)
import GMaps.LatLng (LatLng, LatLngLiteral)
import GMaps.LatLng (toLiteral) as LatLng
import GMaps.MVC.MVCArray (MVCArray)
import GMaps.MVC.MVCArray (toArray) as MVCArray
import GMaps.MVC.MVCObject (class MVCObject, defAddListener)
import GMaps.Map (Map)
import Prelude (Unit, flip, map, (<<<))

-- TODO: inherit options from Poly
type PolygonOptionsR =
  { clickable :: Boolean
  , draggable :: Boolean
  , editable :: Boolean
  , fillColor :: String -- custom
  , fillOpacity :: Number -- custom
  , geodesic :: Boolean
  , map :: Map -- inherit from display
  , paths :: Array (Array LatLngLiteral) -- custom
  , strokeColor :: String
  , strokeOpacity :: Number
  , strokeWeight :: Number
  , visible :: Boolean
  , zIndex :: Number
  }

type PolygonOptions =
  { clickable :: Boolean
  , draggable :: Boolean
  , editable :: Boolean
  , geodesic :: Boolean
  , fillColor :: Maybe String
  , fillOpacity :: Maybe Number
  , map :: Maybe Map
  , paths :: Array (Array LatLngLiteral)
  , strokeColor :: Maybe String
  , strokeOpacity :: Maybe Number
  , strokeWeight :: Maybe Number
  , visible :: Boolean
  , zIndex :: Maybe Number
  }

defPolygonOptions_ :: Array (Array LatLng) -> PolygonOptions
defPolygonOptions_ = defPolygonOptions <<< map (map LatLng.toLiteral)

defPolygonOptions :: Array (Array LatLngLiteral) -> PolygonOptions
defPolygonOptions paths =
  { paths
  , map: Nothing
  , clickable: true
  , draggable: false
  , editable: false
  , fillColor: Nothing
  , fillOpacity: Nothing
  , geodesic: false
  , strokeColor: Nothing
  , strokeOpacity: Nothing
  , strokeWeight: Nothing
  , visible: true
  , zIndex: Nothing
  }

runPolygonOptions :: PolygonOptions -> PolygonOptionsR
runPolygonOptions options =
  options
    { map = orUndefined options.map
    , fillColor = orUndefined options.fillColor
    , fillOpacity = orUndefined options.fillOpacity
    , strokeColor = orUndefined options.strokeColor
    , strokeOpacity = orUndefined options.strokeOpacity
    , strokeWeight = orUndefined options.strokeWeight
    , zIndex = orUndefined options.zIndex
    }

foreign import data Polygon :: Type

instance mvcPolygonObject :: MVCObject Polygon PolygonEvent where
  addListener = defAddListener

foreign import newPolygonImpl :: Fn1 PolygonOptionsR (Effect Polygon)

newPolygon :: PolygonOptions -> Effect Polygon
newPolygon = runFn1 newPolygonImpl <<< runPolygonOptions

foreign import deletePolygonImpl :: Fn1 Polygon (Effect Unit)

deletePolygon :: Polygon -> Effect Unit
deletePolygon = runFn1 deletePolygonImpl

foreign import getMapImpl :: Fn1 Polygon Map

getMap :: Polygon -> Maybe Map
getMap = maybeNothing <<< runFn1 getMapImpl

foreign import setMapImpl :: Fn2 Polygon Map (Effect Polygon)

setMap :: Polygon -> Maybe Map -> Effect Polygon
setMap display = runFn2 setMapImpl display <<< orUndefined

remove :: Polygon -> Effect Polygon
remove = flip setMap Nothing

foreign import getPathsImpl :: Fn1 Polygon (MVCArray (MVCArray LatLng))

getPaths_ :: Polygon -> MVCArray (MVCArray LatLng)
getPaths_ = runFn1 getPathsImpl

getPaths :: Polygon -> Array (Array LatLng)
getPaths = map MVCArray.toArray <<< MVCArray.toArray <<< getPaths_

foreign import setOptionsImpl :: Fn2 Polygon PolygonOptionsR (Effect Polygon)

setOptions :: Polygon -> PolygonOptions -> Effect Polygon
setOptions polygon = runFn2 setOptionsImpl polygon <<< runPolygonOptions

foreign import setPathsImpl :: Fn2 Polygon (Array (Array LatLngLiteral)) (Effect Polygon)

setPaths :: Polygon -> Array (Array LatLngLiteral) -> Effect Polygon
setPaths = runFn2 setPathsImpl

setPaths_ :: Polygon -> Array (Array LatLng) -> Effect Polygon
setPaths_ polygon = setPaths polygon <<< map (map LatLng.toLiteral)
