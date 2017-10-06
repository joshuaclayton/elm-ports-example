module Update
    exposing
        ( subscriptions
        , initial
        , update
        )

import Flags
import Model exposing (Model, Msg(..))


subscriptions : Model -> Sub Msg
subscriptions =
    always Sub.none


initial : Flags.Model -> ( Model, Cmd Msg )
initial flags =
    let
        decodedOffices =
            Flags.decode flags

        updateOffices model offices =
            { model | offices = offices }

        initialModel =
            Result.map (updateOffices Model.initial) decodedOffices
                |> Result.withDefault Model.initial
    in
        ( initialModel, Cmd.none )


update : Msg -> Model -> ( Model, Cmd Msg )
update _ model =
    ( model, Cmd.none )
