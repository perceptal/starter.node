configure   = require "./server/config/configure"
model       = require "./server/models/model"
resource    = require "./server/resources/resource"
controller  = require "./server/controllers/controller"

app = configure()

# Models
["group", "user", "person", "role", "photo"].map((name) -> model(name))

# Resources
["group", "user", "person", "photo"].map((name) -> resource.map(app, name))

# Controllers
["home"].map((name) -> controller(app, name))

module.exports = app