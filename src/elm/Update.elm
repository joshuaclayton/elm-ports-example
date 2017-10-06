module Update
    exposing
        ( subscriptions
        , initial
        , update
        )

import Model exposing (Model, Msg(..))


subscriptions : Model -> Sub Msg
subscriptions =
    always Sub.none


initial : ( Model, Cmd Msg )
initial =
    ( Model.initial, Cmd.none )


update : Msg -> Model -> ( Model, Cmd Msg )
update _ model =
    ( model, Cmd.none )
