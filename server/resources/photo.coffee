module.exports = (app, Photo) ->
  authenticate = require "./authenticate"
  anonymous = require "./anonymous"

  app.get "users/:id/photos", anonymous, (req, res) ->

    Photo.find({ person: req.params.id }, (err, photos) ->
        res.json photos
    )

  app.get "users/:id/photos/default", anonymous, (req, res) ->

    Photo.findOne({ person: req.params.id, is_default: true }, (err, photo) ->
        res.json photo
    )
