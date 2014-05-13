class ReviewSerializer < ActiveModel::Serializer
  attributes :id, :review, :reviewer_id, :document_id, :created_at, :updated_at, :file_url

  def file_url
    if object.file.present?
      object.file.url
    else
      ""
    end
  end

  embed :ids, include: true


  has_one :document
  has_one :reviewer

end
