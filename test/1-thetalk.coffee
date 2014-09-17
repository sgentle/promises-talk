fs = require 'fs'


describe "1. This talk", ->
  files = fs.readdirSync(__dirname)
  contents = files.map (name) -> fs.readFileSync(__dirname + '/' + name)
  thistalk = Buffer.concat(contents).toString()

  it "is about Promises", ->
    thistalk.should.match /promises/

  it "doesn't try to answer 'what is the P-word?'", ->
    thistalk.should.not.match /[w]hat is a Promise/

  it "doesn't try to be theoretical", ->
    thistalk.should.not.match /[m]onads/
    thistalk.should.not.match /[f]unctors/
    thistalk.should.not.match /[q]uantum mechanics/
    thistalk.should.not.match /[T]siolkovsky rocket equation/
    thistalk.should.not.match /[r]egexes/

  it "contains silly Promise puns", ->
    thistalk.should.not.match /[I] promise you/
    thistalk.should.not.match /[t]hat's a promise/
    thistalk.should.not.match /[b]roken promises/
    thistalk.should.not.match /[I]'ll get back to you/
