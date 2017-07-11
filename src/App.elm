module App exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Decoders exposing (..)
import RemoteData exposing (..)
import Http exposing (..)


-- import Time.DateTime as DateTime exposing (DateTime, dateTime, fromTimestamp)
-- import Dict

import Navigation exposing (Location)
import UrlParser exposing (..)
import Page.Home as Home
import Page.Project as PProject


-- type alias ProjectPage =
--     { current_project : Behance, comments : Comments }


type Page
    = Home Home.Model
    | PProject PProject.Model


type PageState
    = Loaded Page


type alias Model =
    { pageState : PageState
    , route : Route
    }


type Route
    = ProjectsRoute
    | ProjectRoute String
    | NotFoundRoute


type Msg
    = HandleLocationChange Location
    | HomeMsg Home.Msg
    | PProjectMsg PProject.Msg


init : Location -> ( Model, Cmd Msg )
init location =
    let
        currentRoute =
            parseLocation location

        model =
            case currentRoute of
                ProjectsRoute ->
                    { pageState = Loaded (Home Home.init)
                    , route = currentRoute
                    }

                ProjectRoute id ->
                    -- { data = CurrentProject (initCurrentProject), route = currentRoute }
                    { pageState = Loaded (PProject PProject.init)
                    , route = ProjectsRoute
                    }

                NotFoundRoute ->
                    { pageState = Loaded (Home Home.init)
                    , route = ProjectsRoute
                    }
    in
        ( model
        , Cmd.map (HomeMsg) Home.fetchProjects
        )


view : Model -> Html Msg
view model =
    case model.pageState of
        Loaded page ->
            viewPage page



-- div [ class "ui middle aligned stackable grid container" ]
--     [ div [ class "row main" ]
--         [ div [ class "ui container grid home-main" ]
--             [ div [ class "ui link cards" ] [ text "render_projects prj_list" ] ]
--         ]
--     ]


viewPage : Page -> Html Msg
viewPage page =
    case page of
        Home subModel ->
            Home.view subModel
                |> Html.map HomeMsg

        PProject subModel ->
            h1 [] [ text "mee!!" ]


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    ( model, Cmd.none )



-- case msg of
--     HandleProject (Success response) ->
--         case model.data of
--             CurrentProject pp ->
--                 ( { model | data = CurrentProject { pp | current_project = response } }, Cmd.none )
--
--             _ ->
--                 ( { model | data = CurrentProject { current_project = response, comments = { comments = [] } } }, Cmd.none )
--
--     HandleProject _ ->
--         ( model, Cmd.none )
--
--     HandleComments (Success response) ->
--         case model.data of
--             CurrentProject pp ->
--                 ( { model | data = CurrentProject { pp | comments = response } }, Cmd.none )
--
--             _ ->
--                 ( { model | data = CurrentProject { current_project = initialBPrj, comments = response } }, Cmd.none )
--
--     HandleComments _ ->
--         ( model, Cmd.none )
--
--     HandleLocationChange location ->
--         let
--             newRoute =
--                 parseLocation location
--         in
--             ( { model | route = newRoute }, (commandForRoute newRoute) )
--
--     HandleProjectsList (Success response) ->
--         ( { model | data =  response.projects }, Cmd.none )
--
--     HandleProjectsList _ ->
--         ( model, Cmd.none )
-- fetchComments : String -> Cmd Msg
-- fetchComments id =
--     Http.get ("http://cuberoot.in:8080/http://www.behance.net/v2/projects/" ++ id ++ "/comments?client_id=zAfaQfvw7LHUvnj4IRfolHMdh07R2Oll") decodeComments
--         |> RemoteData.sendRequest
--         |> Cmd.map HandleComments
--
--
-- fetchProject : String -> Cmd Msg
-- fetchProject id =
--     Http.get ("http://cuberoot.in:8080/http://www.behance.net/v2/projects/" ++ id ++ "?client_id=zAfaQfvw7LHUvnj4IRfolHMdh07R2Oll") decodeBPrj
--         |> RemoteData.sendRequest
--         |> Cmd.map HandleProject


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



--
-- commandForRoute : Route -> Cmd Msg
-- commandForRoute route =
--     case Debug.log "commandForRoute" route of
--         ProjectRoute id ->
--             -- Cmd.batch [ fetchProject id, fetchComments id ]
--             Cmd.none
--
--         ProjectsRoute ->
--             let
--                 ( _, newCmd ) =
--                     Home.init_w_msg
--             in
--                 -- Cmd.map (Home.loadProjects) Cmd.none
--                 Home.loadProjects "x"
--
--         NotFoundRoute ->
--             Cmd.none


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none
