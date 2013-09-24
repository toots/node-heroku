class module.exports.ConfigVars
  delete_config_var: (app, key, fn) =>
    @request {
      method : "DELETE",
      path   : "/apps/#{app}/config-vars/#{key}"}, fn

  get_config_vars: (app, fn) =>
    @request {
      method : "GET",
      path   : "/apps/#{app}/config-vars"}, fn

  put_config_vars: (app, vars, fn) =>
    @request {
      method : "PUT",
      path   : "/apps/#{app}/config-vars",
      query  : vars}, fn
