class AddLatAndLongToPlaces < ActiveRecord::Migration
  def change
    add_column :places, :lat, :string
    add_column :places, :lng, :string
  end
end
