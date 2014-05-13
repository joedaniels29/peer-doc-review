class ReviewSerializer < ActiveModel::Serializer
  attributes :id, :content, :reviewer_id, :document_id, :created_at, :updated_at, :file_url

  embed :ids, include: true

  def file_url
    if object.file.present?
      object.file.url
    else
      ""
    end
  end



  has_one :document
  has_one :user =>:reviewer

end
