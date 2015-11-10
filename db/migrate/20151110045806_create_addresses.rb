class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :street_no
      t.string :street_name
      t.string :city
      t.string :region
      t.string :postal_code
      t.references :place, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
