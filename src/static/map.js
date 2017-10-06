export default class Map {
  constructor(google, element) {
    this.google = google;
    this.element = element;
    this.map = this._initializeMap();
  }

  _initializeMap() {
    const map = new this.google.maps.Map(this.element, {});
    map.panTo({ lat: 0, lng: 0 });
    map.setZoom(4);
    return map;
  }
}
