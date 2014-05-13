class Document < ActiveRecord::Base
  has_attached_file :file

  belongs_to :author, class_name: "User", foreign_key: :author_id
  has_many :reviews

  validates_presence_of :name, :author
  validate :content_or_file
  validates :name, length: {minimum: 5}


  private

  def content_or_file

    if (self.file and not self.content) or (self.content and not self.file)
      return
    end
    if self.file and self.content
      errors.add(:content, "cannot supply both text content and a file")
    elsif not self.file and not self.content
      errors.add(:content, "must supply content")
    else
      errors.add(:content, "unexpected error")
    end
  end


end
