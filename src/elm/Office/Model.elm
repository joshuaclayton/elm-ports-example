module Office.Model exposing (Model, Id(..))

import Address.Model as Address


type Id
    = Id Int


type alias Model =
    { id : Id
    , name : String
    , address : Address.Model
    }
