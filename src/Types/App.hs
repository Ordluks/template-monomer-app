{-# LANGUAGE TemplateHaskell #-}

module Types.App (AppModel (..), AppEvent (..), counter) where

import Control.Lens (makeLenses)

data AppModel = AppModel
  { _counter :: Int
  }
  deriving (Eq)

makeLenses ''AppModel

data AppEvent
  = AppInit
  | AppExit
  | AppIncrement
  | AppDecrement