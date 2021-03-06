mongoose  = require "mongoose"
Schema    = mongoose.Schema

PersonSchema = new Schema
  owner       : { type: Schema.ObjectId }
  first_name  : { type: String, required: true }
  last_name   : { type: String, required: true }
  title       : { type: String }
  gender      : { type: String, enum: ["Male", "Female"]}
  marital     : { type: String, enum: ["Single", "Married", "Divorced", "Widowed", "Separated"] }
  dob         : { type: Date }
  email       : { type: String, required: true, unique: true, lowercase: true }
  tel         : { type: String }
  user        : { type: Schema.ObjectId, ref: "user" }
  group       : { type: Schema.ObjectId , ref: "group" }

PersonSchema.statics.search = (query) ->
  @where("first_name", new RegExp(query, "i"))

module.exports = PersonSchema
