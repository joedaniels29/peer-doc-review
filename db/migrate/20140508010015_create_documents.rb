class CreateDocuments < ActiveRecord::Migration
  def change
    create_table :documents do |t|
      t.references :owner_id, index: true
      t.string :name
      t.text :content
      t.text :authors_upload_comments
      
      t.timestamps
    end
  end
end
