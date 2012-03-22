mongoose = require "mongoose"

module.exports = (name) ->
  schema = require "./" + name
  mongoose.model name, schema