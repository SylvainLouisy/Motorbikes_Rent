class CreateMotorbikes < ActiveRecord::Migration[7.0]
  def change
    create_table :motorbikes do |t|
      t.string :name
      t.string :brand
      t.string :color
      t.integer :year
      t.integer :price
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
