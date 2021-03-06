// Generated by CoffeeScript 1.10.0
(function() {
  var AddOns, Apps, Collaborators, ConfigVars, Domains, Heroku, Keys, Logs, Processes, Releases, Stacks, extend, include,
    bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };

  Heroku = (function() {
    Heroku.inherited = [];

    function Heroku(opts) {
      this.request = bind(this.request, this);
      var constructor, i, len, ref;
      this.auth = new Buffer(":" + (opts.key || process.env.HEROKU_API_KEY)).toString("base64");
      this.host = opts.host || "api.heroku.com";
      this.http = require(opts.scheme || "https");
      ref = Heroku.inherited;
      for (i = 0, len = ref.length; i < len; i++) {
        constructor = ref[i];
        constructor.apply(this, arguments);
      }
    }

    Heroku.prototype.request = function(opts, fn) {
      var expects, headers, query, req;
      expects = opts.expects || 200;
      query = opts.query;
      headers = {
        "Accept": "application/json",
        "Authorization": "Basic " + this.auth,
        "X-Heroku-API-Version": "3"
      };
      opts = {
        hostname: this.host,
        method: opts.method,
        path: opts.path,
        headers: headers
      };
      if (query != null) {
        query = JSON.stringify(query);
        opts.headers["Content-Type"] = "application/json";
        opts.headers["Content-Length"] = query.length;
      }
      req = this.http.request(opts, function(res) {
        var data;
        data = "";
        res.on("data", function(buf) {
          return data += buf;
        });
        return res.on("end", function() {
          var err, error;
          if (res.statusCode !== expects) {
            return fn({
              options: opts,
              query: query,
              request: req,
              response: res,
              data: data
            });
          }
          try {
            data = JSON.parse(data);
          } catch (error) {
            err = error;
          }
          return fn(null, data);
        });
      });
      return req.end(query);
    };

    return Heroku;

  })();

  AddOns = require("./addons").AddOns;

  Apps = require("./apps").Apps;

  Collaborators = require("./collaborators").Collaborators;

  ConfigVars = require("./config_vars").ConfigVars;

  Domains = require("./domains").Domains;

  Keys = require("./keys").Keys;

  Logs = require("./logs").Logs;

  Processes = require("./processes").Processes;

  Releases = require("./releases").Releases;

  Stacks = require("./stacks").Stacks;

  extend = function(obj, mixin) {
    var method, name, results;
    results = [];
    for (name in mixin) {
      method = mixin[name];
      results.push(obj[name] = method);
    }
    return results;
  };

  include = function(klass, mixin) {
    extend(klass.prototype, mixin.prototype);
    return Heroku.inherited.push(mixin);
  };

  include(Heroku, AddOns);

  include(Heroku, Apps);

  include(Heroku, Collaborators);

  include(Heroku, ConfigVars);

  include(Heroku, Domains);

  include(Heroku, Keys);

  include(Heroku, Logs);

  include(Heroku, Processes);

  include(Heroku, Releases);

  include(Heroku, Stacks);

  module.exports.Heroku = Heroku;

  module.exports.PGBackups = require("./pgbackups").PGBackups;

}).call(this);
