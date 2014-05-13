# for more details see: http://emberjs.com/guides/models/defining-models/

App.Review = DS.Model.extend
  document:DS.belongsTo('document'),
  content:DS.attr('string'),
  reviewer:DS.belongsTo('user'),
  created_at: DS.attr('date'),
  updated_at: DS.attr('date'),

