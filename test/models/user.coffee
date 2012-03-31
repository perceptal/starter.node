helper = require "./helper"

describe "user model", ->

  Model = helper.model "user"

  before (done) ->
    helper.connect(done)

  describe "#save", ->

    beforeEach (done) ->
      Model.find({}).remove(done)

    it "should save without error", (done) ->

      model = new Model
        username: "johndoe"

      model.save(done)

  after (done) ->
    helper.disconnect(done)
