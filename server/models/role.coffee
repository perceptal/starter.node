mongoose  = require "mongoose"
Schema    = mongoose.Schema

RoleSchema = new Schema
  owner       : { type: Schema.ObjectId }
  name        : { type: String }

module.exports = RoleSchema