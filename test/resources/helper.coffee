configure = require "../../server/config/configure"

server = null

module.exports.start = (callback) ->
  app = configure()
  server = app.listen 4567
  callback()

module.exports.close = (callback) ->
  server.close()
  callback()