module Page.Home exposing (Model, Msg, init, update, view, fetchProjects, init_w_msg, loadProjects)

import Html exposing (..)
import Html.Attributes exposing (..)
import Decoders exposing (..)
import RemoteData exposing (..)
import Http exposing (..)


-- import Time.DateTime as DateTime exposing (DateTime, dateTime, fromTimestamp)

import Dict


type Msg
    = HandleProjectsList (WebData Projects)
    | LoadProjects


init : Model
init =
    { projects = [] }


init_w_msg : ( Model, Cmd Msg )
init_w_msg =
    ( init, fetchProjects )


type alias Model =
    { projects : List Project }


loadProjects x =
    LoadProjects


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        HandleProjectsList (Success response) ->
            ( { model | projects = response.projects }, Cmd.none )

        HandleProjectsList _ ->
            ( model, Cmd.none )

        LoadProjects ->
            ( model, fetchProjects )


fetchProjects : Cmd Msg
fetchProjects =
    Http.get ("http://cuberoot.in:8080/http://www.behance.net/v2/projects?client_id=zAfaQfvw7LHUvnj4IRfolHMdh07R2Oll") decodeProjects
        |> RemoteData.sendRequest
        |> Cmd.map HandleProjectsList



-- VIEW


view : Model -> Html msg
view model =
    div [ class "ui middle aligned stackable grid container" ]
        [ div [ class "row main" ]
            [ div [ class "ui container grid home-main" ]
                [ div [ class "ui link cards" ] (render_projects model.projects) ]
            ]
        ]


render_projects : List Project -> List (Html msg)
render_projects projects =
    let
        render_a_project =
            \project ->
                let
                    cover_img =
                        case Dict.get "230" project.covers of
                            Just a ->
                                a

                            Nothing ->
                                ""

                    owner =
                        case List.head project.owners of
                            Just a ->
                                a

                            Nothing ->
                                { location = "", display_name = "", images = Dict.empty }

                    field =
                        case List.head project.fields of
                            Just a ->
                                a

                            Nothing ->
                                ""
                in
                    div [ class "card" ]
                        [ div [ class "image" ]
                            [ img [ alt "", src <| cover_img ] [] ]
                        , div [ class "content" ]
                            [ div [ class "header" ]
                                [ a
                                    [ href <| "/#/projects/" ++ (toString project.id) ]
                                    [ text project.name ]
                                ]
                            , div [ class "meta" ]
                                [ span [ class "date" ]
                                    [ text <| "by " ++ owner.display_name ]
                                ]
                            , div [ class "description" ]
                                []
                            ]
                        , div [ class "extra content" ]
                            [ span [ class "right floated" ]
                                [ text field ]
                            , span []
                                [ i [ class "thumbs up icon" ]
                                    []
                                , text <| toString project.stats.appreciations
                                ]
                            ]
                        ]
    in
        List.map render_a_project projects
