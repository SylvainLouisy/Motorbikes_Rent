class AddCoordinatesToMotorbikes < ActiveRecord::Migration[7.0]
  def change
    add_column :motorbikes, :latitude, :float
    add_column :motorbikes, :longitude, :float
  end
end
