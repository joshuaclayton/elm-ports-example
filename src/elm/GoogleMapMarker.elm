module GoogleMapMarker
    exposing
        ( Model
        , fromOffice
        )

import Office.Model as Office


type alias Model =
    { latLng : { lat : Float, lng : Float }
    , id : Int
    }


fromOffice : Office.Model -> Model
fromOffice ({ id } as office) =
    let
        (Office.Id officeId) =
            id
    in
        { latLng =
            { lat = office.address.geo.latitude
            , lng = office.address.geo.longitude
            }
        , id = officeId
        }
