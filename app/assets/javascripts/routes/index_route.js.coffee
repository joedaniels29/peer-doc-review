# For more information see: http://emberjs.com/guides/routing/

App.IndexRoute = Ember.Route.extend({
#  model: ->
#    if(@get('session.account.id'))
#      @get('store').find('user', @get('session.account.id'))
#

  person:( ->
    @get('controllers.application.user.name') ||"Stranger"
  ).property('controllers.application.user')
})
