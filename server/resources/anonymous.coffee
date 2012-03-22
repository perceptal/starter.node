User = require("mongoose").model("user")

module.exports = (req, res, next) ->
  if req.session.user_id
    User.findById req.session.user_id, (err, user) ->
      req.current_user = user if user
      next()
  else
    next()