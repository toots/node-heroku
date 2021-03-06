// Generated by CoffeeScript 1.10.0
(function() {
  var bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };

  module.exports.Domains = (function() {
    function Domains() {
      this.post_domain = bind(this.post_domain, this);
      this.get_domains = bind(this.get_domains, this);
      this.delete_domain = bind(this.delete_domain, this);
    }

    Domains.prototype.delete_domain = function(app, domain, fn) {
      return this.request({
        method: "DELETE",
        path: "/apps/" + app + "/domains/" + (CGI.escape(domain))
      }, fn);
    };

    Domains.prototype.get_domains = function(app, fn) {
      return this.request({
        method: "GET",
        path: "/apps/" + app + "/domains"
      }, fn);
    };

    Domains.prototype.post_domain = function(app, domain, fn) {
      return this.request({
        method: "POST",
        path: "/apps/" + app + "/domains",
        query: {
          "domain_name[domain]": domain
        }
      }, fn);
    };

    return Domains;

  })();

}).call(this);
