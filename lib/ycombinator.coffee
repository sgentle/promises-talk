nock = require 'nock'

ycombinator = (url, fn) ->
  startup = nock(url)
    .persist()
    .defaultReplyHeaders 'Content-Type': 'application/json'

  if fn.length is 0
    startup.get('/').reply 200, -> fn()
  else
    startup.post('/').reply 200, (url, body) ->
      fn(
        try JSON.parse(body)
        catch e
          body
      )

module.exports = ycombinator