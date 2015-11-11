class CreateUserFollows < ActiveRecord::Migration
  def change
    create_table :user_follows do |t|
      t.references :user
      t.references :followable, polymorphic: true, index: true

      t.timestamps null: false
    end
  end
end
