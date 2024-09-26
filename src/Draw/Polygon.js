"use strict";

export const newPolygonImpl = function(opts) {
  return function() {
    return new google.maps.Polygon(opts);
  }
}

export const deletePolygonImpl = function(poly) {
  return function() {
    poly = null;
    return;
  }
}

export const getPathsImpl = function(poly) {
  return poly.getPaths();
}

export const setPathsImpl = function(poly, paths) {
  return function() {
    poly.setPaths(paths);
    return poly;
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
