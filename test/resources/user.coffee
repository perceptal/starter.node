helper = require "./helper"
should = require "should"

describe "user resource", ->

  before (done) ->
    helper.start(done)

  describe "#get", ->

    it "should get a user", (done) ->

      done()

  after (done) ->

    helper.close(done)
