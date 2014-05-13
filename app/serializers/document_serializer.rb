class DocumentSerializer < ActiveModel::Serializer
  attributes :id, :name, :content

  has_one :author
end