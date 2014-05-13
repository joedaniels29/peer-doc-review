# for more details see: http://emberjs.com/guides/models/defining-models/

App.User = DS.Model.extend
  name: DS.attr('string'),
  email: DS.attr('string'),
  username: DS.attr('string'),
  documents: DS.hasMany('document',{async: true}),
  reviews: DS.hasMany('review',{async: true}),
  created_at: DS.attr('date'),
  updated_at: DS.attr('date'),

  errors: {}
#  documents: DS.hasMany('document', {async: true})
#  reviews_written: DS.hasMany('review', {async: true})

#PeerDocReview.User.FIXTURES = [
#  {
#    id: 1,
#    firstName: "Joe",
#    lastName: "Daniels",
#
#    documents: [1,2]
#    reviews_written: [2,4]
#  },
#  {
#    id: 2,
#    firstName: "Mihir",
#    lastName: "Joshi",
#
#    documents: [3,5]
#    reviews_written: [1,3]
#  },
#  {
#    id: 1,
#    firstName: "Bob",
#    lastName: "Jenkins",
#
#    documents: [4]
#    reviews_written: [5]
#  }];
