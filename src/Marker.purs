module GMaps.Marker 
  ( Marker
  , MarkerOptions
  , newMarker
  , deleteMarker
  --, setAnimation
  , setClickable
  --, setCursor
  , setDraggable
  , setIcon
  , setLabel
  , setMap
  , setOpacity
  , setOptions
  , setPosition
  --, setShape
  , setTitle
  , setVisible
  , setZIndex
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
  --, cursor :: Maybe Cursor
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

orUndefined :: forall a. Maybe a -> a
orUndefined = fromMaybe undefined

runMarkerOptions :: MarkerOptions -> MarkerOptionsR
runMarkerOptions (MarkerOptions options) = options 
  { map = orUndefined options.map
  --, anchorPoint = orUndefined options.anchorPoint
  --, animation = orUndefined options.animation
  --, cursor = orUndefined options.cursor
  , icon = orUndefined options.icon
  , label = orUndefined options.label
  --, shape = orUndefined options.shape
  , title = orUndefined options.title
  , zIndex = orUndefined options.zIndex
  }

foreign import data Marker :: Type

foreign import newMarkerImpl :: Fn1 MarkerOptionsR (Effect Marker)

newMarker :: MarkerOptions -> Effect Marker
newMarker = runFn1 newMarkerImpl <<< runMarkerOptions

foreign import removeMarkerImpl :: Fn1 Marker (Effect Marker)

removeMarker :: Marker -> Effect Marker
removeMarker = runFn1 removeMarkerImpl

foreign import deleteMarkerImpl :: Fn1 Marker (Effect Unit)

deleteMarker :: Marker -> Effect Unit
deleteMarker = runFn1 deleteMarkerImpl

--foreign import setAnimationImpl :: Fn2 Marker ?umm (Effect Marker)
--
--setAnimation :: Marker -> Animation -> Effect Marker
--setAnimation marker = runFn2 setAnimationImpl marker orNull

foreign import setClickableImpl :: Fn2 Marker Boolean (Effect Marker)

setClickable :: Marker -> Boolean -> Effect Marker
setClickable = runFn2 setClickableImpl

--foreign import setCursorImpl :: Fn2 Marker ?umm (Effect Marker)
--
--setCursor :: Marker -> Cursor -> Effect Marker
--setCursor marker cursor = runFn2 setCursorImpl marker (?umm cursor)

foreign import setDraggableImpl :: Fn2 Marker Boolean (Effect Marker)

setDraggable :: Marker -> Boolean -> Effect Marker
setDraggable = runFn2 setDraggableImpl

foreign import setIconImpl :: Fn2 Marker String (Effect Marker)

setIcon :: Marker -> Maybe String -> Effect Marker
setIcon marker = runFn2 setIconImpl marker <<< orUndefined -- orNull?

foreign import setLabelImpl :: Fn2 Marker Char (Effect Marker)

setLabel :: Marker -> Maybe Char -> Effect Marker
setLabel marker = runFn2 setLabelImpl marker <<< orUndefined -- orNull?

foreign import setMapImpl :: Fn2 Marker Map (Effect Marker)

-- See removeMarker to `setMap(null)`
setMap :: Marker -> Map -> Effect Marker
setMap marker = runFn2 setMapImpl marker

foreign import setOpacityImpl :: Fn2 Marker Number (Effect Marker)

setOpacity :: Marker -> Number -> Effect Marker
setOpacity = runFn2 setOpacityImpl

foreign import setOptionsImpl :: Fn2 Marker MarkerOptionsR (Effect Marker)

setOptions :: Marker -> MarkerOptions -> Effect Marker
setOptions marker = runFn2 setOptionsImpl marker <<< runMarkerOptions

foreign import setPositionImpl :: Fn2 Marker LatLng (Effect Marker)

setPosition :: Marker -> LatLng -> Effect Marker
setPosition = runFn2 setPositionImpl

--foreign import setShapeImpl :: Fn2 Marker MarkerShape (Effect Marker)
--
--setShape :: Marker -> Maybe MarkerShape -> Effect Marker
--setShape marker = runFn2 setShapeImpl <<< orNull

foreign import setTitleImpl :: Fn2 Marker String (Effect Marker)

setTitle :: Marker -> String -> Effect Marker
setTitle = runFn2 setTitleImpl

foreign import setVisibleImpl :: Fn2 Marker Boolean (Effect Marker)

setVisible :: Marker -> Boolean -> Effect Marker
setVisible = runFn2 setVisibleImpl

foreign import setZIndexImpl :: Fn2 Marker Number (Effect Marker)

setZIndex :: Marker -> Number -> Effect Marker
setZIndex = runFn2 setZIndexImpl
