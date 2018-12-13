class AddLatitudeAndLongitudeToParks < ActiveRecord::Migration[5.2]
  def change
    add_column :parks, :latitude, :decimal, {:precision=>10, :scale=>6}
    add_column :parks, :longitude, :decimal, {:precision=>10, :scale=>6}
  end
end
