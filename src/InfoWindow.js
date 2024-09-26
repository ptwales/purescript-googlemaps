"use strict";

export const newInfoWindowImpl = function(opts) {
  return function() {
    return new google.maps.InfoWindow(opts);
  }
}

export const openInfoWindowImpl = function(iw, map, marker) {
  return function() {
    iw.open(map, marker);
    return iw;
  }
}

export const closeInfoWindowImpl = function(infoWindow) {
  return function() {
    infoWindow.close();
    return infoWindow;
  }
}

export const deleteInfoWindowImpl = function(infoWindow) {
  return function() {
    infoWindow = null;
    return;
  }
}

export const getContentImpl = function(infoWindow) {
  return infoWindow.getContent();
}

export const getPositionImpl = function(infoWindow) {
  return infoWindow.getPosition();
}

export const getZIndexImpl = function(infoWindow) {
  return infoWindow.getZIndex();
}

export const setContentImpl = function(infoWindow, content) {
  return function() {
    infoWindow.setContent(content);
    return infoWindow;
  }
}

export const setOptionsImpl = function(infoWindow, options) {
  return function() {
    infoWindow.setOptions(options);
    return infoWindow;
  }
}

export const setPositionImpl = function(infoWindow, latLng) {
  return function() {
    infoWindow.setPosition(latLng);
    return infoWindow;
  }
}

export const setZIndexImpl = function(infoWindow, zIndex) {
  return function() {
    infoWindow.setZIndex(zIndex);
    return infoWindow;
  }
}
