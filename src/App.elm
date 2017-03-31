module App exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Decoders exposing (..)


type alias Model =
    { message : String
    , logo : String
    }


type alias Project =
    {}


init : String -> ( Model, Cmd Msg )
init path =
    ( { message = "Your Elm App is working!", logo = path }, Cmd.none )


type Msg
    = NoOp


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    ( model, Cmd.none )


view : Model -> Html Msg
view model =
    div [ class "ui middle aligned stackable grid container" ]
        [ div [ class "row main" ]
            [ div [ class "eleven wide column" ]
                (render_modules model)
            , div [ class "five wide column sb" ]
                (side_bar model)
            ]
        , div [ class "row" ]
            [ h4 [ class "ui horizontal divider header" ]
                [ i [ class "thumb circular up icon" ]
                    []
                ]
            ]
        , div [ class "row" ]
            (comments model)
        ]


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none


render_modules : Model -> List (Html Msg)
render_modules model =
    [ div [ class "ui segment" ]
        [ div [ class "ui fluid" ]
            [ img [ class "ui fluid image", src "./images/1.jpg" ]
                []
            ]
        , div [ class "ui divider" ]
            []
        , div []
            [ img [ class "ui fluid image", src "./images/2.jpg" ]
                []
            ]
        , div [ class "ui divider" ]
            []
        ]
    ]


comments : Model -> List (Html Msg)
comments model =
    [ div [ class "column" ]
        [ div [ class "ui segment" ]
            [ h2 []
                [ text "Comments (8)" ]
            , div [ class "ui comments" ]
                [ div [ class "comment" ]
                    [ a [ class "avatar", rel "noreferrer" ]
                        [ img [ src "/images/avatar/small/joe.jpg" ]
                            []
                        ]
                    , div [ class "content" ]
                        [ a [ class "author", rel "noreferrer" ]
                            [ text "Joe Henderson" ]
                        , div [ class "metadata" ]
                            [ div [ class "date" ]
                                [ text "1 day ago" ]
                            ]
                        , div [ class "text" ]
                            [ p []
                                [ text "The hours, minutes and seconds stand as visible reminders that your effort put them all there. " ]
                            , p []
                                [ text "Preserve until your next run, when the watch lets you see how Impermanent your efforts are." ]
                            ]
                        , div [ class "actions" ]
                            [ a [ class "reply", rel "noreferrer" ]
                                [ text "Reply" ]
                            ]
                        ]
                    ]
                , div [ class "comment" ]
                    [ a [ class "avatar", rel "noreferrer" ]
                        [ img [ src "/images/avatar/small/christian.jpg" ]
                            []
                        ]
                    , div [ class "content" ]
                        [ a [ class "author", rel "noreferrer" ]
                            [ text "Christian Rocha" ]
                        , div [ class "metadata" ]
                            [ div [ class "date" ]
                                [ text "2 days ago" ]
                            ]
                        , div [ class "text" ]
                            [ text "I re-tweeted this.              " ]
                        , div [ class "actions" ]
                            [ a [ class "reply", rel "noreferrer" ]
                                [ text "Reply" ]
                            ]
                        ]
                    ]
                ]
            ]
        ]
    ]


side_bar : Model -> List (Html Msg)
side_bar model =
    [ div [ class "ui segment" ]
        [ div [ class "ui cards" ]
            [ div [ class "card" ]
                [ div [ class "content" ]
                    [ img [ class "right floated mini ui image", src "images/jenny.jpg" ]
                        []
                    , div [ class "header" ]
                        [ text "Jenny Hess              " ]
                    , div [ class "meta" ]
                        [ text "New Member              " ]
                    , div [ class "description" ]
                        [ text "Jenny wants to add you to the group "
                        , b []
                            [ text "best friends" ]
                        ]
                    ]
                , div [ class "extra content" ]
                    [ div [ class "ui blue button" ]
                        [ text "Follow" ]
                    ]
                ]
            ]
        , div [ class "ui divider" ]
            []
        , div [ class "ui segment" ]
            [ h2 []
                [ text "Janish Soft" ]
            , p []
                [ text "Branding Architecture Graphic Design" ]
            , p [ class "grey" ]
                [ small []
                    [ text "Published: March 2, 2017" ]
                ]
            ]
        ]
    ]
