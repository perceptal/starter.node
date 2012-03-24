require("coffee-script");

var express = require("express"),
    mongoose = require("mongoose"),
    app = require("./app");

if (!module.parent) {
  var port = process.env.PORT || 4000

  app.listen(port, function() {
    console.log("Express server listening on port %d, environment: %s", port, app.settings.env);
    console.log("Using Express %s, Mongoose %s", express.version, mongoose.version);
  })
}