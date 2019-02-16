module GMaps.Map 
  ( Map
  , MapOptions
  , gMap
  , panTo
  ) where

import Prelude (Unit)
import Effect (Effect)
import Web.DOM (Element)
import GMaps.LatLng (LatLng)
import Data.Function.Uncurried (Fn2, runFn2)

type MapOptionsR =
  { zoom :: Number
  , center :: LatLng
  , mapTypeId :: String
  }

newtype MapOptions = MapOptions MapOptionsR

foreign import data Map :: Type

foreign import gMapImpl :: Fn2 Element MapOptionsR (Effect Map)

gMap :: Element -> MapOptions -> Effect Map
gMap element (MapOptions options) = runFn2 gMapImpl element options

foreign import panToImpl :: Fn2 Map LatLng (Effect Unit)

panTo :: Map -> LatLng -> Effect Unit
panTo = runFn2 panToImpl
