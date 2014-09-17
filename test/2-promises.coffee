describe "2. How you use Promises", ->
  describe "A promise", ->
    tableflip = require '../lib/tableflip'

    it "looks a lot like a callback", ->
      tableflip "hello", (err, result) ->
        result.should.equal "something"

    it "can have parallel then() calls", ->
      flipped = tableflip("hats")
      flipped.then (x) -> x.should.match /something/
      flipped.then (x) -> x.length.should.equal "something"
      flipped.then (x) -> x.should.equal "something"

    it "can have serial then() calls", ->
      tableflip("table")
        .then (x) -> x.should.equal "table"

    it "will skip the then calls if there's an error", ->
      tableflip({})
        .then (x) -> throw new Error "You can't see me!"

    it "also handles errors in then() calls", ->
      tableflip("wig")
        .then null, (err) -> 8
        .then (x) -> x.should.equal 8

    it "not finished yet", -> throw new Error
