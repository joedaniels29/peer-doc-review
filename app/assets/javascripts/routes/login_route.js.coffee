App.LoginRoute = Ember.Route.extend(

  # clear a potentially stale error message from previous login attempts
  setupController: (controller, model) ->
    controller.set "errorMessage", null
    return

  actions:

  # display an error when authentication fails
    sessionAuthenticationFailed: (message) ->
      @controller.set "errorMessage", message
      return
)
