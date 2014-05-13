# For more information see: http://emberjs.com/guides/routing/

App.IndexRoute = Ember.Route.extend({
  person:( ->
    @get('controllers.application.user.name') ||"Stranger"
  ).property('controllers.application.user')
})
