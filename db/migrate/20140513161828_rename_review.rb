class RenameReview < ActiveRecord::Migration
  def change
    rename_column :reviews, :review, :content
  end
end
