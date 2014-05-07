## Libraries
#= require jquery
#= require jquery_ujs
#= require jquery.cookie
#= require twitter/bootstrap
#= require turbolinks
#= require handlebars
#= require ember
#= require ember-data
#= require ember-auth
#= require ember-auth-request-jquery
#= require ember-auth-session-cookie
#= require ember-auth-module-rememberable
#= require ember-auth-module-auth-redirectable
## Me:
#= require_self
#= require peer_doc_review

# for more details see: http://emberjs.com/guides/application/
window.App = Ember.Application.create(
  LOG_TRANSITIONS: true
)

