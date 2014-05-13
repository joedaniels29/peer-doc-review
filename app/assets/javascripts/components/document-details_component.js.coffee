# for more details see: http://emberjs.com/guides/components/

App.DocumentDetailsComponent = Ember.Component.extend({
  classNames: ['row']
  yourDocument:(->
    false
#    this.get('document.author.id')== @container.lookup('route:Application').get('session.author.id')
#    @get('document.author.id')
  ).property('document.author.id')
})

