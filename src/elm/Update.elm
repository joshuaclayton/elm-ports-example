port module Update
    exposing
        ( subscriptions
        , initial
        , update
        )

import Flags
import Model exposing (Model, Msg(..))
import Address.Model as Address


subscriptions : Model -> Sub Msg
subscriptions =
    always Sub.none


initial : Flags.Model -> ( Model, Cmd Msg )
initial flags =
    let
        initialModel =
            initialModelFromFlags flags

        initialLatLngs =
            List.map (.geo << .address) initialModel.offices
    in
        ( initialModel, initialized initialLatLngs )


update : Msg -> Model -> ( Model, Cmd Msg )
update _ model =
    ( model, Cmd.none )


initialModelFromFlags : Flags.Model -> Model
initialModelFromFlags flags =
    let
        decodedOffices =
            Flags.decode flags

        updateOffices model offices =
            { model | offices = offices }
    in
        Result.map (updateOffices Model.initial) decodedOffices
            |> Result.withDefault Model.initial


port initialized : List Address.LatLon -> Cmd a
