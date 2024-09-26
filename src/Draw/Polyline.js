"use strict";

export const newPolylineImpl = function(opts) {
  return function() {
    return new google.maps.Polyline(opts);
  }
}

export const deletePolylineImpl = function(poly) {
  return function() {
    poly = null;
    return;
  }
}

export const getMapImpl = function(disp) {
  return disp.getMap();
}

export const setMapImpl = function(disp, map) {
  return function() {
    disp.setMap(map);
    return disp;
  }
}

export const setOptionsImpl = function(poly, options) {
  return function() {
    poly.setOptions(options);
    return poly;
  }
}
