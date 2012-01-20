option '-k', '--key [KEY]', 'Set heroku client key for tests.'
option '-a', '--app [APP]', 'Set heroku app for tests.'

task 'build', 'Compile coffee scripts into plain Javascript files', ->
  child = require("child_process").exec "coffee -c -o lib src/*.coffee", (err, stdout, stderr) ->
    if err?
      console.error "Error :"
      console.dir   err
      console.log stdout
      console.error stderr
    else
      console.log "Done!"

task 'test', 'Run the test suite', (args) ->
  key = args.key || process.env["HEROKU_KEY"]
  app = args.app || process.env["HEROKU_TEST_APP"]

  (require "./test/releases") key, app

