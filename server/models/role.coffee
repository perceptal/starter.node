mongoose  = require "mongoose"
Schema    = mongoose.Schema

module.exports = new Schema(
  owner       : Schema.ObjectId
, name        : String
)
