module Page.NotFound exposing (view)

import Html exposing (..)
import Html.Attributes exposing (..)


view =
    div [ class "ui middle aligned stackable grid container" ]
        [ div [ class "row main" ]
            [ div [ class "ui container grid home-main" ]
                [ div [ class "ui link cards" ] [ text "404 not found!" ]
                ]
            ]
        ]
