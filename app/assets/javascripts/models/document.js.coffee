# for more details see: http://emberjs.com/guides/models/defining-models/

App.Document = DS.Model.extend
  title: DS.attr(),
  author: DS.belongsTo('user',{inverse: 'documents'}),
  fileUrl: DS.attr('string'),
#  reviews: DS.hasMany('review',{inverse: 'docuemnt'}),
  subject: DS.belongsTo('subject'),
