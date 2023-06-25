class AddContents < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :contents, :string
    add_column :comments, :contents, :string
  end
end
