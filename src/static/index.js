require("./styles/app.scss");
import Map from "./map.js";

const Elm = require("../elm/Main");
const flags = {
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
};

document.addEventListener("DOMContentLoaded", () => {
  const app = Elm.Main.embed(document.getElementById("main"), flags);

  app.ports.initialized.subscribe(latLngs => {
    window.requestAnimationFrame(() => {
      const map = new Map(window.google, document.getElementById("map"));
      map.registerLatLngs(latLngs);
    });
  });
});
