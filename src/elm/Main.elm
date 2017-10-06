module Main exposing (..)

import Model
import Update
import View
import Html
import Flags


main : Program Flags.Model Model.Model Model.Msg
main =
    Html.programWithFlags
        { init = Update.initial
        , update = Update.update
        , subscriptions = Update.subscriptions
        , view = View.view
        }
