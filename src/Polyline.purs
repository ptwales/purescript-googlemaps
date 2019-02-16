module GMaps.Polyline
  ( Polyline
  , PolylineOptions
  , newPolyline
  , setPolylinePath
  ) where

import Prelude (Unit)
import Effect (Effect)
import GMaps.LatLng (LatLng)
import GMaps.Map (Map)
import GMaps.MVCArray (MVCArray)
import Data.Function.Uncurried (Fn1, runFn1, Fn2, runFn2)

foreign import data Polyline :: Type

type PolylineOptionsR = 
  { geodescic :: Boolean
  , strokeColor :: String
  , strokeOpacity :: Number
  , strokeWeight :: Number
  , map :: Map
  }

newtype PolylineOptions = PolylineOptions PolylineOptionsR

foreign import newPolylineImpl :: Fn1 PolylineOptionsR (Effect Polyline)

newPolyline :: PolylineOptions -> Effect Polyline
newPolyline (PolylineOptions options) = runFn1 newPolylineImpl options

foreign import setPolylinePathImpl :: Fn2 Polyline (MVCArray LatLng) (Effect Unit)

setPolylinePath :: Polyline -> MVCArray LatLng -> Effect Unit
setPolylinePath = runFn2 setPolylinePathImpl
