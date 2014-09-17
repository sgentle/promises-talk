fs = require 'fs'


describe "1. This talk", ->
  files = fs.readdirSync(__dirname)
  contents = files.map (name) -> fs.readFileSync(__dirname + '/' + name)
  thistalk = Buffer.concat(contents).toString()

  it "is about Promises", ->
    thistalk.should.match /promises/

  it "doesn't try to answer 'what is a Promise?'", ->
    thistalk.should.not.match /what is a Promise/

  it "doesn't try to be theoretical", ->
    thistalk.should.not.match /monads/
    thistalk.should.not.match /functors/
    thistalk.should.not.match /quantum mechanics/
    thistalk.should.not.match /Tsiolkovsky rocket equation/
    thistalk.should.not.match

  it "contains no silly Promise puns", ->
    thistalk.should.not.match /I promise you/
    thistalk.should.not.match /that's a promise/
    thistalk.should.not.match /broken promises/
    thistalk.should.not.match

  it "not finished yet", -> throw new Error