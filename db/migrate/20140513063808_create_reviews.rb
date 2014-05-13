class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.text :review
      t.integer :reviewer_id
      t.integer :document_id

      t.timestamps
    end
  end
end
