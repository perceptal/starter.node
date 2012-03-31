mongoose  = require "mongoose"
Schema    = mongoose.Schema

GroupSchema = new Schema(
  owner       : { type: Schema.ObjectId }
  name        : { type: String, required: true, unique: true }
  code        : { type: String, required: true, unique: true }
  email       : { type: String, required: true, unique: true, lowercase: true }
  tel         : { type: String }
  parent      : { type: Schema.ObjectId, ref: "group" }
)

GroupSchema.statics.search = (query, callback) ->
  @where("name", new RegExp(query, "i")).run(callback)

module.exports = GroupSchema