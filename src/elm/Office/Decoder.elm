module Office.Decoder exposing (decoder)

import Json.Decode as Decode exposing (Decoder)
import Office.Model as Office
import Address.Decoder as Address


decoder : Office.Id -> Decoder Office.Model
decoder id =
    Decode.map3 Office.Model
        (Decode.succeed id)
        (Decode.field "name" Decode.string)
        (Decode.field "address" Address.decoder)
