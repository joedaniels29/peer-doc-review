class RenameToAuthorId < ActiveRecord::Migration
  def change
    rename_column :documents, :owner_id_id, :author_id
  end
end
