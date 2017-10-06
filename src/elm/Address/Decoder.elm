module Address.Decoder exposing (decoder)

import Address.Model as Address
import Json.Decode as Decode exposing (Decoder)


decoder : Decoder Address.Model
decoder =
    Decode.map7 Address.Model
        (Decode.field "street1" Decode.string)
        (Decode.field "street2" Decode.string)
        (Decode.field "city" Decode.string)
        (Decode.field "state" Decode.string)
        (Decode.field "postalCode" Decode.string)
        (Decode.field "countryCode" countryDecoder)
        (Decode.field "latLon" latLonDecoder)


countryDecoder : Decoder Address.Country
countryDecoder =
    Decode.string
        |> Decode.andThen
            (\value ->
                case value of
                    "US" ->
                        Decode.succeed Address.US

                    "UK" ->
                        Decode.succeed Address.UK

                    _ ->
                        Decode.fail "invalid country code"
            )


latLonDecoder : Decoder Address.LatLon
latLonDecoder =
    Decode.map2 Address.LatLon
        (Decode.field "latitude" Decode.float)
        (Decode.field "longitude" Decode.float)
