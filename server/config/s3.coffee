knox = require "knox"

buckets =
  development:  "development.starter.perceptal.co.uk"
  test:         "test.starter.perceptal.co.uk"
  production:   "production.starter.perceptal.co.uk"

exports.connect = (bucket) ->

  knox.createClient
    key:    process.env.S3_KEY
    secret: process.env.S3_SECRET
    bucket: bucket or= buckets[process.env.NODE_ENV]

exports.development = buckets.development
exports.test        = buckets.test
exports.production  = buckets.production
