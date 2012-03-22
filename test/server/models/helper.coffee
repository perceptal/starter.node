express = require "express"
mongoose = require "mongoose"
config = require "../../../config"
model = require("../../../server/models/model.coffee")

connect = ->
  app = express.createServer()
  app.configure "test", config.test
  mongoose.connect app.set("db-uri")

module.exports.model = (name) ->
  connect()
  model("user")


