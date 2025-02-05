module GUI (buildUI) where

import Monomer
  ( CmbChildSpacing (childSpacing, childSpacing_),
    CmbMaxHeight (maxHeight),
    CmbMaxWidth (maxWidth),
    CmbPadding (padding),
    CmbStyleBasic (styleBasic),
    UIBuilder,
    box,
    button,
    externalLink,
    hstack_,
    image,
    label,
    numericField,
    vstack_,
  )
import Types (AppEvent (AppDecrement, AppIncrement), AppModel, counter)

buildUI :: UIBuilder AppModel AppEvent
buildUI _ _ = widgetsTree
  where
    monomerLogoSize = 256 :: Double
    monomerLogo =
      image "./assets/monomer-logo.png"
        `styleBasic` [maxWidth monomerLogoSize, maxHeight monomerLogoSize]
    counterWidget =
      vstack_
        [childSpacing]
        [ label "Counter",
          numericField counter,
          button "+" AppIncrement,
          button "-" AppDecrement
        ]
        `styleBasic` [maxWidth 200]
    links =
      box $
        hstack_
          [childSpacing_ 30]
          [ externalLink "Monomer Documentation" "https://hackage.haskell.org/package/monomer-1.6.0.1",
            externalLink "Monomer on GitHub" "https://github.com/fjvallarino/monomer"
          ]
    widgetsTree =
      box $
        vstack_
          [childSpacing]
          [ hstack_
              [childSpacing_ 50]
              [box monomerLogo, box counterWidget],
            links
          ]
          `styleBasic` [ maxWidth 600,
                         padding 50
                       ]