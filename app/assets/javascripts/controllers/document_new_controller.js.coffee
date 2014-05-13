# for more details see: http://emberjs.com/guides/controllers/

App.DocumentsNewController = Ember.ObjectController.extend({
  actions:
    createDocument: ->
      controller = this
      @get("model").save().then ->
        controller.transitionToRoute "index"

})

