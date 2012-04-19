(function() {
  var __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };
  module.exports.HerokuSharedPostgresql = (function() {
    function HerokuSharedPostgresql(opts) {
      this.show_info = __bind(this.show_info, this);
      this.request = __bind(this.request, this);      this.host = opts.host || "heroku-shared-production.herokuapp.com";
      this.http = require(opts.scheme || "https");
      this.token = require("crypto").createHash('sha256').update(opts.url).digest("hex");
    }
    HerokuSharedPostgresql.prototype.request = function(opts, fn) {
      var headers, query, req;
      headers = {
        "Accept": "application/json",
        "X-Heroku-Gem-Version": "2.23.0",
        "X-Heroku-Shared-Postgresql-Token": this.token
      };
      opts = {
        hostname: this.host,
        method: opts.method,
        path: "/client/v1" + opts.path,
        headers: headers
      };
      if (typeof query !== "undefined" && query !== null) {
        query = JSON.stringify(query);
        opts.headers["Content-Type"] = "application/json";
        opts.headers["Content-Length"] = query.length;
      }
      req = this.http.request(opts, function(res) {
        var data;
        if (res.statusCode !== 200) {
          return fn(res, null);
        }
        data = "";
        res.on("data", function(buf) {
          return data += buf;
        });
        return res.on("end", function() {
          try {
            data = JSON.parse(data);
          } catch (err) {

          }
          return fn(null, data);
        });
      });
      return req.end(query);
    };
    HerokuSharedPostgresql.prototype.show_info = function(fn) {
      return this.request({
        method: "GET",
        path: "/info"
      }, fn);
    };
    return HerokuSharedPostgresql;
  })();
}).call(this);
