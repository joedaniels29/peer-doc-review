# For more information see: http://emberjs.com/guides/routing/

App.ApplicationRoute = Ember.Route.extend(Ember.SimpleAuth.ApplicationRouteMixin,

#  actions:
#    sessionAuthenticationSucceeded:->
#      @_super()
#      this.get('store').find('user', 'me').then (me)=>
#        @.controllerFor('application').set 'user',  me
)