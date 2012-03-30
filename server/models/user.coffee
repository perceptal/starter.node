mongoose  = require "mongoose"
Schema    = mongoose.Schema

UserSchema = new Schema(
  owner       : { type: Schema.ObjectId }
  username    : { type: String, required: true, unique: true, lowercase: true }
)

module.exports = UserSchema
