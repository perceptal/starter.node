express = require "express"
stylus = require "stylus"
store = require "connect-mongodb"
connection = require "./connection"

dirname = __dirname + "/../.."
server_dir = dirname + "/server"
client_dir = dirname + "/client"

exports.common = ->
  @set "views", server_dir + "/views"
  @set "view engine", "jade"
  @use express.favicon client_dir + "/images/favicon.png"
  @use express.bodyParser()
  @use express.cookieParser()
  @use express.methodOverride()
  @use express.session
    store: store(@set("db-uri"))
    secret: "secret!"
  @use @router
  @use stylus.middleware
    debug: true
    src: server_dir + "/views"
    dest: client_dir
    force: true
    compile: compile
  @use express.static(client_dir)

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
    .define("url", stylus.url({ paths: [client_dir] }))
    .import("nib")

