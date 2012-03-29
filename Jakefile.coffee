connection = require "./server/config/connection"
model = require "./server/models/model"

connect = ->
  connection.connect connection[process.env.NODE_ENV || "development"]

disconnect = ->
  connection.disconnect()

desc "Seed datastore"
task "seed", [], (params) ->

  connect()

  User = model "user"
  Person = model "person"

  system_user = new User(
    username: "system"
    email: "system@perceptal.co.uk"
  )
  system_user.save()

  johnny_user = new User(
    username: "johnny"
    email: "johnny@recipher.co.uk"
  )
  johnny_user.save()

  system = new Person(
    first_name: "System"
    last_name: "Administrator"
    email: "system@perceptal.co.uk"
    user_id: system_user._id
  )
  system.save()

  johnny = new Person(
    first_name: "Johnny"
    last_name: "Hall"
    gender: "Male"
    title: "Mr"
    marital: "Married"
    dob: "1971-05-14"
    email: "johnny@recipher.co.uk"
    tel: "07971 880871"
    user_id: johnny_user._id
  )
  johnny.save(disconnect)

desc "Clean datastore"
task("clean", [], (params) ->

  connect()

  User = model "user"
  Person = model "person"

  Person.find({}).remove -> User.find({}).remove disconnect
)