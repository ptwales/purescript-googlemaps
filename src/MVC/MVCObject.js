"use-strict";

export const addListenerImpl = function(object, eventName, handler) {
  return function() {
    return object.addListener(eventName, function(event) {
      handler(event)();
    });
  }
}

export const removeListenerImpl = function(listener) {
  return function() {
    listener.remove();
    return;
  }
}
