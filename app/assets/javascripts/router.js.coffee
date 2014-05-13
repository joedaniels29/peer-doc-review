# For more information see: http://emberjs.com/guides/routing/

window.App.Router.map ->

  this.route('login')

  this.resource 'users', ->
    this.route('new')


  this.resource 'authenticated', ->
    @resource 'user',path:'/user/:user_id', ->
    @resource 'documents', path:'/documents', ->

      @route 'new'
      @resource 'document', path:"/:document_id", ->
        @resource 'reviews', path:'/reviews', ->
          @route 'new'
          @resource 'review', path:"/:review_id", ->





