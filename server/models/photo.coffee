mongoose  = require "mongoose"
Schema    = mongoose.Schema
s3 = require("../../server/config/s3").connect()

PhotoSchema = new Schema
  owner       : { type: Schema.ObjectId }
  url         : { type: String }
  caption     : { type: String }
  person      : { type: Schema.ObjectId, ref: "person" }

PhotoSchema.methods.put = (file, name) ->
  s3.putFile file, "/images/original/" + name, (err, res) ->
    @url = res.url if 200 == res.statusCode

module.exports = PhotoSchema

