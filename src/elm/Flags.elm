module Flags
    exposing
        ( Model
        , decode
        )

import Json.Decode as Decode exposing (Decoder)
import Json.Encode
import Office.Decoder as Office
import Office.Model as Office


type alias Model =
    Json.Encode.Value


decode : Model -> Result String (List Office.Model)
decode =
    Decode.decodeValue (Decode.field "offices" <| Decode.list Office.decoder)
