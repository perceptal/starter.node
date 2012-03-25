mongoose  = require "mongoose"
Schema    = mongoose.Schema

RoleSchema = new Schema(
  owner       : Schema.ObjectId
  name        : { type: String }
)

module.exports = RoleSchema