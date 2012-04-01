module.exports = (app, Group) ->
  authenticate = require "./authenticate"
  anonymous = require "./anonymous"

  app.get "/organisations", anonymous, (req, res) ->

    Group.find({}).populate("parent").run((err, groups) ->
      res.json groups
    )

  app.get "/organisations/:id", anonymous, (req, res) ->

    Group.findById(req.params.id).populate("parent").run((err, group) ->
      if err
        res.send "Organisation not found", 404
      else
        res.json group
    )

  app.get "/organisations/search/:q", anonymous, (req, res) ->

    Group.search(req.params.q).populate("parent").run((err, groups) ->
      res.json groups
    )

