"use strict";

export const newLatLngImpl = function(x, y) {
  return function() {
    return new google.maps.LatLng(x, y);
  }
}

export const toLiteralImpl = function(latLng) {
  return latLng.toJSON();
}

export const latImpl = function(latLng) {
  return latLng.lat();
}

export const lngImpl = function(latLng) {
  return latLng.lng();
}

export const toStringImpl = function(latLng) {
  return latLng.toString();
}

export const equalsImpl = function(thisLatLng, thatLatLng) {
  return thisLatLng.equals(thatLatLng);
}
