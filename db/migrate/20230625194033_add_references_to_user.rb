class AddReferencesToUser < ActiveRecord::Migration[7.0]
  def change
    add_reference :posts, :user, foreign_key: {to_table: :users}
    add_reference :comments, :user, foreign_key: {to_table: :users}
    add_reference :likes, :user, foreign_key: {to_table: :users}

    add_reference :comments, :post, foreign_key: {to_table: :posts}
    add_reference :likes, :post, foreign_key: {to_table: :posts}
  end
end
