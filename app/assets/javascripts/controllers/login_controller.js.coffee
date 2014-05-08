# for more details see: http://emberjs.com/guides/controllers/

App.LoginController = Ember.Controller.extend(Ember.SimpleAuth.LoginControllerMixin,
  authenticatorFactory: "authenticator:custom"
)