module Office.View exposing (view)

import Html exposing (..)
import Html.Attributes exposing (class)
import Html.Events exposing (onClick)
import Model exposing (Msg(SelectOffice))
import Office.Model as Office
import Address.View as Address


view : List Office.Model -> Html Msg
view offices =
    ul [ class "offices" ] (List.map viewOffice offices)


viewOffice : Office.Model -> Html Msg
viewOffice office =
    li [ onClick <| SelectOffice office ]
        [ h3 [] [ text office.name ]
        , Address.view office.address
        ]
