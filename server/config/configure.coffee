express = require "express"

connection = require "./connection"
config = require "./config"

module.exports = ->
  app = express.createServer()

  app.configure "development", config.development
  app.configure "test", config.test
  app.configure "production", config.production
  app.configure config.common

  connection.connect app.set("db-uri")

  app
