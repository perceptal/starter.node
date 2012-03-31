helper = require "./helper"
should = require "should"

describe "person model", ->

  Model = helper.model "person"

  before (done) ->
    helper.connect(done)

  describe "#save", ->

    beforeEach (done) ->
      Model.find({}).remove(done)

    it "should save without error", (done) ->

      model = new Model
        first_name: "John"
        last_name: "Doe"
        email: "email@email.com"

      model.save(done)

    it "should fail to save without first name", (done) ->

      model = new Model
        last_name: "Doe"
        email: "email@email.com"

      model.save (err) ->
        should.exist err

        done()

  after (done) ->
    helper.disconnect(done)
