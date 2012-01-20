class module.exports.Domains
  delete_domain: (app, domain, fn) =>
    @request {
      method : "DELETE",
      path   : "/apps/#{app}/domains/#{CGI.escape(domain)}"}, fn
  
  get_domains: (app, fn) =>
    @request {
      method : "GET",
      path   : "/apps/#{app}/domains"}, fn

  post_domain: (app, domain, fn) =>
    @request {
      method : "POST",
      path   : "/apps/#{app}/domains",
      query  : 
        "domain_name[domain]" : domain }, fn
