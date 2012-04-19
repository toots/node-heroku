url = require "url"

class module.exports.PGBackups
  constructor: (opts) ->
    pgurl = url.parse opts.url
    @http = require pgurl.protocol.slice(0, -1)
    @host = pgurl.host
    @port = pgurl.port if pgurl.port?
    @path = if pgurl.pathname == "/" then "" else pgurl.pathname
    @auth = new Buffer(pgurl.auth).toString "base64" if pgurl.auth?

  request: (opts, fn) =>
    query = opts.query

    headers =
      "Accept"                           : "application/json"
      "X-Heroku-Gem-Version"             : "2.23.0"

    headers["Authorization"] = "Basic #{@auth}" if @auth?

    if query?
      query = JSON.stringify query

      headers["Content-Type"]   = "application/json"
      headers["Content-Length"] = query.length

    opts =
      hostname : @host
      method   : opts.method
      path     : "#{@path}#{opts.path}"
      headers  : headers

    opts.port = @port if @port?

    req = @http.request opts, (res) ->
      return fn res, null unless res.statusCode == 200

      data = ""
      res.on "data", (buf) -> data += buf
      res.on "end", ->
        try
          data = JSON.parse data
        catch err

        fn null, data

    req.end query

  create_transfer: (from_url, from_name, to_url, to_name, opts, fn) =>
    unless fn?
      fn   = opts
      opts = {}

    opts.from_url  = from_url
    opts.from_name = from_name
    opts.to_url    = to_url
    opts.to_name   = to_name

    @request {
      method : "POST",
      path   : "/transfers",
      query  : opts }, fn

  get_transfers: (fn) =>
    @request {
      method : "GET",
      path   : "/transfers" }, fn

  get_transfer: (id, fn) =>
    @request {
      method : "GET",
      path   : "/transfers/#{id}" }, fn

  get_backups: (fn) =>
    @request {
      method : "GET",
      path   : "/backups" }, fn

  get_backup: (name, fn) =>
    @request {
      method : "GET",
      path   : "/backups/#{name}" }, fn

  get_latest_backup: (fn) =>
    @request {
      method : "GET",
      path   : "/latest_backup" }, fn

  delete_backup: (name, fn) =>
    @request {
      method : "DELETE",
      path   : "/client/backups/#{name}" }, fn
