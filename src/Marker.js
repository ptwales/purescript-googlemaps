"use strict";

exports.newMarkerImpl = function(opts) {
  return function() {
    return new google.maps.Marker(opts);
  }
}

exports.delMarkerImpl = function(marker) {
  return function() {
    marker.setMap(null);
    return;
  }
}

exports.setMarkerPositionImpl = function(marker, latlng) {
  return function() {
    marker.setPosition(latlng);
    return;
  }
}

exports.setMarkerLabelImpl = function(marker, label) {
  return function() {
    marker.setLabel(label);
    return;
  }
}

exports.undefined = undefined;