class AddReferencesToFrienships < ActiveRecord::Migration[7.0]
  def change
    add_reference :friendships, :user, foreign_key: {to_table: :users}
    add_reference :friendships, :friend, foreign_key: {to_table: :users}

    add_column :friendships, :status, :string
  end
end
