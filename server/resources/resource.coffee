module.exports = (app, name) ->
  model = require("mongoose").model(name)

  require("./" + name)(app, model)