module Office.View exposing (view)

import Html exposing (..)
import Office.Model as Office
import Address.View as Address


view : List Office.Model -> Html a
view offices =
    ul [] (List.map viewOffice offices)


viewOffice : Office.Model -> Html a
viewOffice office =
    li []
        [ h3 [] [ text office.name ]
        , Address.view office.address
        ]
