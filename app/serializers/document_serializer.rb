class DocumentSerializer < ActiveModel::Serializer
  attributes :id, :name, :content
  has_one :owner_id
end
