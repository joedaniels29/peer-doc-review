class Document < ActiveRecord::Base
  belongs_to :author, class: :user
  has_many :reviews

  validates_presence_of :name, :author
  validate :content_or_file

  def content_or_file


  end
end
