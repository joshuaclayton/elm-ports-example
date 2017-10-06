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

  _initializeMap() {
    const map = new this.google.maps.Map(this.element, {});
    map.panTo({ lat: 0, lng: 0 });
    map.setZoom(4);
    return map;
  }
}
