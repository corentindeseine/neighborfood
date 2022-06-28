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

    // Création de la map
    this.map = new mapboxgl.Map({
      container: this.element,
      style: "mapbox://styles/corentindeseine/cl49xyz8g003z14nvdtqxj6gy",
      center:[2.378057, 48.864597], // mettre current_user position au lieu des données en dur
      zoom: 14,

    })
    this.addMarkersToMap();

    // Barre de recherche de l'adresse sur la map
    // this.map.addControl(new MapboxGeocoder({
    //   accessToken: mapboxgl.accessToken,
    //   mapboxgl: mapboxgl,
    //   placeholder: 'Saisissez votre adresse'
    // }));
  }

  addMarkersToMap() {
    this.markersValue.forEach((marker) => {

      // Création d'un élément HTML pour custom les marker
      const customMarker = document.createElement("div")
      customMarker.className = "marker"
      customMarker.style.backgroundImage = `url('${marker.image_url}')`
      customMarker.style.backgroundSize = "cover"
      customMarker.style.width = "38px"
      customMarker.style.height = "38px"
      customMarker.style.border = '1px solid  rgb(200, 200, 200)'
      customMarker.style.borderRadius = "50%"

      customMarker.setAttribute("data-action", "click->pin-nav#navigateTo")
      customMarker.setAttribute('data-user-id', marker.user_id)

      const markers = new mapboxgl.Marker(customMarker).setLngLat([ marker.lng, marker.lat ])

      // On récupère les informations
      const element = markers.getElement();
      const cardCooker = document.querySelector('.swiper-wrapper')
      // Entoure le marqueur selectionné quand on click dessus
      element.addEventListener('mouseenter', () => {
        cardCooker.classList.remove('invisible')
        element.style.border = '2px solid  #ff6161'
        element.style.width = '45px'
        element.style.height = '45px'
      });

      element.addEventListener('mouseleave', () => {
        element.style.border = '1px solid  rgb(200, 200, 200)'
        element.style.width = '38px'
        element.style.height = '38px'
      });

      // Centre sur le marker sur lequel on clique
      element.addEventListener('click', () => { this.map.flyTo({ center: [marker.lng, marker.lat] }) });

      // Ajoute les markers à la map
      markers.addTo(this.map)
    });
  }
}
