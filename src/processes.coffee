class module.exports.Processes
  get_ps: (app, fn) =>
    @request {
      method : "GET",
      path   : "/apps/#{app}/ps"}, fn
  
  post_ps: (app, command, attach, fn) =>
    unless fn?
      fn     = attach
      attach = false

    @request {
      method : "POST",
      path   : "/apps/#{app}/ps",
      query  :
        attach  : attach
        command : command }, fn

  post_ps_restart: (app, options, fn) =>
    unless fn?
      fn      = options
      options = {}

    @request {
      method : "POST",
      path   : "/apps/#{app}/ps/restart",
      query  : options}, fn

  post_ps_scale: (app, type, quantity, fn) =>
    @request {
      method : "POST",
      path   : "/apps/#{app}/ps/scale",
      query  :
        type : type,
        qty  : quantity }, fn

  post_ps_stop: (app, options, fn) =>
    unless fn?
      fn      = options
      options = {}

    @request {
      method : "POST",
      path   : "/apps/#{app}/ps/stop",
      query  : options}, fn

  put_dynos: (app, dynos, fn) ->
    @request {
      method : "POST",
      path   : "/apps/#{app}/dynos",
      query  : 
        dynos : dynos}, fn

  put_workers: (app, workers, fn) =>
    @request {
      method : "POST",
      path   : "/apps/#{app}/workers",
      query  : 
        workers : workers}, fn
