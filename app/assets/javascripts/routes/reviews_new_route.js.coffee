# For more information see: http://emberjs.com/guides/routing/

App.ReviewsNewRoute = Ember.Route.extend(
  model: (params)->
    @get('session.account').then((a)=>
      @store.createRecord("review", {
        reviewer:a,
        document: @modelFor('document')
      })
    )


#  setupController: (controller, model) ->
#    this._super(controller, model)
#    controller.set "model", model.book
#    controller.set "genres", model.genres
#    return

  actions:
    willTransition: (transition) ->
      if @currentModel.get("isNew")
        if confirm("Are you sure you want to abandon progress?")
          @currentModel.destroyRecord()
        else
          transition.abort()
)