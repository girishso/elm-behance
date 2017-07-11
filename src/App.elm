module App exposing (..)

import Html exposing (..)
import Navigation exposing (Location)
import UrlParser exposing (..)
import Page.Home as Home
import Page.NotFound
import Page.Project as PProject


type Page
    = Home Home.Model
    | PProject PProject.Model
    | NotFoundPage


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
    | HomeLoaded Home.Model
    | PProjectMsg PProject.Msg
    | PProjectLoaded PProject.Model


init : Location -> ( Model, Cmd Msg )
init location =
    let
        currentRoute =
            parseLocation location
    in
        case currentRoute of
            ProjectsRoute ->
                let
                    ( model, fx ) =
                        Home.init
                in
                    ( { pageState = Loaded (Home model)
                      , route = currentRoute
                      }
                    , Cmd.map HomeMsg fx
                    )

            ProjectRoute id ->
                let
                    ( model, fx ) =
                        PProject.init id
                in
                    ( { pageState = Loaded (PProject model)
                      , route = ProjectRoute id
                      }
                    , Cmd.map PProjectMsg fx
                    )

            NotFoundRoute ->
                ( { pageState = Loaded (NotFoundPage)
                  , route = NotFoundRoute
                  }
                , Cmd.none
                )


view : Model -> Html Msg
view model =
    case model.pageState of
        Loaded page ->
            viewPage page


viewPage : Page -> Html Msg
viewPage page =
    case page of
        Home subModel ->
            Home.view subModel
                |> Html.map HomeMsg

        PProject subModel ->
            PProject.view subModel
                |> Html.map PProjectMsg

        NotFoundPage ->
            Page.NotFound.view


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    updatePage (getPage model.pageState) msg model


getPage : PageState -> Page
getPage pageState =
    case pageState of
        Loaded page ->
            page


(=>) : a -> b -> ( a, b )
(=>) =
    (,)


updatePage : Page -> Msg -> Model -> ( Model, Cmd Msg )
updatePage page msg model =
    let
        toPage toModel toMsg subUpdate subMsg subModel =
            let
                ( newModel, newCmd ) =
                    subUpdate subMsg subModel
            in
                ( { model | pageState = Loaded (toModel newModel) }, Cmd.map toMsg newCmd )
    in
        case ( msg, page ) of
            ( HomeLoaded subModel, _ ) ->
                { model | pageState = Loaded (Home subModel) } => Cmd.none

            ( HomeMsg subMsg, Home subModel ) ->
                toPage Home HomeMsg (Home.update) subMsg subModel

            ( PProjectLoaded subModel, _ ) ->
                { model | pageState = Loaded (PProject subModel) } => Cmd.none

            ( PProjectMsg subMsg, PProject subModel ) ->
                toPage PProject PProjectMsg (PProject.update) subMsg subModel

            ( HandleLocationChange location, _ ) ->
                init location

            _ ->
                model => Cmd.none


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


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none
