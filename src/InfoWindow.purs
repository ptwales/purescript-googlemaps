module GMaps.InfoWindow 
  ( InfoWindow
  , InfoWindowOptions
  , newInfoWindow
  , openInfoWindow
  ) where

import Prelude (Unit)
import Effect (Effect)
import GMaps.Map (Map)
import GMaps.Marker (Marker)
import Data.Function.Uncurried (Fn1, Fn3, runFn1, runFn3)

type InfoWindowOptionsR = { content :: String }

newtype InfoWindowOptions = InfoWindowOptions InfoWindowOptionsR

foreign import data InfoWindow :: Type

foreign import newInfoWindowImpl :: Fn1 InfoWindowOptionsR (Effect InfoWindow)

newInfoWindow :: InfoWindowOptions -> Effect InfoWindow
newInfoWindow (InfoWindowOptions options) = runFn1 newInfoWindowImpl options

foreign import openInfoWindowImpl :: Fn3 InfoWindow Map Marker (Effect Unit)

openInfoWindow :: InfoWindow -> Map -> Marker -> Effect Unit
openInfoWindow = runFn3 openInfoWindowImpl
