# For more information see: http://emberjs.com/guides/routing/

window.App.Router.map ->

  this.route('login')

  this.resource 'users', ->
    this.route('new')


  this.resource 'authenticated', ->
    @resource 'user',path:'/user/:user_id', ->
        @resource 'documents', ->
          @route 'new'
        @resource 'document', path:'/document/:user_id'



