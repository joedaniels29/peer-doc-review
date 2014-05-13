# for more details see: http://emberjs.com/guides/models/defining-models/

App.Review = DS.Model.extend
  document:DS.belongsTo 'document',
  content:DS.attr,
  reviewer:DS.belongsTo 'user'
  createdAt: DS.attr('date'),
  updatedAt: DS.attr('date'),


