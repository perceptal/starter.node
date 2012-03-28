connection = require "../../../server/config/connection"
model = require "../../../server/models/model"

module.exports.connect = ->
  connection.connect connection[process.env.NODE_ENV || "test"]

module.exports.disconnect = ->
  connection.disconnect()

module.exports.model = (name) ->
  model("user")



