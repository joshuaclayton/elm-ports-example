module View exposing (view)

import Html exposing (..)
import Html.Attributes exposing (class, href)
import Model exposing (Model)


view : Model -> Html a
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


pageContent : Model -> Html a
pageContent _ =
    div [] [ text "hello world" ]


pageFooter : Html a
pageFooter =
    footer []
        [ p [] [ text "View this on ", a [ href githubUrl ] [ text "GitHub" ] ]
        ]


githubUrl : String
githubUrl =
    "https://github.com/joshuaclayton/elm-ports-example"
