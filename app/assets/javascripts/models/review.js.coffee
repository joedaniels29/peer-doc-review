# for more details see: http://emberjs.com/guides/models/defining-models/

App.Review = DS.Model.extend()
  document:DS.belongsTo 'document',
  comments:DS.attr,
  reviewer:DS.belongsTo 'user'

