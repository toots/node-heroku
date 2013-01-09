describe "Apps", ->
  {Heroku} = require "../src/heroku"
  
  beforeEach ->
    @heroku = new Heroku
      key : "deadbeef"

    spyOn @heroku, "request"

  it "should be able to create a properly structured JSON file from params", ->
    expected =
      app :
        name : "the-test-case"

    actual = @heroku.app_params
      name: "the-test-case"

    expect(actual).toEqual expected

  it "should be able to send a properly constructed JSON POST request to create", ->
    fn = ->

    @heroku.post_app { name: "the-test-case" }, fn

    expect(@heroku.request).toHaveBeenCalledWith {
      expects : 202
      method  : "POST"
      path    : "/apps"
      query   :
        app :
          name : "the-test-case"
    }, fn

  it "should be to send an update request to change the name of an app", ->
    fn = ->

    @heroku.put_app "the-test-case", { name: "the-test-case-2" }, fn

    expect(@heroku.request).toHaveBeenCalledWith {
      method   : "PUT"
      path     : "/apps/the-test-case"
      query    : 
        app :
          name : "the-test-case-2"
    }, fn
