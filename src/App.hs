module App (start) where

import Control.Lens ((%~))
import GUI (buildUI)
import Monomer (AppEventHandler, EventResponse (Model, Producer), appExitEvent, appFontDef, appInitEvent, appTheme, appWindowIcon, appWindowTitle, darkTheme, startApp)
import Types (AppEvent (..), AppModel (AppModel, _counter), counter)

start :: IO ()
start = do
  initial <- initAppModel
  startApp initial handleEvent buildUI appConfig
  where
    appConfig =
      [ appWindowTitle "Template Monomer App",
        appWindowIcon "./assets/monomer-logo.png",
        appFontDef "Regular" "./assets/fonts/NotoSans-Regular.ttf",
        appTheme darkTheme,
        appInitEvent AppInit,
        appExitEvent AppExit
      ]

initAppModel :: IO AppModel
initAppModel = do
  return
    AppModel
      { _counter = 0
      }

incrementCounter :: AppModel -> AppModel
incrementCounter = counter %~ (+ 1)

decrementCounter :: AppModel -> AppModel
decrementCounter = counter %~ \x -> x - 1

handleEvent :: AppEventHandler AppModel AppEvent
handleEvent _ _ model event = case event of
  AppInit -> [Producer $ const $ putStrLn "App was started"]
  AppExit -> [Producer $ const $ putStrLn "App closing"]
  AppIncrement -> [Model $ incrementCounter model]
  AppDecrement -> [Model $ decrementCounter model]