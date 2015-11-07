class ChangeNameAndToken < ActiveRecord::Migration
  def change
    remove_column :users, :first_name
    remove_column :users, :last_name
    remove_column :users, :provider

    add_column :users, :name, :string
    add_column :users, :oauth_token, :string
  end
end
