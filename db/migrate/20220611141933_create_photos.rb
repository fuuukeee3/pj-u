class CreatePhotos < ActiveRecord::Migration[7.0]
  def change
    create_table :photos do |t|
      t.string :title, null: false
      t.text :image_file, null: false
      t.string :user_id, null: false

      t.timestamps
    end

    add_foreign_key :photos, :users, column: :user_id, primary_key: :user_id
  end
end
