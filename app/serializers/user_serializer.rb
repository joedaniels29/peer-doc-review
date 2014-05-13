class UserSerializer < ActiveModel::Serializer
  embed :ids, include: true
  attributes :id, :email, :username, :name

  has_many :documents

end
