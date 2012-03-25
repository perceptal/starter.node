mongoose  = require "mongoose"
Schema    = mongoose.Schema

UserSchema = new Schema(
  owner       : Schema.ObjectId
  username    : { type: String, required: true, unique: true }
  email       : { type: String, required: true, unique: true }
)

UserSchema.statics.search = (query, callback) ->
  @where("username", new RegExp(query, "i")).run(callback)

module.exports = UserSchema
