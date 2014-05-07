# for more details see: http://emberjs.com/guides/controllers/

App.IndexController = Ember.Controller.extend({
  needs:['application'],
  person:( ->
    @get('this.controllers.application.currentUser.firstName') ||"Stranger"
  ).property('this.controllers.application.currentUser')
})

