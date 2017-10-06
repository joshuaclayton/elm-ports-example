port module Update
    exposing
        ( subscriptions
        , initial
        , update
        )

import Flags
import Model exposing (Model, Msg(..))
import Address.Model as Address
import Office.Model as Office


subscriptions : Model -> Sub Msg
subscriptions =
    always Sub.none


initial : Flags.Model -> ( Model, Cmd Msg )
initial flags =
    let
        initialModel =
            initialModelFromFlags flags

        initialLatLngs =
            List.map officeLocation initialModel.offices
    in
        ( initialModel, initialized initialLatLngs )


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NoOp ->
            ( model, Cmd.none )

        SelectOffice office ->
            ( { model | selectedOffice = Just office }
            , selectLatLon <| officeLocation office
            )


officeLocation : Office.Model -> Address.LatLon
officeLocation =
    .geo << .address


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


port selectLatLon : Address.LatLon -> Cmd a
