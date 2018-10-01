module Pux.Clappr where

import Clappr (OptionsBase, NativeOptions)
import Data.Maybe (Maybe(..))
import Data.Nullable (toNullable)
import Prelude (pure, unit)
import Pux.DOM.HTML (HTML)
import Pux.Renderer.React (reactClassWithProps)
import React (ReactClass)

foreign import clapprImpl ∷ ∀ r. ReactClass (NativeOptions r)

type Options = OptionsBase ()

toNativeOptions ∷ Options → NativeOptions ()
toNativeOptions options =
  { autoPlay: options.autoPlay
  , baseUrl: toNullable options.baseUrl
  , hlsjsConfig: toNullable options.hlsjsConfig
  , hlsRecoverAttempts: toNullable options.hlsRecoverAttempts
  , mute: options.mute
  , parentId: toNullable Nothing
  , parent: toNullable Nothing
  , plugins: []
  , source: options.source
  }

clappr ∷ ∀ env r. NativeOptions r → HTML env
clappr opts =
  reactClassWithProps
    clapprImpl
    "clappr-component"
    opts
    (pure unit)
