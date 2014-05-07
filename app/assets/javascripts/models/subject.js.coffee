# for more details see: http://emberjs.com/guides/models/defining-models/

App.Subject = DS.Model.extend
  name: DS.attr(),
  documents: DS.hasMany('document', {async: true})


#PeerDocReview.Subject .FIXTURES = [
#  {
#    id: 1,
#    name: 'Science',
#    documents: [2]
#  },
#  {
#    id: 2,
#    name: 'English'
#    documents: [4,5]
#  },
#  {
#    id: 3,
#    name: 'GWIST',
#    documents: [1,3]
#  }
#];