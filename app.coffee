express = require "express"
mongoose = require "mongoose"

config = require "./config"
model = require "./server/models/model"
resource = require "./server/resources/resource"
controller = require "./server/controllers/controller"

app = express.createServer()

app.configure "development", config.development
app.configure "test", config.test
app.configure "production", config.production
app.configure config.common

# Models
["user", "role"].map((name) -> model(name))

# Resources
["user"].map((name) -> resource(app, name))

# Controllers
["home"].map((name) -> controller(app, name))

# Connect to the database
mongoose.connect app.set("db-uri")

module.exports = app