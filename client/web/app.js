// Initialize MapLibre GL JS Map
const map = new maplibregl.Map({
    container: 'map',
    style: 'https://demotiles.maplibre.org/style.json', // Free OSM-based style
    center: [0, 20],
    zoom: 2
});

// Add navigation control
map.addControl(new maplibregl.NavigationControl());

// Initialize OpenLayers Map (kept for reference, not used simultaneously)
const olMap = new ol.Map({
    target: 'map',
    layers: [
        new ol.layer.Tile({
            source: new ol.source.OSM()
        })
    ],
    view: new ol.View({
        center: ol.proj.fromLonLat([0, 20]),
        zoom: 2
    })
});

// Initially hide OpenLayers map
olMap.getViewport().style.display = 'none';

// Toggle between MapLibre and OpenLayers
let currentMap = 'maplibre';
document.getElementById('toggleLayer').addEventListener('click', () => {
    if (currentMap === 'maplibre') {
        document.getElementById('map').style.visibility = 'hidden';
        olMap.getViewport().style.display = 'block';
        currentMap = 'openlayers';
    } else {
        document.getElementById('map').style.visibility = 'visible';
        olMap.getViewport().style.display = 'none';
        currentMap = 'maplibre';
    }
});

// Add a simple marker
new maplibregl.Marker()
    .setLngLat([0, 0])
    .addTo(map);

// Add a simple feature to OpenLayers
const vectorLayer = new ol.layer.Vector({
    source: new ol.source.Vector({
        features: [
            new ol.Feature({
                geometry: new ol.geom.Point(ol.proj.fromLonLat([0, 0]))
            })
        ]
    })
});
olMap.addLayer(vectorLayer);

// Handle window resize
window.addEventListener('resize', () => {
    map.resize();
    olMap.updateSize();
});
