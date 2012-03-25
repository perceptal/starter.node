mongoose  = require "mongoose"
Schema    = mongoose.Schema

module.exports = new Schema(
  owner       : Schema.ObjectId
  username    : { type: String, required: true, unique: true }
  email       : { type: String, required: true, unique: true }
)