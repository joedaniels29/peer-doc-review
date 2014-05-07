# for more details see: http://emberjs.com/guides/controllers/

App.NavigationController = Ember.Controller.extend({

  needs:['application']
  loggedIn: Ember.computed.alias('this.controllers.application.currentUser')
  isAuthenticated: Ember.computed.alias('this.controllers.application.isAuthenticated')

})

