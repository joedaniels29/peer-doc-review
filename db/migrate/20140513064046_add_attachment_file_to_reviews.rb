class AddAttachmentFileToReviews < ActiveRecord::Migration
  def self.up
    change_table :reviews do |t|
      t.attachment :file
    end
  end

  def self.down
    drop_attached_file :reviews, :file
  end
end
