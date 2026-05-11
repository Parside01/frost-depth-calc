const initialState = window.initialMapState;

const map = L.map("map", {
  zoomAnimation: false,
  markerZoomAnimation: false,
}).setView([initialState.latitude, initialState.longitude], 6);

L.tileLayer("https://tile.openstreetmap.org/{z}/{x}/{y}.png", {
  maxZoom: 18,
  attribution: "&copy; OpenStreetMap",
}).addTo(map);

let settlementMarkers = [];
let settlementLabels = [];
let selectedMarker = null;
let selectedLabel = null;

function escapeHtml(value) {
  return String(value)
    .replaceAll("&", "&amp;")
    .replaceAll("<", "&lt;")
    .replaceAll(">", "&gt;")
    .replaceAll('"', "&quot;")
    .replaceAll("'", "&#039;");
}

function labelIcon(text) {
  return L.divIcon({
    className: "settlement-label",
    html: '<span class="settlement-label__content">' + escapeHtml(text) + "</span>",
    iconSize: [0, 0],
    iconAnchor: [0, 44],
  });
}

window.updateNearbySettlements = function updateNearbySettlements(points, selectedLat, selectedLon, adjustView) {
  settlementMarkers.forEach(function removeMarker(marker) {
    marker.remove();
  });
  settlementLabels.forEach(function removeLabel(label) {
    label.remove();
  });
  settlementMarkers = [];
  settlementLabels = [];

  const markerBounds = [];
  points.forEach(function addSettlement(point) {
    const marker = L.marker([point.latitude, point.longitude])
      .addTo(map)
      .bindPopup(point.name + "<br>" + point.region, { autoPan: false });
    const label = L.marker([point.latitude, point.longitude], {
      icon: labelIcon(point.name),
      interactive: false,
      keyboard: false,
      zIndexOffset: 1000,
    }).addTo(map);

    settlementMarkers.push(marker);
    settlementLabels.push(label);
    markerBounds.push(marker.getLatLng());
  });

  if (selectedMarker === null) {
    selectedMarker = L.marker([selectedLat, selectedLon]).addTo(map);
    selectedLabel = L.marker([selectedLat, selectedLon], {
      icon: labelIcon("Выбранная точка"),
      interactive: false,
      keyboard: false,
      zIndexOffset: 1000,
    }).addTo(map);
  } else {
    selectedMarker.setLatLng([selectedLat, selectedLon]);
    selectedLabel.setLatLng([selectedLat, selectedLon]);
  }
  markerBounds.push(selectedMarker.getLatLng());

  if (adjustView && markerBounds.length > 1) {
    map.fitBounds(L.latLngBounds(markerBounds), {
      padding: [28, 28],
      maxZoom: 8,
      animate: false,
    });
  }
};

window.updateNearbySettlements(initialState.points, initialState.latitude, initialState.longitude, true);

new QWebChannel(qt.webChannelTransport, function initializeBridge(channel) {
  const bridge = channel.objects.bridge;
  map.on("click", function handleMapClick(event) {
    const lat = event.latlng.lat;
    const lon = event.latlng.lng;
    if (selectedMarker === null) {
      selectedMarker = L.marker([lat, lon]).addTo(map);
      selectedLabel = L.marker([lat, lon], {
        icon: labelIcon("Выбранная точка"),
        interactive: false,
        keyboard: false,
        zIndexOffset: 1000,
      }).addTo(map);
    } else {
      selectedMarker.setLatLng([lat, lon]);
      selectedLabel.setLatLng([lat, lon]);
    }
    bridge.selectPoint(lat, lon);
  });
});
