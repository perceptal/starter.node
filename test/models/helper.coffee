connection = require "../../server/config/connection"
model = require "../../server/models/model"

module.exports.connect = (callback) ->
  connection.connect connection[process.env.NODE_ENV || "test"]
  callback()

module.exports.disconnect = (callback) ->
  connection.disconnect()
  callback()

module.exports.model = (name) ->
  model name



