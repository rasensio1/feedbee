class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :body
      t.integer :sentiment
      t.references :followable, polymorphic: true, index: true

      t.timestamps null: false
    end
  end
end
