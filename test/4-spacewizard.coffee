ycombinator = require '../lib/ycombinator'
request = require 'request'
promquest = require '../lib/promquest'

describe "You are now a (provisional) space wizard", ->
  describe "A space wizard", ->

    ycombinator "http://hello.com", -> 'hello'
    ycombinator "http://world.ly", (body) -> body + ' world'

    describe "can conjure billions of dollars from thin air", ->
      it "hello.com", ->
        dosomething 'http://hello.com'
          .then (result) -> result.should.equal 'hello'


      it "not finished yet", -> throw new Error
