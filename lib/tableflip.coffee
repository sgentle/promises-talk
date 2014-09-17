flip = require 'flip'
Promise = require 'bluebird'

FLIPPITY = "(╯°□°）╯︵ "

tableflip = (text, callback=->) ->
  return new Promise (accept, reject) ->
    if typeof text is 'string'
      if text.indexOf(FLIPPITY) is -1
        flipped = FLIPPITY + flip(text)
      else
        flipped = flip text.slice(FLIPPITY.length)
      callback null, flipped
      accept flipped
    else
      err = new Error "¯\\(º_o)/¯ I can't flip that"
      callback err
      reject err

module.exports = tableflip