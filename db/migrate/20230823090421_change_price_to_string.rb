class ChangePriceToString < ActiveRecord::Migration[7.0]
  def change
    change_column :motorbikes, :price, :string
  end
end
