module App exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Decoders exposing (..)
import RemoteData exposing (..)
import Http exposing (..)
import Time.DateTime as DateTime exposing (DateTime, dateTime, fromTimestamp)
import Dict
import Navigation exposing (Location)
import UrlParser exposing (..)


type alias ProjectPage =
    { current_project : Behance, comments : Comments }


type Data
    = CurrentProject ProjectPage
    | ProjectsList (List Behance)


type alias Model =
    { data : Data
    , route : Route
    }


init : Location -> ( Model, Cmd Msg )
init location =
    let
        currentRoute =
            parseLocation location

        model =
            { data = CurrentProject (initCurrentProject)
            , route = ProjectRoute "50911821"
            }
    in
        ( model, (commandForRoute currentRoute) )


type Msg
    = HandleProject (WebData Behance)
    | HandleComments (WebData Comments)
    | HandleLocationChange Location


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case Debug.log "updatE" msg of
        HandleProject (Success response) ->
            let
                newModel =
                    case model.data of
                        CurrentProject pp ->
                            { current_project = response, comments = pp.comments }

                        _ ->
                            initCurrentProject
            in
                ( { model | data = CurrentProject newModel }, Cmd.none )

        HandleProject _ ->
            ( model, Cmd.none )

        HandleComments (Success response) ->
            let
                newModel =
                    case model.data of
                        CurrentProject pp ->
                            { current_project = pp.current_project, comments = response }

                        _ ->
                            { current_project = initialBPrj, comments = { comments = [] } }
            in
                ( { model | data = CurrentProject newModel }, Cmd.none )

        HandleComments _ ->
            ( model, Cmd.none )

        HandleLocationChange location ->
            let
                newRoute =
                    parseLocation location
            in
                ( { model | route = newRoute }, (commandForRoute newRoute) )


view : Model -> Html Msg
view model =
    case model.data of
        CurrentProject prj ->
            div [ class "ui middle aligned stackable grid container" ]
                [ div [ class "row main" ]
                    [ div [ class "eleven wide column" ]
                        (render_modules prj.current_project.project.modules)
                    , div [ class "five wide column sb" ]
                        (side_bar prj.current_project)
                    ]
                , div [ class "row" ]
                    [ h4 [ class "ui horizontal divider header" ]
                        [ i [ class "thumb circular up icon" ]
                            []
                        ]
                    ]
                , div [ class "row" ]
                    (comments prj.comments)
                ]

        ProjectsList prj_list ->
            h1 [] [ text "prj_list" ]


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none


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
            (modules_html)
        ]


comments : Comments -> List (Html Msg)
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
                    [ text <| "Comments (" ++ n_comments comments.comments ++ ")" ]
                , div [ class "ui comments" ]
                    (List.map render_comment comments.comments)
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


fetchComments : String -> Cmd Msg
fetchComments id =
    Http.get ("http://cuberoot.in:8080/http://www.behance.net/v2/projects/" ++ id ++ "/comments?client_id=zAfaQfvw7LHUvnj4IRfolHMdh07R2Oll") decodeComments
        |> RemoteData.sendRequest
        |> Cmd.map HandleComments


fetchProject : String -> Cmd Msg
fetchProject id =
    Http.get ("http://cuberoot.in:8080/http://www.behance.net/v2/projects/" ++ id ++ "?client_id=zAfaQfvw7LHUvnj4IRfolHMdh07R2Oll") decodeBPrj
        |> RemoteData.sendRequest
        |> Cmd.map HandleProject


type Route
    = ProjectsRoute
    | ProjectRoute String
    | NotFoundRoute


matchers : Parser (Route -> a) a
matchers =
    oneOf
        [ UrlParser.map ProjectsRoute top
        , UrlParser.map ProjectRoute (UrlParser.s "projects" </> string)
        , UrlParser.map ProjectsRoute (UrlParser.s "projects")
        ]


parseLocation : Location -> Route
parseLocation location =
    case (parseHash matchers location) of
        Just route ->
            route

        Nothing ->
            NotFoundRoute


commandForRoute : Route -> Cmd Msg
commandForRoute route =
    case route of
        ProjectRoute id ->
            Cmd.batch [ fetchProject id, fetchComments id ]

        ProjectsRoute ->
            Cmd.none

        NotFoundRoute ->
            Cmd.none


initCurrentProject =
    { current_project = initialBPrj, comments = { comments = [] } }
