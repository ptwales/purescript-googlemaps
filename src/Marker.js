"use strict";

exports.newMarkerImpl = function(opts) {
  return function() {
    return new google.maps.Marker(opts);
  }
}

exports.removeMarkerImpl = function(marker) {
  return function() {
    marker.setMap(null);
    return marker;
  }
}

exports.deleteMarkerImpl = function(marker) {
  return function() {
    marker = null;
    return;
  }
}

exports.setMarkerPositionImpl = function(marker, latlng) {
  return function() {
    marker.setPosition(latlng);
    return marker;
  }
}

exports.setMarkerLabelImpl = function(marker, label) {
  return function() {
    marker.setLabel(label);
    return marker;
  }
}

exports.undefined = undefined;
