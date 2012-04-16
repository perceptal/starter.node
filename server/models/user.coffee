mongoose  = require "mongoose"
crypto    = require "crypto"
uuid      = require "node-uuid"
Schema    = mongoose.Schema

UserSchema = new Schema
  owner             : { type: Schema.ObjectId }
  username          : { type: String, required: true, unique: true, lowercase: true }
  salt              : { type: String, required: true, default: uuid.v1 }
  hashed_password   : { type: String, required: true }

hash = (password, salt) ->
  crypto.createHmac("sha256", salt).update(password).digest("hex");

UserSchema.methods.set_password = (password) ->
  @hashed_password = hash(password, @salt)

UserSchema.methods.authenticate = (password) ->
  @hashed_password == hash(password, @salt)

module.exports = UserSchema
