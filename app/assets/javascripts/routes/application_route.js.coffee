# For more information see: http://emberjs.com/guides/routing/

PeerDocReview.ApplicationRoute = Ember.Route.extend(
  init: ->
    @_super();
    PeerDocReview.AuthManager = window.AuthManager.create()


)