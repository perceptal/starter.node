express = require "express"
stylus = require "stylus"
store = require "connect-mongodb"
connection = require "./connection"

exports.common = ->
  @set "views", __dirname + "/server/views"
  @set "view engine", "jade"
  @use express.favicon __dirname + "/client/images/favicon.png"
  @use express.bodyParser()
  @use express.cookieParser()
  @use express.methodOverride()
  @use express.session
    store: store(@set("db-uri"))
    secret: "secret!"
  @use @router
  @use stylus.middleware
    debug: true
    src: __dirname + "/server/views"
    dest: __dirname + "/client"
    force: true
    compile: compile
  @use express.static(__dirname + "/client")

exports.development = ->
  @set "db-uri", connection.development
  @use express.errorHandler
    showStack: true
    dumpExceptions: true
  @use express.logger(format: "\u001b[1m:method\u001b[0m \u001b[33m:url\u001b[0m :response-time ms")

exports.test = ->
  @set "db-uri", connection.test

exports.production = ->
  @set "db-uri", connection.production
  @use express.logger(format: "\u001b[1m:method\u001b[0m \u001b[33m:url\u001b[0m :response-time ms")

compile = (str, path) ->
  stylus(str)
    .set("filename", path)
    .set("compress", false)
    .use(require("nib")())
    .define("url", stylus.url({ paths: [__dirname + "/client"] }))
    .import("nib")

