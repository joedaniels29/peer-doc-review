# For more information see: http://emberjs.com/guides/routing/


PeerDocReview.IndexRoute = Ember.Route.extend({
  beforeModel: ->
    logged = 0
    if (PeerDocReview.loggedIn)
      this.transitionTo('users')
    else
      this.transitionTo('login');

})