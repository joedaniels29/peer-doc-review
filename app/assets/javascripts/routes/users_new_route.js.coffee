# For more information see: http://emberjs.com/guides/routing/

PeerDocReview.UsersNewRoute = Ember.Route.extend({
  setupController: (controller, model) ->
    @controller.set('model', @store.createRecord('user'))

})
