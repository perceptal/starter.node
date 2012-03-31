mongoose = require "mongoose"

module.exports.map = (app, name) ->
  model = mongoose.model(name)

  require("./" + name)(app, model)



