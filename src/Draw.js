"use strict";

export const getDraggableImpl = function(draw) {
  return draw.getDraggable();
};

export const getEditableImpl = function(draw) {
  return draw.getEditable();
};

export const getPathImpl = function(draw) {
  return draw.getPath();
};

export const getVisibleImpl = function(draw) {
  return draw.getVisible();
};

export const setDraggableImpl = function(draw, draggable) {
  return function() {
    draw.setDraggable(draggable);
    return draw;
  };
};

export const setEditableImpl = function(draw, editable) {
  return function() {
    draw.setEditable(editable);
    return draw;
  };
};

export const setPathImpl = function(draw, path) {
  return function() {
    draw.setPath(path);
    return draw;
  };
};

export const setVisibleImpl = function(draw, visible) {
  return function() {
    draw.setVisible(visible);
    return draw;
  };
};
