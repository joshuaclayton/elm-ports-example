module Address.Model
    exposing
        ( Model
        , Country(..)
        , LatLon
        )


type alias Model =
    { street1 : String
    , street2 : String
    , city : String
    , state : String
    , postalCode : String
    , country : Country
    , geo : LatLon
    }


type Country
    = US
    | UK


type alias LatLon =
    { latitude : Float
    , longitude : Float
    }
