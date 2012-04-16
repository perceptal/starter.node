knox = require "knox"

buckets =
  development:  "development.starter.node.perceptal.co.uk"
  test:         "test.starter.node.perceptal.co.uk"
  production:   "production.starter.node.perceptal.co.uk"

exports.connect = (bucket) ->
  knox.createClient
    key:    process.env.S3_KEY
    secret: process.env.S3_SECRET
    bucket: bucket || buckets[bucket || "development"]

exports.development = buckets.development
exports.test        = buckets.test
exports.production  = buckets.production
