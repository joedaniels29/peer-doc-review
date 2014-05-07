# For more information see: http://emberjs.com/guides/routing/

App.UsersNewRoute = Ember.Route.extend({
    model: ->
      @store.createRecord('user')
})
