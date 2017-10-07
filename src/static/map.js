export default class Map {
  constructor(google, element, clickedCallback) {
    this.google = google;
    this.element = element;
    this.clickedCallback = clickedCallback;
    this.map = this._initializeMap();
  }

  registerLatLngs(latLngs) {
    const bounds = new this.google.maps.LatLngBounds();

    latLngs.forEach(o => {
      const gLatLng = o.latLng;
      bounds.extend(gLatLng);

      const marker = new this.google.maps.Marker({
        position: gLatLng,
        map: this.map
      });

      marker.addListener("click", () => {
        this.clickedCallback(o.id);
      });
    });

    this.map.fitBounds(bounds);
  }

  selectLatLng(o) {
    this.map.panTo(o.latLng);
    this.map.setZoom(12);
  }

  _initializeMap() {
    const map = new this.google.maps.Map(this.element, {});
    map.panTo({ lat: 0, lng: 0 });
    map.setZoom(4);

    this.google.maps.event.addDomListener(window, "resize", () => {
      const center = map.getCenter();
      this.google.maps.event.trigger(map, "resize");
      map.setCenter(center);
    });

    return map;
  }
}
