module Model
    exposing
        ( Model
        , Msg(..)
        , initial
        )

import Office.Model as Office


type Msg
    = NoOp
    | SelectOffice Office.Model


type alias Model =
    { offices : List Office.Model
    , selectedOffice : Maybe Office.Model
    }


initial : Model
initial =
    { offices = []
    , selectedOffice = Nothing
    }
