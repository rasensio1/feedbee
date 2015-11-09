class CreatePlaces < ActiveRecord::Migration
  def change
    create_table :places do |t|
      t.string :place_id
      t.string :name
      t.string :image_url
      t.string :rating
      t.string :phone_no
      t.string :website
      t.string :hours

      t.timestamps null: false
    end
  end
end
