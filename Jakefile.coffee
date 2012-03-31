connection = require "./server/config/connection"
model = require "./server/models/model"

connect = ->
  connection.connect connection[process.env.NODE_ENV || "development"]

disconnect = ->
  connection.disconnect()

desc "Seed datastore"
task "seed", [], (params) ->

  connect()

  Group = model "group"
  User = model "user"
  Person = model "person"

  sys = new Group(
    name: "System"
    code: "380800"
    email: "system@perceptal.co.uk"
    tel: "01896 830894"
  )
  sys.save()

  demo = new Group(
    name:       "Demo"
    code:       "999999"
    email:      "demo@perceptal.co.uk"
    tel:        "01896 830894"
    parent:     sys._id
  )
  demo.save()

  root_user = new User(
    username:   "root"
    email:      "root@perceptal.co.uk"
  )
  root_user.save()

  johnny_user = new User(
    username:   "johnny"
    email:      "johnny@recipher.co.uk"
  )
  johnny_user.save()

  root = new Person(
    first_name: "System"
    last_name:  "Administrator"
    email:      "root@perceptal.co.uk"
    user:       root_user._id
    group:      sys._id
  )
  root.save()

  johnny = new Person(
    first_name: "Johnny"
    last_name:  "Hall"
    gender:     "Male"
    title:      "Mr"
    marital:    "Married"
    dob:        "1971-05-14"
    email:      "johnny@recipher.co.uk"
    tel:        "07971 880871"
    user:       johnny_user._id
    group:      sys._id
  )
  johnny.save(disconnect)

desc "Clean datastore"
task("clean", [], (params) ->

  connect()

  Group = model "group"
  User = model "user"
  Person = model "person"

  Person.find({}).remove -> User.find({}).remove -> Group.find({}).remove disconnect
)