class AddFieldsToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :email_adress, :string
    add_column :users, :password, :string
    add_column :users, :name, :string
    add_column :users, :age, :string
  end
end
