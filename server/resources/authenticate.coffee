User = require("mongoose").model("user")

module.exports = (req, res, next) ->
  if req.session.user_id
    User.findById req.session.user_id, (err, user) ->
      if user
        req.current_user = user
        next()
      else
        res.redirect "sessions/new"
  else
    res.redirect "sessions/new"