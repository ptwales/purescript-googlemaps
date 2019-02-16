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

//exports.setAnimationImpl = function(marker, animation) {
//  return function() {
//    marker.setAnimation(animation);
//    return marker;
//  }
//}

exports.setClickableImpl = function(marker, clickable) {
  return function() {
    marker.setClickable(clickable);
    return marker;
  }
}

//exports.setCursorImpl = function(marker, cursor) {
//  return function() {
//    marker.setCursor(cursor);
//    return marker;
//  }
//}

exports.setDraggableImpl = function(marker, draggable) {
  return function() {
    marker.setDraggable(draggable);
    return marker;
  }
}

exports.setIconImpl = function(marker, icon) {
  return function() {
    marker.setIcon(icon);
    return marker;
  }
}

exports.setLabelImpl = function(marker, label) {
  return function() {
    marker.setLabel(label);
    return marker;
  }
}

exports.setMapImpl = function(marker, map) {
  return function() {
    marker.setMap(map);
    return marker;
  }
}

exports.setOpacityImpl = function(marker, opacity) {
  return function() {
    marker.setOpacity(opacity);
    return marker;
  }
}

exports.setOptionsImpl = function(marker, options) {
  return function() {
    marker.setOptions(options);
    return marker;
  }
}

exports.setPositionImpl = function(marker, latlng) {
  return function() {
    marker.setPosition(latlng);
    return marker;
  }
}

//exports.setShapeImpl = function(marker, shape) {
//  return function() {
//    marker.setShape(shape);
//    return marker;
//  }
//}

exports.setTitleImpl = function(marker, title) {
  return function() {
    marker.setTitle(title);
    return marker;
  }
}

exports.setVisibleImpl = function(marker, visible) {
  return function() {
    marker.setVisible(visible);
    return marker;
  }
}

exports.setZIndexImpl = function(marker, zIndex) {
  return function() {
    marker.setZIndex(zIndex);
    return marker;
  }
}

exports.undefined = undefined;
