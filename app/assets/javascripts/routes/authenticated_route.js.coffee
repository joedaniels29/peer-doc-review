# For more information see: http://emberjs.com/guides/routing/
App.ProtectedRoute = Ember.Route.extend(Ember.SimpleAuth.AuthenticatedRouteMixin)