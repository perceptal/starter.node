module.exports = (app) ->

  app.get "/", (req, res) ->
    res.render "home", title: "Starter.node"