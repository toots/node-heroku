class module.exports.Apps
  app_params: (params) ->
    result = { app: {} }
    result.app[key] = value for key, value of params
    result

  delete_app: (app, fn) =>
    @request {
      method : "DELETE",
      path   : "/apps/#{app}"}, fn

  get_apps: (fn) =>
    @request {
      method : "GET",
      path   : "/apps"}, fn

  get_app: (app, fn) =>
    @request {
      method : "GET",
      path   : "/apps/#{app}"}, fn

  post_app : (params, fn) =>
    unless fn?
      fn     = params
      params = {}

    @request {
      expects : 202,
      method  : "POST",
      path    : "/apps",
      query   : @app_params(params)}, fn

  post_app_server_maintenance: (app, maintenance_mode, fn) =>
    @request {
      method : "POST",
      path   : "/apps/#{app}/server/maintenance",
      query  :
        maintenance_mode : maintenance_mode}, fn

  put_app: (app, params, fn) =>
    @request {
      method : "PUT",
      path   : "/apps/#{app}",
      query  : @app_params(params)}, fn

  post_app_database_reset: (app, fn) =>
    @request {
      method : "POST",
      path   : "/apps/#{app}/database/reset" 
      query  : {}}, fn
