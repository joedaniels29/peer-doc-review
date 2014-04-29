# for more details see: http://emberjs.com/guides/controllers/

PeerDocReview.LoginController = Ember.Controller.extend({

  actions:
    login: ->
      loginController = @needs("login")
      username = loginController.get("username")
      password = loginController.get("password")

      # this would normally be done asynchronously
      if username is "tomdale" and password is "zomg"
        localStorage.authToken = "auth-token-here"
        applicationController = @needs("application")
        transition = applicationController.get("savedTransition")

        # set isLoggedIn so the UI shows the logout button
        applicationController.login()

        # if the user was going somewhere, send them along, otherwise
        # default to `/posts`
        if transition
          transition.retry()
        else
          @transitionTo "posts"
      return

  loginFailed: false,
  isLoggedIn: false,
  isProcessing: false,
  isSlowConnection: false,
  timeout: null,

  login: ->
    this.setProperties
      loginFailed: false,
      isProcessing: true

    this.set("timeout", setTimeout(this.slowConnection.bind(this), 5000))

    request = $.post("/login", this.getProperties("username", "password"))
    request.then(this.success.bind(this), this.failure.bind(this))


  success: ->
    this.reset()
    document.location = "/welcome"
    this.set("isLoggedIn", true)


  failure: ->
    this.reset()
    this.set("loginFailed", true)
    this.set("isLoggedIn", false)


  slowConnection: ->
     this.set("isSlowConnection", true)


  reset: ->
    clearTimeout(this.get("timeout"))
    this.setProperties
      isProcessing: false,
      isSlowConnection: false


})

