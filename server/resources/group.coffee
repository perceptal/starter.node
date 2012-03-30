module.exports = (app, Group) ->
  authenticate = require "./authenticate"
  anonymous = require "./anonymous"

  app.get "/organisations", anonymous, (req, res) ->

    Group.find({}, (err, groups) ->
      res.json groups
    )

  app.get "/organisations/:id", anonymous, (req, res) ->

    Group.findById req.params.id, (err, group) ->
      res.json group

  app.get "/organisations/search/:q", anonymous, (req, res) ->

    Group.search req.params.q, (err, groups) ->
        res.json groups


