ycombinator = require '../lib/ycombinator'
request = require 'request'
promquest = require '../lib/promquest'

describe "You are now a space wizard", ->
  describe "A space wizard", ->

    ycombinator "http://hello.com", -> 'hello'
    ycombinator "http://world.ly", (body) -> body + ' world'

    describe "can conjure billions of dollars from thin air", ->
      it "hello.com", ->
        promquest 'http://hello.com'
          .then (result) -> result.body.should.equal 'hello'

      it "world.ly", ->
        promquest 'http://world.ly', 'sydjs'
          .then (result) -> result.body.should.equal 'sydjs world'

      it "hellworld.ly", ->
        promquest 'http://hello.com'
          .then (result) ->
            promquest 'http://world.ly', result
          .then (result) -> result.body.should.equal 'hello world'

      it "hellworld.ly #2", ->
        hellopromise = promquest 'http://hello.com'
        promquest('http://world.ly', hellopromise)
          .then (result) -> result.body.should.equal 'hello world'

      it "hellworld.ly #3", ->
        hello = -> promquest 'http://hello.com'
        world = (text) -> promquest('http://world.ly', text)
        world(hello())
          .then (result) -> result.body.should.equal 'hello world'

      it "hellworld.ly #4", ->
        hello = -> promquest 'http://hello.com'
        world = (text) -> promquest('http://world.ly', text)

        hello().then(world)
          .then (result) -> result.body.should.equal 'hello world'
