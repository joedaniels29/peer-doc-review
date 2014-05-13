# for more details see: http://emberjs.com/guides/controllers/

App.IndexController = Ember.Controller.extend({
  needs:['application'],
  person:( ->
    @get('controllers.application.user.name') ||"Stranger"
  ).property('controllers.application.user.name')
})

