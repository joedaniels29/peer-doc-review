# the custom authenticator that authenticates the session against the custom server
App.RailsAuthenticator = Ember.SimpleAuth.Authenticators.Base.extend(
  login_url: '/sign-in',
  logout_url: '/sign-out',

  restore: (data) ->
    new Ember.RSVP.Promise((resolve, reject) ->
      unless Ember.isEmpty(data.token)
        resolve data
      else
        reject()
    )

  authenticate: (credentials) ->
    _this = this
    new Ember.RSVP.Promise((resolve, reject) ->
      Ember.$.ajax(
        url: _this.login_url
        type: "POST"
        data: JSON.stringify(
          email_or_username: credentials.identification
          password: credentials.password
        )
        contentType: "application/json"
      ).then ((response) ->
        Ember.run ->
          resolve
            token: response.auth_token
            account_id: response.id
          return

        return
      ), (xhr, status, error) ->
        response = JSON.parse(xhr.responseText)
        Ember.run ->
          reject response.error
    )

  invalidate: ->
    _this = this
    new Ember.RSVP.Promise((resolve) ->
      Ember.$.ajax(
        url: _this.logout_url
        type: "DELETE"
      ).always ->
        #delete token.
        resolve()
    )
)

# the custom authorizer that authorizes requests against the custom server
App.RailsAuthorizer = Ember.SimpleAuth.Authorizers.Base.extend(authorize: (jqXHR, requestOptions) ->
  jqXHR.setRequestHeader "Authorization", "Token token=\"#{@get("session.token")}\"" if @get("session.isAuthenticated") and not Ember.isEmpty(@get("session.token"))
  return
)

Ember.Application.initializer
  name: 'authentication',
  initialize: (container, application)->
    # customize the session so that it allows access to the account object
    Ember.SimpleAuth.Session.reopen({
      account: (->
        accountId = @get("content.account_id")
        container.lookup("store:main").find "user", accountId  unless Ember.isEmpty(accountId)
      ).property("content.account_id"),
      account_id:null
    })

    container.register('authorizer:custom', App.RailsAuthorizer);
    container.register('authenticator:custom', App.RailsAuthenticator);
    Ember.SimpleAuth.setup(container, application,
      authenticatorFactory: 'authenticator:custom',
      authorizerFactory: 'authorizer:custom',
      storeFactory: 'session-store:local-storage'
    )
