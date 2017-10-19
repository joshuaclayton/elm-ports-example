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
    },
    {
      name: "New York",
      address: {
        street1: "1384 Broadway",
        street2: "20th Floor",
        city: "New York",
        state: "NY",
        postalCode: "10018",
        countryCode: "US",
        latLon: {
          latitude: 40.752552,
          longitude: -73.987007
        }
      }
    },
    {
      name: "Austin",
      address: {
        street1: "600 Congress Ave.",
        street2: "14th Floor",
        city: "Austin",
        state: "TX",
        postalCode: "78701",
        countryCode: "US",
        latLon: {
          latitude: 30.268611,
          longitude: -97.743181
        }
      }
    },
    {
      name: "London",
      address: {
        street1: "15 Long Lane, Barbican",
        street2: "3rd Floor, Griffin Court",
        city: "London",
        state: "",
        postalCode: "EC1A 9PN",
        countryCode: "UK",
        latLon: {
          latitude: 51.519776,
          longitude: -0.098997
        }
      }
    },
    {
      name: "Raleigh",
      address: {
        street1: "555 Fayetteville St",
        street2: "Suite 300",
        city: "Raleigh",
        state: "NC",
        postalCode: "27601",
        countryCode: "US",
        latLon: {
          latitude: 35.773245,
          longitude: -78.638951
        }
      }
    },
    {
      name: "San Francisco",
      address: {
        street1: "85 2nd St",
        street2: "Suite 700",
        city: "San Francisco",
        state: "CA",
        postalCode: "94105",
        countryCode: "US",
        latLon: {
          latitude: 37.78844,
          longitude: -122.399855
        }
      }
    },
    {
      name: "Washington, D.C.",
      address: {
        street1: "810 7th St NE",
        street2: "2nd Floor",
        city: "Washington",
        state: "DC",
        postalCode: "20002",
        countryCode: "US",
        latLon: {
          latitude: 38.900641,
          longitude: -76.996502
        }
      }
    }
  ]
};

const googleMapsUrl = apiKey => {
  if (typeof apiKey !== "undefined") {
    return `https://maps.googleapis.com/maps/api/js?key=${apiKey}`;
  } else {
    return "https://maps.googleapis.com/maps/api/js";
  }
};

const mountGoogleMaps = callback => {
  const scriptTag = document.createElement("script");

  scriptTag.src = googleMapsUrl(process.env.GOOGLE_MAPS_API_KEY);
  scriptTag.type = "text/javascript";
  scriptTag.onload = callback;

  document.head.appendChild(scriptTag);
};

document.addEventListener("DOMContentLoaded", () => {
  mountGoogleMaps(() => {
    const app = Elm.Main.embed(document.getElementById("main"), flags);

    let map;

    app.ports.initialized.subscribe(latLngs => {
      window.requestAnimationFrame(() => {
        map = new Map(
          window.google,
          document.getElementById("map"),
          app.ports.clickedMapMarker.send
        );
        map.registerLatLngs(latLngs);
      });
    });

    app.ports.selectLatLon.subscribe(latLng => {
      map.selectLatLng(latLng);
    });
  });
});
