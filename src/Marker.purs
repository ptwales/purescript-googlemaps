module GMaps.Marker 
  ( Marker
  , MarkerOptions
  , newMarker
  , setMarkerPosition
  , deleteMarker
  , setMarkerLabel
  ) where

import Prelude (Unit, (<<<))
import Data.Function.Uncurried (Fn1, runFn1, Fn2, runFn2)
import Data.Maybe (Maybe, fromMaybe)
import Effect (Effect)
import GMaps.LatLng (LatLng)
import GMaps.Map (Map)

type MarkerOptionsR =
  { position :: LatLng
  , map :: Map
  , title :: String
  , icon :: String
  }

newtype MarkerOptions = MarkerOptions
  { position :: LatLng
  , map :: Map
  , title :: String
  , icon :: Maybe String
  }

-- GMaps either wants a marker icon or undefined.
foreign import undefined :: forall a. a

foreign import data Marker :: Type

foreign import newMarkerImpl :: Fn1 MarkerOptionsR (Effect Marker)

newMarker :: MarkerOptions -> Effect Marker
newMarker = runFn1 newMarkerImpl <<< runMarkerOptions
  where runMaybe = fromMaybe undefined
        runMarkerOptions (MarkerOptions options) = options 
          { icon = runMaybe options.icon
          }

foreign import removeMarkerImpl :: Fn1 Marker (Effect Marker)

removeMarker :: Marker -> Effect Marker
removeMarker = runFn1 removeMarkerImpl

foreign import deleteMarkerImpl :: Fn1 Marker (Effect Unit)

deleteMarker :: Marker -> Effect Unit
deleteMarker = runFn1 deleteMarkerImpl

foreign import setMarkerPositionImpl :: Fn2 Marker LatLng (Effect Marker)

setMarkerPosition :: Marker -> LatLng -> Effect Marker
setMarkerPosition = runFn2 setMarkerPositionImpl

foreign import setMarkerLabelImpl :: Fn2 Marker String (Effect Marker)

setMarkerLabel :: Marker -> String -> Effect Marker
setMarkerLabel = runFn2 setMarkerLabelImpl
