module Main exposing (..)

import App exposing (..)
import Navigation exposing (Location, programWithFlags)


main : Program Never Model Msg
main =
    Navigation.program HandleLocationChange
        { init = init, view = view, update = update, subscriptions = subscriptions }
