# For more information see: http://emberjs.com/guides/routing/

App.DocumentsNewRoute = Ember.Route.extend({
  model:(->
    @store.createRecord 'document'
  ),

  setupController:((controller, model)  ->
    this._super(controller, model)
    @.get('session.account').then (a)->
      model.set('author',  a)

  )

  actions:
    willTransition: (transition) ->
      if @currentModel.get("isNew")
       if confirm("Are you sure you want to abandon progress?")
         @currentModel.destroyRecord()
       else
          transition.abort()
})
