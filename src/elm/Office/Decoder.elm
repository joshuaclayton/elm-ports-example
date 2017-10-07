module Office.Decoder exposing (decoder)

import Json.Decode as Decode exposing (Decoder)
import Office.Model as Office
import Address.Decoder as Address


decoder : Decoder Office.Model
decoder =
    Decode.map3 Office.Model
        (Decode.field "id" idDecoder)
        (Decode.field "name" Decode.string)
        (Decode.field "address" Address.decoder)


idDecoder : Decoder Office.Id
idDecoder =
    Decode.map Office.Id Decode.int
