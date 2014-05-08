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
          resolve token: response.auth_token
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
  jqXHR.setRequestHeader "Authorization", "Token: " + @get("session.token")  if @get("session.isAuthenticated") and not Ember.isEmpty(@get("session.token"))
  return
)

Ember.Application.initializer
  name: 'authentication',
  initialize: (container, application)->
    container.register('authorizer:custom', App.RailsAuthorizer);
    container.register('authenticator:custom', App.RailsAuthenticator);
    Ember.SimpleAuth.setup(container, application,
      authenticatorFactory: 'authenticator:custom',
      authorizerFactory: 'authorizer:custom',
      storeFactory: 'session-store:local-storage'
    )
