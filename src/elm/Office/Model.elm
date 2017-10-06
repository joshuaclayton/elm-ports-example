module Office.Model exposing (Model)

import Address.Model as Address


type alias Model =
    { name : String
    , address : Address.Model
    }
