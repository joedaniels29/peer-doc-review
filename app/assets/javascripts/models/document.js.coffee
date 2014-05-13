# for more details see: http://emberjs.com/guides/models/defining-models/

App.Document = DS.Model.extend
  name: DS.attr(),
  createdAt: DS.attr('date'),
  updatedAt: DS.attr('date'),
  author: DS.belongsTo('user',{inverse: 'documents'}),
  fileUrl: DS.attr('string'),
  file: DS.attr('string'),
  content: DS.attr('string'),
  reviews: DS.hasMany('review',{inverse: 'document'}),
