describe "Apps", ->
  {Apps} = require "../src/apps"
  apps = null
  
  beforeEach ->
    apps = new Apps
    apps.request = (arg, callback) -> return
    spyOn(apps, 'request')

  it "should be able to create a properly structured JSON file from params", ->
    expected =
      app :
        name : "the-test-case"
    actual = apps.app_params(name: "the-test-case")
    expect(actual).toEqual(expected)

  it "should be able to send a properly constructed JSON POST request to create", ->
    apps.post_app {name: "the-test-case"}, () -> return
    expected =
      expects : 202
      method  : "POST"
      path    : "/apps"
      query   :
        app   :
          name: "the-test-case"
    expect(apps.request).toHaveBeenCalled()
    expect(apps.request.mostRecentCall.args[0]).toEqual(expected)

  it "should be to send an update request to change the name of an app", ->
    apps.put_app 'the-test-case', {name: 'the-test-case-2'}, () -> return
    expected =
      method   : "PUT"
      path     : "/apps/the-test-case"
      query    :
        app    :
          name : 'the-test-case-2'
    expect(apps.request).toHaveBeenCalled()
    expect(apps.request.mostRecentCall.args[0]).toEqual(expected)
