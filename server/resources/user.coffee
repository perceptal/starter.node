module.exports = (app, User) ->
  authenticate = require "./authenticate"
  anonymous = require "./anonymous"

  app.get "/users", anonymous, (req, res) ->

    User.find({}, (err, users) ->
      res.json users
    )

  app.get "/users/:id", anonymous, (req, res) ->

    User.findById req.params.id, (err, user) ->
      res.json user

  app.get "/users/search/:q", anonymous, (req, res) ->

    User.search(req.params.q, (err, users) ->
        res.json users
    )

