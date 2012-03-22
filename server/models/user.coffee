mongoose  = require "mongoose"
Schema    = mongoose.Schema

module.exports = new Schema(
  owner       : Schema.ObjectId
, username    : String
, email       : String
)