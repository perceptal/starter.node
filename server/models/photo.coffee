s3        = require "../../server/config/s3"
mongoose  = require "mongoose"
Schema    = mongoose.Schema

PhotoSchema = new Schema
  owner       : { type: Schema.ObjectId }
  url         : { type: String }
  caption     : { type: String }
  is_default  : { type: Boolean, default: false }
  person      : { type: Schema.ObjectId, ref: "person" }

PhotoSchema.methods.put = (file, name) ->
  client = s3.connect s3[process.env.NODE_ENV || "development"]

  client.putFile file, "/images/original/" + name, (err, res) ->
    @url = res.url if 200 == res.statusCode

module.exports = PhotoSchema

