module Main (
    main
) where

import GHCJS.DOM (runWebGUI, postGUIAsync)
import Control.Lens ((^.))
import Language.Javascript.JSaddle (jsg, js, (<#), runJSaddle_)

main = runWebGUI $ \ webView -> do
    let runjs = postGUIAsync . runJSaddle_ webView

    runjs $ do
        document <- jsg "document"
        let body = js "body"
            innerHtml = js "innerHtml"
        document ^. body ^. innerHtml <# "<h1>Hello World</h1>"

