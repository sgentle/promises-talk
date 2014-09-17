Promise = require 'bluebird'
request = require 'request'

promquest = (url, data) ->
  Promise.resolve(data).then (data) ->
    data = data.body if data?.constructor?.name in ['IncomingMessage', 'OutgoingMessage']
    new Promise (resolve, reject) ->
      callback = (err, result) ->
        if err then reject(err) else resolve(result)

      if data
        request.post url, {json: data}, callback
      else
        request.get url, {json: true}, callback

module.exports = promquest