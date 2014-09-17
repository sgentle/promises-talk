{spawn} = require 'child_process'
path = require 'path'
chokidar = require 'chokidar'
fs = require 'fs'
spawnMocha = ->
  #clear(false)
  spawn 'mocha', [], stdio: 'inherit'
    # .on 'close', ->
    #   #clear(false)
    #   setTimeout spawnMocha, 1000

watcher = chokidar.watch(__dirname + '/..', persistent: true)
#watcher.on 'change', spawnMocha
watcher.on 'change', spawnMocha
spawnMocha()