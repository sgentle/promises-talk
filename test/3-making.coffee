tableflip = require '../lib/tableflip'
Promise = require 'bluebird'
fs = require 'fs'

describe "3. How you create Promises", ->
  describe "A promise can be created", ->

    crappyPromise = {then: (success) -> success("bees")}

    it "any damn way you want", ->
      isThenable = (x) ->
        dontcare = (->)
        try
          x.then(dontcare, dontcare)
          true
        catch
          false

      isThenable(tableflip("hi")).should.equal true

      isThenable(crappyPromise).should.equal true


    it "with a value", ->
      Promise.resolve(Promise.resolve("a value"))
        .then (x) -> x.should.equal "a value"

      Promise.resolve(crappyPromise)
        .then (x) -> x.should.equal "bees"

    it "with a pair of functions", ->
      wikileaks = (secret) ->
        new Promise (resolve, reject) ->
          fs.readFile 'secrets/'+secret, 'utf8', (err, contents) ->
            if err
              reject(err)
            else
              resolve(contents)

      wikileaks('nuclearlaunchcodes')
        .then (x) -> x.should.equal '00000000\n'


    it "from an arbitrary node function", ->
      readFileAsync = Promise.promisify(fs.readFile)
      wikileaks = (secret) ->
        readFileAsync 'secrets/'+secret, 'utf8'


      wikileaks('nuclearlaunchcodes')
        .then (x) -> x.should.equal '00000000\n'

    it "from a whole node module (what?!)", ->
      Promise.promisifyAll(fs)
      wikileaks = (secret) ->
        fs.readFileAsync 'secrets/'+secret, 'utf8'

      megaleak = ->
        fs.readdirAsync('secrets').then (names) ->
          Promise.all (names.map wikileaks)

      megaleak()
        .then (x) ->
          x.should.eql [ '0118999-88199-9119-725-3\n', 'hunter2\n', '00000000\n' ]

