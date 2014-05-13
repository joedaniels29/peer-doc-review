
class LoginSerializer < ActiveModel::Serializer
  self.root = false
  embed :ids, include: true
  attributes :id, :email, :username, :auth_token
end
