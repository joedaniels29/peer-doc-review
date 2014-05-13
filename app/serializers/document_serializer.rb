class DocumentSerializer < ActiveModel::Serializer
  attributes :id, :name, :content, :created_at, :updated_at, :file_url

  def file_url
      if object.file.present?
        object.file.url
      else
        ""
      end
  end

  has_one :author
end