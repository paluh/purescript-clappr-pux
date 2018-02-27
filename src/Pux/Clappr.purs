module Pux.Clappr where

import Clappr (OptionsBase, NativeOptions)
import Data.Maybe (Maybe(..))
import Data.Nullable (toNullable)
import Pux.DOM.HTML (HTML)
import Pux.Renderer.React (reactClassWithProps)
import React (ReactClass)

foreign import clapprImpl ∷ ∀ r. ReactClass (NativeOptions r)

type Options = OptionsBase ()

toNativeOptions ∷ Options → NativeOptions ()
toNativeOptions options =
  { source: options.source
  , plugins: []
  , parentId: toNullable Nothing
  , parent: toNullable Nothing
  }

clappr ∷ ∀ env r. NativeOptions r → (HTML env → HTML env)
clappr opts =
  reactClassWithProps
    clapprImpl
    "clappr-component"
    opts
