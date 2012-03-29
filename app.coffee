configure = require "./server/config/configure"
model = require "./server/models/model"
resource = require "./server/resources/resource"
controller = require "./server/controllers/controller"

app = configure()

# Models
["user", "role"].map((name) -> model(name))

# Resources
["user"].map((name) -> resource(app, name))

# Controllers
["home"].map((name) -> controller(app, name))

module.exports = app