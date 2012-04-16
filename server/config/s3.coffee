knox = require "knox"

exports.connect = (bucket) ->
  knox.createClient
    key:    process.env.S3_KEY
    secret: process.env.S3_SECRET
    bucket: bucket

exports.development = "development.starter.node.perceptal.co.uk"
exports.test        = "test.starter.node.perceptal.co.uk"
exports.production  = "production.starter.node.perceptal.co.uk"
