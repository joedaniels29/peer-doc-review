# for more details see: http://emberjs.com/guides/models/defining-models/

PeerDocReview.Document = DS.Model.extend()
  title: DS.attr(),
  author: DS.belongsTo('user'),
  reviewer: DS.belongsTo('user'),
  rating: DS.attr('number'),

  subject: DS.belongsTo('subject'),
  url:( ->
      "http://www.amazon.com/gp/product/"+this.get('amazon_id')+"/adamfortuna-20";
  ).property 'amazon_id',
  image: (->
    "http://images.amazon.com/images/P/"+this.get('amazon_id')+".01.ZTZZZZZZ.jpg";
  ).property('amazon_id')
