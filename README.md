# Template Monomer App

You can use this template repository to simply start new application project in Haskell using Monomer GUI library.

You are not need to edit `.cabal` file. Stack will use `project.yaml` to automatically generate it.

## Project structure

`app/Main.hs` - executable entry
`assets` - files that load during runtime
`assets/fonts` - your fonts
`src` - program modules
`project.yaml` - project information and settings
`stack.yaml` - stack settings

## Modules structure

`Types` - reimports for all inner modules
`Types.App` - main application datatypes and models
`Types.<module-name>` - some of your datatypes and models

`GUI` - application GUI builder
`GUI.<module-name>` - some of your composites
`GUI.Widgets.<module-name>` - some of your widgets

`App` - main application logic and application entry
`<module-name>` - some of your application logics