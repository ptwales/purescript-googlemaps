"use strict";

export const newMarkerImpl = function(opts) {
  return function() {
    return new google.maps.Marker(opts);
  }
}

export const removeMarkerImpl = function(marker) {
  return function() {
    marker.setMap(null);
    return marker;
  }
}

export const deleteMarkerImpl = function(marker) {
  return function() {
    marker = null;
    return;
  }
}

export const getAnimationImpl = function(marker) {
  return marker.getAnimation();
}

export const getClickableImpl = function(marker) {
  return marker.getClickable();
}

//export const getCursorImpl = function(marker) {
//  return marker.getCursor();
//}

export const getDraggableImpl = function(marker) {
  return marker.getDraggable();
}

export const getIconImpl = function(marker) {
  return marker.getIcon();
}

export const getLabelImpl = function(marker) {
  return marker.getLabel();
}

export const getMapImpl = function(marker) {
  return marker.getMap();
}

export const getOpacityImpl = function(marker) {
  return marker.getOpacity();
}

export const getPositionImpl = function(marker) {
  return marker.getPosition();
}

//export const getShapeImpl = function(marker) {
//  return marker.getShape();
//}

export const getTitleImpl = function(marker) {
  return marker.getTitle();
}

export const getVisibleImpl = function(marker) {
  return marker.getVisible();
}

export const getZIndexImpl = function(marker) {
  return marker.getZIndex();
}

export const setAnimationImpl = function(marker, animation) {
  return function() {
    marker.setAnimation(animation);
    return marker;
  }
}

export const setClickableImpl = function(marker, clickable) {
  return function() {
    marker.setClickable(clickable);
    return marker;
  }
}

//export const setCursorImpl = function(marker, cursor) {
//  return function() {
//    marker.setCursor(cursor);
//    return marker;
//  }
//}

export const setDraggableImpl = function(marker, draggable) {
  return function() {
    marker.setDraggable(draggable);
    return marker;
  }
}

export const setIconImpl = function(marker, icon) {
  return function() {
    marker.setIcon(icon);
    return marker;
  }
}

export const setLabelImpl = function(marker, label) {
  return function() {
    marker.setLabel(label);
    return marker;
  }
}

export const setMapImpl = function(marker, map) {
  return function() {
    marker.setMap(map);
    return marker;
  }
}

export const setOpacityImpl = function(marker, opacity) {
  return function() {
    marker.setOpacity(opacity);
    return marker;
  }
}

export const setOptionsImpl = function(marker, options) {
  return function() {
    marker.setOptions(options);
    return marker;
  }
}

export const setPositionImpl = function(marker, latlng) {
  return function() {
    marker.setPosition(latlng);
    return marker;
  }
}

//export const setShapeImpl = function(marker, shape) {
//  return function() {
//    marker.setShape(shape);
//    return marker;
//  }
//}

export const setTitleImpl = function(marker, title) {
  return function() {
    marker.setTitle(title);
    return marker;
  }
}

export const setVisibleImpl = function(marker, visible) {
  return function() {
    marker.setVisible(visible);
    return marker;
  }
}

export const setZIndexImpl = function(marker, zIndex) {
  return function() {
    marker.setZIndex(zIndex);
    return marker;
  }
}
