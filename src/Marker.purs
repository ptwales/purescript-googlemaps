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
import Data.Maybe (Maybe(Nothing), fromMaybe)
import Effect (Effect)
import GMaps.LatLng (LatLng)
import GMaps.Map (Map)

type MarkerOptionsR =
  { position :: LatLng
  , map :: Map
  --, anchorPoint :: Point
  --, animation :: Animation
  , clickable :: Boolean
  , crossOnDrag :: Boolean
  --, cursor :: String
  , draggable :: Boolean
  , icon :: String
  , label :: Char
  , optimized :: Boolean
  --, shape :: MarkerShape
  , title :: String
  , visible :: Boolean
  , zIndex :: Number
  }

newtype MarkerOptions = MarkerOptions
  { position :: LatLng
  , map :: Maybe Map
  --, anchorPoint :: Maybe Point
  --, animation :: Maybe Animation
  , clickable :: Boolean
  , crossOnDrag :: Boolean
  --, cursor :: Maybe String
  , draggable :: Boolean
  , icon :: Maybe String
  , label :: Maybe Char
  , optimized :: Boolean
  --, shape :: Maybe MarkerShape
  , title :: Maybe String
  , visible :: Boolean
  , zIndex :: Maybe Number
  }

defMarkerOptions :: LatLng -> MarkerOptions
defMarkerOptions position = MarkerOptions
  { position
  , map: Nothing
  --, anchorPoint: Nothing
  --, animation: Nothing
  , clickable: true
  , crossOnDrag: true
  --, cursor: Nothing
  , draggable: false
  , icon: Nothing
  , label: Nothing
  , optimized: true
  --, shape: Nothing
  , title: Nothing
  , visible: true
  , zIndex: Nothing
  }

-- GMaps either wants a marker icon or undefined.
foreign import undefined :: forall a. a

foreign import data Marker :: Type

foreign import newMarkerImpl :: Fn1 MarkerOptionsR (Effect Marker)

newMarker :: MarkerOptions -> Effect Marker
newMarker = runFn1 newMarkerImpl <<< runMarkerOptions
  where runMaybe :: forall a. Maybe a -> a
        runMaybe = fromMaybe undefined
        runMarkerOptions (MarkerOptions options) = options 
          { map = runMaybe options.map
          --, anchorPoint = runMAybe options.anchorPoint
          --, animation = runMAybe options.animation
          --, cursor = runMAybe options.cursor
          , icon = runMaybe options.icon
          , label = runMaybe options.label
          --, shape = runMaybe options.shape
          , title = runMaybe options.title
          , zIndex = runMaybe options.zIndex
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
