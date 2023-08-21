class AddDescriptionToMotorbike < ActiveRecord::Migration[7.0]
  def change
    add_column :motorbikes, :description, :text
  end
end
