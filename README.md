Heroku client API for node
==========================

Welcome to this (almost) untested, mostly rip-off of [heroku/heroku.rb](https://github.com/heroku/heroku.rb).

This module provides exactly the same API as heroku's official client. Each function has been carefully fed to monkeys who, through patience and understanding, had been trained to translate basic ruby into coffee script.

<table>
  <tr><td><img src="https://github.com/toots/node-heroku/raw/master/misc/monkey.png" alt="A monkey in action" title="A monkey in action"/></td></tr>
  <tr><td>A monkey in action</td></tr>
</table>

Those monkeys' education cost a lot so we could not afford tests for this code. However, we guarantee that no animal was hurt while preparing this module.

How to use?
===========

API exported by this module is _exactly_ the same as API exported by  [heroku/heroku.rb](https://github.com/heroku/heroku.rb). Yes, this also means that some variables are not camelCased. We apologize in advance for this inconvenience and, most regretfully, have to deny any liability regarding any possible eye injury while inspecting this code.

That being said, here's a sample use, which is also the only one actually tested:

    heroku = require("heroku");
    client = new heroku.Heroku({key: "deadbeef"});
    client.get_releases("my_app", function (error, result) {
      (...your code here...)
    });

For those who prefer to have it with more caffeine, here's the same example in [coffee-script](https://github.com/jashkenas/coffee-script):

    {Heroku} = require "heroku"
    client   = new Heroku
      key : "deadbeef"

    client.get_releases "my_app", (error, result) ->
      (..your code here..)
