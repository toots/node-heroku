class module.exports.Releases
  get_releases: (app, fn) =>
    @request {
      method : "GET",
      path   : "/apps/#{app}/releases" }, fn

  get_release: (app, release, fn) =>
    @request {
      method : "GET",
      path   : "/apps/#{app}/releases/#{release}" }, fn

  post_release: (app, release, fn) =>
    @request {
      method : "POST",
      path   : "/apps/#{app}/releases",
      query  : { rollback: release} }, fn
