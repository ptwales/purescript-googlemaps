module Test.Types
  ( Spec'
  ) where

import Prelude
import Effect (Effect)
import Effect.Aff (Aff)
import Test.Spec (SpecT)

type Spec' a = SpecT Aff Unit Effect a
