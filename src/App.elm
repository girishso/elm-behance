module App exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Decoders exposing (..)
import RemoteData exposing (..)
import Http exposing (..)
import Time.DateTime as DateTime exposing (DateTime, dateTime, fromTimestamp)
import Dict


type Data
    = CurrentProject BPrj
    | ProjectsList (List BPrj)


type alias Model =
    { data : Data
    }


type alias Project =
    {}


init : String -> ( Model, Cmd Msg )
init path =
    ( { data = CurrentProject (initialBPrj) }, fetchProject )


type Msg
    = OnFetchProject (WebData BPrj)


fetchProject : Cmd Msg
fetchProject =
    Http.get "http://cuberoot.in:8080/http://www.behance.net/v2/projects/50911821?client_id=zAfaQfvw7LHUvnj4IRfolHMdh07R2Oll" decodeBPrj
        |> RemoteData.sendRequest
        |> Cmd.map OnFetchProject


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case Debug.log "updatE" msg of
        OnFetchProject (Success response) ->
            ( { model | data = CurrentProject response }, Cmd.none )

        OnFetchProject _ ->
            ( model, Cmd.none )


view : Model -> Html Msg
view model =
    case model.data of
        CurrentProject prj ->
            div [ class "ui middle aligned stackable grid container" ]
                [ div [ class "row main" ]
                    [ div [ class "eleven wide column" ]
                        (render_modules prj.project.modules)
                    , div [ class "five wide column sb" ]
                        (side_bar prj)
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

        ProjectsList prj_list ->
            h1 [] [ text "prj_list" ]


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none


render_modules : List BPrjProjectModule -> List (Html Msg)
render_modules modules =
    let
        modules_html =
            modules
                |> List.filter (\m -> m.type_ == "image" || m.type_ == "text")
                |> List.map
                    (\m ->
                        div []
                            [ div [ class "ui fluid" ]
                                [ case m.type_ of
                                    "image" ->
                                        img [ class "ui fluid image", src m.src ]
                                            []

                                    "text" ->
                                        text m.text_plain

                                    _ ->
                                        text ""
                                ]
                            , div [ class "ui divider" ]
                                []
                            ]
                    )
    in
        [ div [ class "ui segment" ]
            (modules_html)
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


side_bar : BPrj -> List (Html Msg)
side_bar prj =
    let
        owner =
            case List.head prj.project.owners of
                Just a ->
                    a

                Nothing ->
                    { location = "", display_name = "", images = Dict.empty }

        owner_img =
            case Dict.get "50" owner.images of
                Just a ->
                    a

                Nothing ->
                    ""
    in
        [ div [ class "ui segment" ]
            [ div [ class "ui cards" ]
                [ div [ class "card" ]
                    [ div [ class "content" ]
                        [ img [ class "right floated mini ui image", src owner_img ]
                            []
                        , div [ class "header" ]
                            [ text owner.display_name ]
                        , div [ class "meta" ]
                            [ text owner.location ]
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
                [ h3 []
                    [ text prj.project.name ]
                , ul [ id "fields" ]
                    (List.map (\f -> li [] [ text f ]) prj.project.fields)
                , p [ class "grey" ]
                    [ small []
                        [ "Published: "
                            ++ (format_date prj.project.published_on)
                            |> text
                        ]
                    ]
                ]
            ]
        ]


format_date : Int -> String
format_date dt =
    fromTimestamp (toFloat dt * 1000)
        |> DateTime.toISO8601
