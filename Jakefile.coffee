connection = require "./connection"
model = require "./server/models/model"

connect = ->
  connection.connect connection[process.env.NODE_ENV || "development"]

disconnect = ->
  connection.disconnect()

desc "Seed datastore"
task "seed", [], (params) ->

  connect()

  User = model "user"

  sys = new User({
    username: "system"
  , email: "system@perceptal.co.uk"
  })
  sys.save()

  johnny = new User({
    username: "johnny"
  , email: "johnny@recipher.co.uk"
  })
  johnny.save(disconnect)

desc "Clean datastore"
task("clean", [], (params) ->

  connect()

  User = model "user"
  User.find({}).remove(disconnect)
)