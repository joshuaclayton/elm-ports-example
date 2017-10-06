module Model
    exposing
        ( Model
        , Msg(..)
        , initial
        )

import Office.Model as Office


type Msg
    = NoOp


type alias Model =
    { offices : List Office.Model
    }


initial : Model
initial =
    { offices = []
    }
