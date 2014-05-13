class UserSerializer < ActiveModel::Serializer
  embed :ids, include: true
  attributes :id, :email, :username, :name, :created_at, :updated_at

  has_many :documents
  has_many :reviews

end
