'use strict';

exports.setupApiMap = async function() {
  require('dotenv').config();
  const apiKey = process.env.MAPS_API_KEY;
  const gmaps = "https://maps.googleapis.com/maps/api/js?key=" + apiKey;
  await require('download')(gmaps, __dirname);
  const google = require('./js');
  return;
};
