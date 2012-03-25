module.exports = (app, User) ->
  authenticate = require "./authenticate"
  anonymous = require "./anonymous"

  app.get "/users.:format?", anonymous, (req, res) ->

    User.find({}, ["username", "email"], (err, users) ->
      res.json users
    )

  app.get "/users/:id", anonymous, (req, res) ->

    User.findById req.params.id, (err, user) ->
      res.json user
