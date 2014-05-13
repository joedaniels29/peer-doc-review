# For more information see: http://emberjs.com/guides/routing/

App.DocumentsIndexRoute = Ember.Route.extend({
  model: ->
    @store.findAll('document')
})
