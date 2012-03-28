helper = require "./helper"

describe "user", ->
  helper.connect()
  User = helper.model "user"
  User.remove({})

  describe "#save", ->
    it "should save without error", (done) ->

      user = new User username: "user", email: "email@email.com"

      user.save (err) ->
        throw err if err

      done()