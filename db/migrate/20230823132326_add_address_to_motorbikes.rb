class AddAddressToMotorbikes < ActiveRecord::Migration[7.0]
  def change
    add_column :motorbikes, :address, :string
  end
end
