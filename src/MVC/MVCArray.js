"use strict";

export const newMVCArrayImpl = function() {
  return function() {
    return new google.maps.MVCArray();
  }
}

export const pushMVCArrayImpl = function(arr, ele) {
  return function() {
    arr.push(ele);
    return;
  }
}

export const popMVCArrayImpl = function(arr) {
  return function() {
    return arr.pop();
  }
}

export const toArrayImpl = function(arr) {
  return arr.getArray();
}
