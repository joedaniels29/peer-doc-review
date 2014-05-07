Ember.Application.initializer
  name: 'authentication',
  initialize: (container, application)->

    application.Auth = Em.Auth.extend
      modules: ['emberData', 'rememberable', 'authRedirectable', 'actionRedirectable', 'timeoutable']
      strategy: 'token'
      tokenKey: 'auth_token'
      tokenLocation: 'param'
      request: 'jquery'
      response: 'json'
      session: 'cookie'
      signInEndPoint: '/sign-in'
      signOutEndPoint: '/sign-out'
      tokenIdKey: 'user_id'
      emberData:
        userModel: 'member'
      rememberable:
        tokenKey: 'remember_token'
        period: 14
        autoRecall: false
      actionRedirectable:
        signInRoute: 'account.show'
        signOutRoute: 'index'

      timeoutable:
        period: 20
