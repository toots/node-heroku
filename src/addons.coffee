class module.exports.AddOns
  delete_addon: (app, addon, fn) =>
    @request {
      mathod: "DELETE",
      path:   "/apps/#{app}/addons/#{addon}" }, fn

  get_addons: (app, fn) =>
    if fn?
      path = "/apps/#{app}/addons"
    else
      fn   = app
      path = "/addons"

    @request {
      method: "GET",
      path:   path }, fn

  post_addon: (app, addon, fn) =>
    @request {
      method: "POST",
      path:   "/apps/#{app}/addons/#{addon}" }, fn

  put_addon: (app, addon, fn) =>
    @request {
      method: "PUT",
      path:   "/apps/#{app}/addons/#{addon}" }, fn
