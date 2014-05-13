# for more details see: http://emberjs.com/guides/controllers/

App.ReviewsNewController = Ember.Controller.extend({
  actions:
    createReview: ->
      controller = this
      @get("model").save().then ->
        controller.transitionToRoute "index"
})

