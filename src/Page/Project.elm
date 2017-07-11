module Page.Project exposing (Model, Msg, init, view, update)

import Html exposing (..)
import Html.Attributes exposing (..)
import Decoders exposing (..)
import RemoteData exposing (..)
import Dict
import Http exposing (..)
import Time.DateTime as DateTime exposing (DateTime, dateTime, fromTimestamp)


type alias Model =
    { project : Behance, comments : Comments }


type Msg
    = ProjectLoaded (WebData Behance)
    | CommentsLoaded (WebData Comments)


init : String -> ( Model, Cmd Msg )
init id =
    ( { project = initialBPrj, comments = { comments = [] } }
    , (Cmd.batch [ fetchProject id, fetchComments id ])
    )


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        ProjectLoaded (Success response) ->
            ( { model | project = response }, Cmd.none )

        CommentsLoaded (Success response) ->
            ( { model | comments = { comments = response.comments } }, Cmd.none )

        _ ->
            ( model, Cmd.none )


fetchComments : String -> Cmd Msg
fetchComments id =
    Http.get ("http://cuberoot.in:8080/http://www.behance.net/v2/projects/" ++ id ++ "/comments?client_id=zAfaQfvw7LHUvnj4IRfolHMdh07R2Oll") decodeComments
        |> RemoteData.sendRequest
        |> Cmd.map CommentsLoaded


fetchProject : String -> Cmd Msg
fetchProject id =
    Http.get ("http://cuberoot.in:8080/http://www.behance.net/v2/projects/" ++ id ++ "?client_id=zAfaQfvw7LHUvnj4IRfolHMdh07R2Oll") decodeBPrj
        |> RemoteData.sendRequest
        |> Cmd.map ProjectLoaded


view : Model -> Html Msg
view model =
    let
        prj =
            model.project
    in
        div [ class "ui middle aligned stackable grid container" ]
            [ div [ class "row main" ]
                [ div [ class "eleven wide column" ]
                    (render_modules prj.project.modules)
                , div [ class "five wide column sb" ]
                    (side_bar prj)
                ]
            , div [ class "row" ]
                [ h4 [ class "ui horizontal divider header" ]
                    [ i [ class "comments circular icon" ]
                        []
                    ]
                ]
            , div [ class "row" ]
                (comments model.comments.comments)
            ]


render_modules : List ProjectModule -> List (Html Msg)
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
            modules_html
        ]


comments : List Comment -> List (Html Msg)
comments comments =
    let
        n_comments =
            \comments -> toString <| List.length comments

        render_comment =
            \comment ->
                let
                    commenter_img =
                        \images ->
                            case Dict.get "100" images of
                                Just a ->
                                    a

                                Nothing ->
                                    ""
                in
                    div [ class "comment" ]
                        [ a [ class "avatar", rel "noreferrer" ]
                            [ img [ src (commenter_img comment.user.images) ]
                                []
                            ]
                        , div [ class "content" ]
                            [ a [ class "author", rel "noreferrer" ]
                                [ text comment.user.display_name ]
                            , div [ class "metadata" ]
                                [ div [ class "date" ]
                                    [ text (format_date comment.created_on) ]
                                ]
                            , div [ class "text" ]
                                [ p [] [ text comment.comment ]
                                ]
                            , div [ class "actions" ]
                                [ a [ class "reply", rel "noreferrer" ]
                                    [ text "" ]
                                ]
                            ]
                        ]
    in
        [ div [ class "column" ]
            [ div [ class "ui segment" ]
                [ h2 []
                    [ text <| "Comments (" ++ n_comments comments ++ ")" ]
                , div [ class "ui comments" ]
                    (List.map render_comment comments)
                ]
            ]
        ]


side_bar : Behance -> List (Html Msg)
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
