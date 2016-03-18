class Heroku
  @inherited = []

  constructor: (opts) ->
    @auth = new Buffer(":#{opts.key || process.env.HEROKU_API_KEY}").toString "base64"
    @host = opts.host   || "api.heroku.com"
    @http = require(opts.scheme || "https")

    constructor.apply this, arguments for constructor in Heroku.inherited

  request: (opts, fn) =>
    expects = opts.expects || 200
    query   = opts.query

    headers =
      "Accept"               : "application/json"
      "Authorization"        : "Basic #{@auth}"
      "X-Heroku-API-Version" : "3"

    opts =
      hostname : @host
      method   : opts.method
      path     : opts.path
      headers  : headers

    if query?
      query = JSON.stringify query
      opts.headers["Content-Type"]  = "application/json"
      opts.headers["Content-Length"] = query.length

    req = @http.request opts, (res) ->
      data = ""
      res.on "data", (buf) -> data += buf
      res.on "end", ->
        unless res.statusCode == expects
          return fn
            options  : opts
            query    : query
            request  : req
            response : res
            data     : data

        try
          data = JSON.parse data
        catch err

        fn null, data

    req.end query

{AddOns}        = require "./addons"
{Apps}          = require "./apps"
{Collaborators} = require "./collaborators"
{ConfigVars}    = require "./config_vars"
{Domains}       = require "./domains"
{Keys}          = require "./keys"
{Logs}          = require "./logs"
{Processes}     = require "./processes"
{Releases}      = require "./releases"
{Stacks}        = require "./stacks"

# From coffee script FAQ..
extend = (obj, mixin) ->
  for name, method of mixin
    obj[name] = method

include = (klass, mixin) ->
  extend klass.prototype, mixin.prototype
  Heroku.inherited.push mixin

include Heroku, AddOns
include Heroku, Apps
include Heroku, Collaborators
include Heroku, ConfigVars
include Heroku, Domains
include Heroku, Keys
include Heroku, Logs
include Heroku, Processes
include Heroku, Releases
include Heroku, Stacks

module.exports.Heroku = Heroku
module.exports.PGBackups = require("./pgbackups").PGBackups
