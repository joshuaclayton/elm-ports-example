module View exposing (view)

import Html exposing (..)
import Html.Attributes exposing (class, href, id)
import Model exposing (Model, Msg)
import Office.View as Office


view : Model -> Html Msg
view model =
    div [ class "container" ]
        [ pageHeader
        , pageContent model
        , pageFooter
        ]


pageHeader : Html a
pageHeader =
    header []
        [ h1 [] [ text "Elm Ports Example" ]
        ]


pageContent : Model -> Html Msg
pageContent model =
    div []
        [ div [ id "map" ] []
        , Office.view model.offices
        ]


pageFooter : Html a
pageFooter =
    footer []
        [ p []
            [ text "View this on "
            , a [ href githubUrl ] [ text "GitHub" ]
            ]
        ]


githubUrl : String
githubUrl =
    "https://github.com/joshuaclayton/elm-ports-example"
