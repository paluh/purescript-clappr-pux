module Pux.Clappr where

import Prelude

import Clappr (NativeOptions, OptionsBase)
import Data.Maybe (Maybe(..))
import Data.Nullable (toNullable)
import Prim.Row (class Lacks)
import Pux.DOM.HTML (HTML)
import Pux.Renderer.React (reactClassWithProps)
import React (ReactClass)
import Record (insert, set)
import Type.Prelude (SProxy(..))

foreign import clapprImpl ∷ ∀ r. ReactClass (NativeOptions r)

toNativeOptions
  ∷ ∀ r
  . (Lacks "plugins" r)
  ⇒ (Lacks "parent" r)
  ⇒ (Lacks "parentId" r)
  ⇒ OptionsBase r
  → NativeOptions r
toNativeOptions options
  = insert (SProxy ∷ SProxy "plugins") []
  <<< insert (SProxy ∷ SProxy "parent") (toNullable Nothing)
  <<< insert (SProxy ∷ SProxy "parentId") (toNullable Nothing)
  <<< set (SProxy ∷ SProxy "baseUrl") (toNullable options.baseUrl)
  <<< set (SProxy ∷ SProxy "hlsjsConfig") (toNullable options.hlsjsConfig)
  <<< set (SProxy ∷ SProxy "hlsRecoverAttempts") (toNullable options.hlsRecoverAttempts)
  $ options

clappr ∷ ∀ env r. NativeOptions r → HTML env
clappr opts =
  reactClassWithProps
    clapprImpl
    "clappr-component"
    opts
    (pure unit)
