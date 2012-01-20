class module.exports.Stacks
  get_stack: (app, fn) =>
    @request {
      method : "GET",
      path   : "/apps/#{app}/stack"}, fn

  put_stack: (app, stack, fn) =>
    @request {
      method : "PUT",
      path   : "/apps/#{app}/stack",
      query  :
        body : stack}, fn

