mongoose = require "mongoose"

exports.connect = (connection_string) ->

  connected = false

  if !connected
    mongoose.connect connection_string
    connected = true

exports.disconnect = ->
  mongoose.disconnect()

exports.development = "mongodb://localhost/starter_development"
exports.test = "mongodb://localhost/starter_test"
exports.production = process.env.MONGOHQ_URL