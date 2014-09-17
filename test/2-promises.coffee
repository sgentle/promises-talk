describe "2. How you use Promises", ->
  describe "A promise", ->
    tableflip = require '../lib/tableflip'

    it "looks a lot like a callback", ->
      tableflip "hello", (err, result) ->
        result.should.equal '(╯°□°）╯︵ oʃʃǝɥ'

      tableflip("hello").then (result) ->
        result.should.equal '(╯°□°）╯︵ oʃʃǝɥ'

    it "can have parallel then() calls", ->
      flipped = tableflip("hats")
      flipped.then (x) -> x.should.match /sʇɐɥ/
      flipped.then (x) -> x.length.should.equal '(╯°□°）╯︵ sʇɐɥ'.length
      flipped.then (x) -> x.should.equal '(╯°□°）╯︵ sʇɐɥ'

    it "can have serial then() calls", ->
      tableflip("table")
        .then tableflip
        .then tableflip
        .then tableflip
        .then tableflip
        .then tableflip
        .then tableflip
        .then tableflip
        .then (x) -> x.should.equal "table"


    it "will skip the then calls if there's an error", ->
      tableflip({})
        .then (x) -> throw new Error "You can't see me!"
        .catch (err) -> return "everything is fine"
        .then (x) -> x.should.equal "everything is fine"

    it "also handles errors in then() calls", ->
      tableflip("wig")
        .then (x) -> throw "a party"
        .catch (err) -> 8
        .then (x) -> x.should.equal 8