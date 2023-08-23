class AddAdressToMotorbikes < ActiveRecord::Migration[7.0]
  def change
    add_column :motorbikes, :adress, :string
  end
end
