mongoose = require "mongoose"

module.exports = (name) ->
  Schema = require "./" + name
  mongoose.model name, Schema