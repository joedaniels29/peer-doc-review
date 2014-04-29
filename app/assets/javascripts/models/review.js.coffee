# for more details see: http://emberjs.com/guides/models/defining-models/

PeerDocReview.Review = DS.Model.extend()
  document:DS.belongsTo 'document',
  comments:DS.attr,
  reviewer:DS.belongsTo 'user'

