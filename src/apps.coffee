app_params = (params) ->
  ret = {}
  ret["app[#{key}]"] = value for value, key of params
  ret

class module.exports.Apps
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
      query   : app_params(params)}, fn

  post_app_server_maintenance: (app, new_server_maintenance, fn) =>
    @request {
      method : "POST",
      path   : "/apps/#{app}/server/maintenance",
      query  :
        maintenance_mode : maintenance_mode}, fn

  put_app: (app, params, fn) =>
    @request {
      method : "PUT",
      path   : "/apps/#{app}",
      query  : app_params(params)}, fn

  post_app_database_reset: (app, fn) =>
    @request {
      method : "POST",
      path   : "/apps/#{app}/database/reset" 
      query  : {}}, fn
