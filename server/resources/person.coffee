module.exports = (app, Person) ->
  authenticate = require "./authenticate"
  anonymous = require "./anonymous"

  app.get "/people", anonymous, (req, res) ->

    Person.find({}).populate("user").populate("group").run((err, people) ->
        res.json people
    )

  app.get "/people/:id", anonymous, (req, res) ->

    Person.findById(req.params.id).populate("user").populate("group").run((err, person) ->
      if err
        res.send "Person not found", 404
      else
        res.json person
    )

  app.get "/people/search/:q", anonymous, (req, res) ->

    Person.search(req.params.q).populate("user").populate("group").run((err, people) ->
      res.json people
    )