class AddPrivateToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :is_public, :boolean, :null => false, :default => true
  end
end
