mongoose  = require "mongoose"
Schema    = mongoose.Schema

PersonSchema = new Schema(
  owner       : Schema.ObjectId
  first_name  : { type: String, required: true }
  last_name   : { type: String, required: true }
  title       : { type: String }
  gender      : { type: String }
  marital     : { type: String }
  email       : { type: String, required: true, unique: true }
  tel         : { type: String }
  #user_id     : { type: Schema.ObjectId }
)

PersonSchema.statics.search = (query, callback) ->
  @where("first_name", new RegExp(query, "i")).run(callback)

module.exports = PersonSchema
