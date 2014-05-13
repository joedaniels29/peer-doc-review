# for more details see: http://emberjs.com/guides/controllers/

App.IndexController = Ember.Controller.extend({
  needs:['application'],
  person:( ->
    @get('controllers.application.user.name') ||"Stranger"
  ).property('controllers.application.user.name')


  mostRecentReview:( ->
    mostRecent=null
    @store.find('review', {author_id:@person.get('id')}).then((reviews)->
      mostRecent = reviews.reduce (a,b) ->
        if Math.max(a.get('updated_at'), b.get('updated_at')) == a.updated_at then a else b
    )
    return mostRecent
  ).property('controllers.application.user','reviews.@each.updated_at')

  mostRecentDocument:( ->
    mostRecent=null
    @store.find('document', {reviewer_id:@person.get('id')}).then((documents)->
      mostRecent = documents.reduce (a,b) ->
        if Math.max(a.get('updated_at'), b.get('updated_at')) == a.updated_at then a else b
    )
    return mostRecent
  ).property('controllers.application.user','documents.@each.updated_at')



})

