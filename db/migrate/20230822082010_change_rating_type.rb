class ChangeRatingType < ActiveRecord::Migration[7.0]
  def change
    change_column :reviews, :rating, :integer, using: 'rating::integer'
  end
end
