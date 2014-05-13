# For more information see: http://emberjs.com/guides/routing/

App.ReviewsNewRoute = Ember.Route.extend(
  model: (params)->
    @store.createRecord("review", {
      author: @get('session.account')
      document: @modelFor('document')
    })

#  setupController: (controller, model) ->
#    this._super(controller, model)
#    controller.set "model", model.book
#    controller.set "genres", model.genres
#    return

  actions:
    willTransition: (transition) ->
      if @currentModel.book.get("isNew")
        if confirm("Are you sure you want to abandon progress?")
          @currentModel.review.destroyRecord()
        else
          transition.abort()
)