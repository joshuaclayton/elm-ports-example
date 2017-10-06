export default class Map {
  constructor(google, element) {
    this.google = google;
    this.element = element;
    this.map = this._initializeMap();
  }

  registerLatLngs(latLngs) {
    const bounds = new this.google.maps.LatLngBounds();

    latLngs.forEach(latLng => {
      const gLatLng = { lat: latLng.latitude, lng: latLng.longitude };
      bounds.extend(gLatLng);

      new this.google.maps.Marker({
        position: gLatLng,
        map: this.map
      });
    });

    this.map.fitBounds(bounds);
  }

  selectLatLng(latLng) {
    this.map.panTo({ lat: latLng.latitude, lng: latLng.longitude });
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
