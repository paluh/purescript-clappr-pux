# purescript-pux-clappr

Provides react component for Pux which is build upon `purescript-clappr`.

## Usage

If you are in hurry here is a short snippet with some plugins configuration:

  ```purescript
    type State = Pux.Clappr.Options

    watermark ∷ Clappr.Plugins.Watermark.Options
    watermark =
      { link: Just "https://github.com/clappr/clappr"
      , position: Clappr.Plugins.Watermark.TopRight
      , url: "https://cloud.githubusercontent.com/assets/244265/6373134/a845eb50-bce7-11e4-80f2-592ba29972ab.png"
      }

    view state = div $ do
      p $ text "It is my great pleasure to present you Clappr Component:"
      clappr
        ( DvrControls.setup
        <<< Watermark.setup watermark
        <<< toNativeOptions
        $ state
        )
  ```

Check full example where you can find nearly ready to use (you have to provide your own HLS url in index.html there) code base with simple webpack config.
