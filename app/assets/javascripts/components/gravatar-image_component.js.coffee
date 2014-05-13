# for more details see: http://emberjs.com/guides/components/

App.GravatarImageComponent = Ember.Component.extend(
  size: 200
  email: ""
  gravatarUrl: (->
    email = @get("email")
    size = @get("size")
    "http://www.gravatar.com/avatar/" + hex_md5(email) + "?s=" + size
  ).property("email", "size")
)
