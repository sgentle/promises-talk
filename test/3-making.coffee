tableflip = require '../lib/tableflip'
Promise = require 'bluebird'
fs = require 'fs'

describe "3. How you create Promises", ->
  describe "A promise can be created", ->

    crappyPromise = {}

    it "any damn way you want", ->
      isThenable = (x) ->

      isThenable(tableflip("hi")).should.equal true

      isThenable(crappyPromise).should.equal true


    it "with a value", ->
      something("a value")
        .then (x) -> x.should.equal "a value"


    it "with a pair of functions", ->
      wikileaks = (secret) ->

      wikileaks('nuclearlaunchcodes')
        .then (x) -> x.should.equal '00000000\n'


    it "from an arbitrary node function", ->
      wikileaks = (secret) ->

      wikileaks('nuclearlaunchcodes')
        .then (x) -> x.should.equal '00000000\n'

    it "from a whole node module (what?!)", ->
      Promise.promisifyAll(fs)

      megaleak = ->


      megaleak()
        .then (x) -> x.should.eql something


    it "not finished yet", -> throw new Error

