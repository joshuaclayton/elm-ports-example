port module Update
    exposing
        ( subscriptions
        , initial
        , update
        )

import Flags
import Model exposing (Model, Msg(..))
import Office.Model as Office
import GoogleMapMarker


subscriptions : Model -> Sub Msg
subscriptions =
    always (clickedMapMarker (SelectOfficeById << Office.Id))


initial : Flags.Model -> ( Model, Cmd Msg )
initial flags =
    let
        initialModel =
            initialModelFromFlags flags

        initialLatLngs =
            List.map GoogleMapMarker.fromOffice initialModel.offices
    in
        ( initialModel, initialized initialLatLngs )


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NoOp ->
            ( model, Cmd.none )

        SelectOffice office ->
            { model | selectedOffice = Just office }
                |> navigateMapsToOffice

        SelectOfficeById id ->
            selectOfficeById id model
                |> navigateMapsToOffice


navigateMapsToOffice : Model -> ( Model, Cmd Msg )
navigateMapsToOffice model =
    let
        cmd =
            Maybe.map (selectLatLon << GoogleMapMarker.fromOffice) model.selectedOffice
                |> Maybe.withDefault Cmd.none
    in
        ( model, cmd )


selectOfficeById : Office.Id -> Model -> Model
selectOfficeById officeId model =
    let
        selectedOffice =
            List.head <|
                List.filter (\o -> o.id == officeId) model.offices
    in
        { model | selectedOffice = selectedOffice }


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


port initialized : List GoogleMapMarker.Model -> Cmd a


port selectLatLon : GoogleMapMarker.Model -> Cmd a


port clickedMapMarker : (Int -> msg) -> Sub msg
