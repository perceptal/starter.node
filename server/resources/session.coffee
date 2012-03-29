module.exports = (app, User) ->
  authenticate = require "./authenticate"
  anonymous = require "./anonymous"

  app.post "/sessions", anonymous, (req, res) ->


  app.delete "/sessions", authenticate, (req, res) ->

