class Review < ActiveRecord::Base
  has_attached_file :file
  validates_presence_of :reviewer_id, :document_id
  belongs_to :document
  belongs_to :reviewer, class_name: "User", foreign_key: :reviewer_id
end
