class ChangesMotorbikePriceToInteger < ActiveRecord::Migration[7.0]
  def change
    remove_column :motorbikes, :price
    add_column :motorbikes, :price, :integer
  end
end
