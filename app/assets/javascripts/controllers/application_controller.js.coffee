# for more details see: http://emberjs.com/guides/controllers/

App.ApplicationController = Ember.Controller.extend({
  user:Ember.computed.alias('session.account')
})

