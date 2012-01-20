class module.exports.Keys
  delete_key: (key, fn) =>
    @request {
      method : "DELETE",
      path   : "/user/keys/#{CGI.escape(key)}"}, fn
  
  delete_keys: (fn) =>
    @request {
      method : "DELETE",
      path   : "/user/keys"}, fn
  
  get_keys: (fn) =>
    @request {
      method : "GET",
      path   : "/user/keys"}, fn

  post_key: (key, fn) =>
    @request {
      method : "POST",
      path   : "/user/keys",
      query  : 
        body: key}, fn

