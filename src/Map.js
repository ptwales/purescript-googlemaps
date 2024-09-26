export const gMapImpl = function(ele, opts) {
  return function() {
    return new google.maps.Map(ele, opts);
  }
}

//export const fitBounds = function(map, latLngBounds) {
//  return function() {
//    map.fitBounds(latLngBounds);
//    return map;
//  }
//}

//export const getBounds = function(map) {
//  return map.getBounds();
//}

export const getCenterImpl = function(map) {
  return map.getCenter();
}

export const getClickableIconsImpl = function(map) {
  return map.getClickableIcons();
}

export const getDivImpl = function(map) {
  return map.getDiv();
}

export const getHeadingImpl = function(map) {
  return map.getHeading();
}

export const getMapTypeIdImpl = function(map) {
  return map.getMapTypeId();
}

//export const getProjectionImpl = function(map) {
//  return map.getProjection();
//}

//export const getStreetViewImpl = function(map) {
//  return map.getStreetView();
//}

export const getTiltImpl = function(map) {
  return map.getTilt();
}

export const getZoomImpl = function(map) {
  return map.getZoom();
}

export const panByImpl = function(map, x, y) {
  return function() {
    map.panBy(x, y);
    return map;
  }
}

export const panToImpl = function(map, x) {
  return function() {
    map.panTo(x);
    return map;
  }
}

//export const panToBounds = function(map, latLngBounds) {
//  return function() {
//    map.panToBounds(latLngBounds);
//    return map;
//  }
//}

export const setCenterImpl = function(map, latLng) {
  return function() {
    map.setCenter(latLng);
    return map;
  }
}

export const setClickableIconsImpl = function(map, clickable) {
  return function() {
    map.setClickableIcons(clickable);
    return map;
  }
}

export const setHeadingImpl = function(map, heading) {
  return function() {
    map.setHeading(heading);
    return map;
  }
}

export const setMapTypeIdImpl = function(map, mapTypeId) {
  return function() {
    map.setMapTypeId(mapTypeId);
    return map;
  }
}

export const setOptionsImpl = function(map, options) {
  return function() {
    map.setOptions(options);
    return map;
  }
}

//export const setStreetViewImpl = function(map, streetView) {
//  return function() {
//    map.setStreetView(streetView);
//    return map;
//  }
//}

export const setTiltImpl = function(map, tilt) {
  return function() {
    map.setTilt(tilt);
    return map;
  }
}

export const setZoomImpl = function(map, zoom) {
  return function() {
    map.setZoom(zoom);
    return map;
  }
}
