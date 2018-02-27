module Pux.Clappr where

import Clappr (NativeOptions)
import Pux.DOM.HTML (HTML)
import Pux.Renderer.React (reactClassWithProps)
import React (ReactClass)

foreign import clapprImpl ∷ ∀ r. ReactClass (NativeOptions r)

clappr ∷ ∀ env r. NativeOptions r → (HTML env → HTML env)
clappr opts =
  reactClassWithProps
    clapprImpl
    "clappr-component"
    opts
