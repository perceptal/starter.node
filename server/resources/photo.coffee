module.exports = (app, Photo) ->
  authenticate = require "./authenticate"
  anonymous = require "./anonymous"

  app.get "users/:person_id/photos", anonymous, (req, res) ->

    Photo.find({ person: req.params.person_id }, (err, photos) ->
        res.json photos
    )

  app.get "users/:person_id/photos/default", anonymous, (req, res) ->

    Photo.findOne({ person: req.params.person_id, is_default: true }, (err, photo) ->
        res.json photo
    )

  app.get "photos/:id", anonymous, (req, res) ->

    Photo.findById(req.params.id, (err, photo) ->
        res.json photo
    )

  app.get "photos/:id/download", anonymous, (req, res) ->

    Photo.findById(req.params.id, (err, photo) ->
        res.json photo
    )
