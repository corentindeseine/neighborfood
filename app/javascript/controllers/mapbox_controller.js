import { Controller } from "@hotwired/stimulus"
import mapboxgl from "mapbox-gl";
import MapboxGeocoder from '@mapbox/mapbox-gl-geocoder';

export default class extends Controller {
  static values = {
    apiKey: String,
    markers: Array
  }

  connect() {
    mapboxgl.accessToken = this.apiKeyValue


    this.map = new mapboxgl.Map({
      container: this.element,
      style: "mapbox://styles/corentindeseine/cl49xyz8g003z14nvdtqxj6gy",
      center:[2.3798866, 48.8648601], // mettre current_user position au lieu des données en dur
      zoom: 14,
    })
    this.addMarkersToMap();
    this.map.addControl(new MapboxGeocoder({ accessToken: mapboxgl.accessToken,mapboxgl: mapboxgl }));
  }

  addMarkersToMap() {
    this.markersValue.forEach((marker) => {

      // Création d'un élément HTML pour custom les marker
      const customMarker = document.createElement("div")
      customMarker.className = "marker"
      customMarker.style.backgroundImage = `url('${marker.image_url}')`
      customMarker.style.backgroundSize = "cover"
      customMarker.style.width = "30px"
      customMarker.style.height = "30px"
      customMarker.style.borderRadius = "50%"

      const markers = new mapboxgl.Marker(customMarker).setLngLat([ marker.lng, marker.lat ])

      // get the marker element
      const element = markers.getElement();
      element.id = 'markers'
      // hover event listener
      element.addEventListener('mouseenter', () => element.style.border = '2px solid  #ff6161');
      element.addEventListener('mouseleave', () => element.style.border = '0px');

      // Centre sur le marker sur lequel on clique
      element.addEventListener('click', () => {
        this.map.flyTo({center: [marker.lng, marker.lat]});
      });

      markers.addTo(this.map)
    });
  }
}
