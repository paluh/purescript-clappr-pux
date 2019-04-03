module Main where

import Prelude hiding (div)

import Clappr.Plugins.DvrControls as DvrControls
import Clappr.Plugins.ResponsiveContainer as ResponsiveContainer
import Clappr.Plugins.Watermark as Watermark
import Data.Maybe (Maybe(..))
import Pux (noEffects, start)
import Pux.Clappr (clappr, Options)
import Pux.Clappr (toNativeOptions)
import Pux.Renderer.React (renderToDOM)
import Text.Smolder.HTML (div, p)
import Text.Smolder.Markup (text)

type State = Options
type Action = Unit

foldp _ state = noEffects state

watermark ∷ Watermark.Options
watermark =
  { link: Just "https://github.com/clappr/clappr"
  , position: Watermark.TopRight
  , url: "https://cloud.githubusercontent.com/assets/244265/6373134/a845eb50-bce7-11e4-80f2-592ba29972ab.png"
  }

view state = div $ do
  clappr
    ( DvrControls.setup
    <<< Watermark.setup watermark
    -- <<< ResponsiveContainer.setup
    <<< toNativeOptions
    $ state
    )

-- main :: forall e. Eff (console :: CONSOLE | e) Unit
main parentId source = do
  let
    config =
      { initialState:
          { autoPlay: true
          , baseUrl: Nothing
          , hlsjsConfig: Nothing
          , hlsRecoverAttempts: Nothing
          , mute: true
          , source: source
          }
      , foldp: foldp
      , view: view
      , inputs: []
      }
  app ← start config
  renderToDOM parentId app.markup app.input
