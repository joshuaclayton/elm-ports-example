module Address.View exposing (view)

import Html exposing (..)
import Html.Attributes exposing (class)
import Address.Model as Address


view : Address.Model -> Html a
view address =
    div [ class "adr" ]
        [ div [ class "street-address" ] [ text address.street1 ]
        , div [ class "extended-address" ] [ text address.street2 ]
        , span [ class "locality" ] [ text address.city ]
        , span [ class "region" ] [ text address.state ]
        , span [ class "postal-code" ] [ text address.postalCode ]
        , div [ class "country-name" ] [ text <| countryName address.country ]
        ]


countryName : Address.Country -> String
countryName country =
    case country of
        Address.US ->
            "United States"

        Address.UK ->
            "United Kingdom"
