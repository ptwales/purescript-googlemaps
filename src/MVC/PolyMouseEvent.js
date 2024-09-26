"use strict";

export const getEdgeImpl = function (polyMouseEvent) {
  return polyMouseEvent.edge;
}

export const getPathImpl = function (polyMouseEvent) {
  return polyMouseEvent.path;
}

export const getVertexImpl = function (polyMouseEvent) {
  return polyMouseEvent.vertex;
}
