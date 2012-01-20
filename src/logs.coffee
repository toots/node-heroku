class module.exports.Logs
  get_logs: (app, options, fn) =>
    unless fn?
      fn      = options
      options = {}

    @request {
      method : "GET",
      path   : "/apps/#{app}/logs",
      query  : options}, fn
