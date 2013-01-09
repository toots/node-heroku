{exec, spawn} = require "child_process"

system = (command, args) ->
  spawn command, args, stdio: "inherit"

task 'build', 'Compile coffee scripts into plain Javascript files', ->
  child = exec "coffee -c -o lib src/*.coffee", (err, stdout, stderr) ->
    if err?
      console.error "Error :"
      console.dir   err
      console.log stdout
      console.error stderr
    else
      console.log "Done!"

task 'spec', 'Run the spec tests', ->
  system "jasmine-node", ["--coffee", "./spec"]
