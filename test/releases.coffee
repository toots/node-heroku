{Heroku} = require "../lib/heroku"

module.exports = (key, app) ->
  client = new Heroku { key: key }

  client.get_releases app, (err, ret) ->
    console.dir err
    console.dir ret
