# for more details see: http://emberjs.com/guides/controllers/

PeerDocReview.UsersNewController = Ember.Controller.extend
  createUser: ->
    router = @get("target")
    data = @getProperties("name", "email", "username", "password", "password_confirmation")
    user = @get("model")
    $.post "/users", {user: data }, ((results) ->
      App.AuthManager.authenticate results.api_key.access_token, results.api_key.user_id
      router.transitionTo "index"
    )




