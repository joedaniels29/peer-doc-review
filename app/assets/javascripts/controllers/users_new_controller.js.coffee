# for more details see: http://emberjs.com/guides/controllers/

App.UsersNewController = Ember.ObjectController.extend
  actions:
    createUser: ->
      router = @get("target")
      data = @getProperties("name", "email", "username", "password", "password_confirmation")
      user = @get("model")
      $.post("/users", {user: data }, ((results) ->
        App.AuthManager.authenticate results.api_key.access_token, results.api_key.user_id
        router.transitionTo "index"
      )).fail (jqxhr, textStatus, error) ->
        if jqxhr.status is 422
          errs = JSON.parse(jqxhr.responseText)
          user.set "errors", errs.errors