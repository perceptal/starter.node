module.exports = (app, Person) ->
  authenticate = require "./authenticate"
  anonymous = require "./anonymous"

  app.get "/persons", anonymous, (req, res) ->

    Person.find({}, (err, people) ->
        res.json people
    )

  app.get "/people/:id", anonymous, (req, res) ->

    Person.findById req.params.id, (err, person) ->
      res.json person

  app.get "/people/search/:q", anonymous, (req, res) ->

    Person.search req.params.q, (err, people) ->
      res.json people
