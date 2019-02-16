module GMaps.LatLng 
  ( LatLng
  , newLatLng
  ) where

import Data.Function.Uncurried (Fn2, runFn2)
import Effect (Effect)

foreign import data LatLng :: Type

foreign import newLatLngImpl :: Fn2 Number Number (Effect LatLng)

newLatLng :: Number -> Number -> Effect LatLng
newLatLng = runFn2 newLatLngImpl
