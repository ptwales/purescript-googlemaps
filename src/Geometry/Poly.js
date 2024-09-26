"use strict";

export const containsLocationImpl = function(latLng, polygon) {
  return google.maps.geometry.poly.containsLocation(latLng, polygon);
}

export const isLocationOnEdgeImpl = function(latLng, poly) {
  return google.maps.geometry.poly.isLocationOnEdge(latLng, poly);
}
