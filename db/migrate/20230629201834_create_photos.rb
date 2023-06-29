class CreatePhotos < ActiveRecord::Migration[7.0]
  def change
    create_table :photos do |t|
      t.references :imageable, polymorphic: true
      t.string :image_url
      t.timestamps
    end
  end
end
