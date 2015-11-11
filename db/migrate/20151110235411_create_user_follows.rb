class CreateUserFollows < ActiveRecord::Migration
  def change
    create_table :user_follows do |t|
      t.belongs_to :user, index: true
      t.references :followable, polymorphic: true, index: true

      t.timestamps null: false
    end
  end
end
