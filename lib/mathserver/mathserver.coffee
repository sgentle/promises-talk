express = require 'express'

app = express()
app.use require('body-parser').json()
app.use require('morgan')('combined')

app.post '/plus', (req, res) -> res.send result: req.body[0] + req.body[1]
app.post '/minus', (req, res) -> res.send result: req.body[0] - req.body[1]
app.post '/times', (req, res) -> res.send result: req.body[0] * req.body[1]
app.post '/div', (req, res) -> res.send result: req.body[0] / req.body[1]

app.listen(9999)
