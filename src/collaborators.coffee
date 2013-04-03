class module.exports.Collaborators
  delete_collaborator: (app, email, fn) =>
    @request {
      method : "DELETE",
      path   : "/apps/#{app}/collaborators/#{encodeURIComponent(email)}"}, fn

  get_collaborators: (app, fn) =>
    @request {
      method : "GET",
      path   :  "/apps/#{app}/collaborators"}, fn

  post_collaborator: (app, email, fn) =>
    @request {
      method : "POST",
      path   : "/apps/#{app}/collaborators",
      expects: 201,
      query  :
        collaborator :
          email: email
      }, fn
