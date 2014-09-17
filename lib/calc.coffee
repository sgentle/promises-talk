promquest = require './promquest'
Promise = require 'bluebird'

OPS = "plus minus times div".split ' '

math = (value) ->
  result = Promise.resolve(value)

  OPS.forEach (name) ->
    result[name] = (val2) -> op(name, result, val2).then math
  result

OPS.forEach (name) ->
  math[name] = (val1, val2) -> op(name, val1, val2).then math

op = (name, val1, val2) ->
  promises = [val1, val2].map Promise.resolve
  Promise.all(promises).then (values) ->
    promquest('http://localhost:9999/'+name, values).then (res) -> res.body.result


module.exports = math