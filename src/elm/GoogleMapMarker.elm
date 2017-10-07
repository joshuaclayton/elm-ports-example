module GoogleMapMarker
    exposing
        ( Model
        , fromOffice
        )

import Json.Encode as Encode
import Office.Model as Office
import Address.Model as Address


type alias Model =
    Encode.Value


fromOffice : Office.Model -> Model
fromOffice ({ id } as office) =
    Encode.object
        [ ( "id", encodeOfficeId id )
        , ( "latLng", encodeLatLon office.address.geo )
        ]


encodeOfficeId : Office.Id -> Encode.Value
encodeOfficeId (Office.Id id) =
    Encode.int id


encodeLatLon : Address.LatLon -> Encode.Value
encodeLatLon latLon =
    Encode.object
        [ ( "lat", Encode.float latLon.latitude )
        , ( "lng", Encode.float latLon.longitude )
        ]
