# For more information see: http://emberjs.com/guides/routing/

window.PeerDocReview.Router.map ()->


  @resource 'user',path:'/user/:user_id', ->
    @resource 'documents', ->
      @route 'new'
    @resource 'document', path:'/document/:user_id'

  @resource 'users', path: '/' , ->
    @route 'new'