module Main exposing (..)

import Model
import Update
import View
import Html


main : Program Never Model.Model Model.Msg
main =
    Html.program
        { init = Update.initial
        , update = Update.update
        , subscriptions = Update.subscriptions
        , view = View.view
        }
