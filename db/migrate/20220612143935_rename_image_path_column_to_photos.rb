class RenameImagePathColumnToPhotos < ActiveRecord::Migration[7.0]
  def change
    rename_column :photos, :image_path, :image_file
  end
end
