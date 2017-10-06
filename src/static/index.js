require("./styles/app.scss");

var Elm = require("../elm/Main");
Elm.Main.embed(document.getElementById("main"), {
  offices: [
    {
      name: "Boston",
      address: {
        street1: "41 Winter St.",
        street2: "Fl 7",
        city: "Boston",
        state: "MA",
        postalCode: "02108",
        countryCode: "US",
        latLon: {
          latitude: 42.356157,
          longitude: -71.061634
        }
      }
    }
  ]
});
