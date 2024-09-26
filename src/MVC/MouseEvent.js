"use strict";

export const stopImpl = function (mouseEvent) {
  return function () {
    mouseEvent.stop();
    return;
  }
}

export const getLatLngImpl = function (mouseEvent) {
  return mouseEvent.latLng;
}
