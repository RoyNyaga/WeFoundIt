class AddFieldsToUesrs < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :full_name, :string
    add_column :users, :region, :string
    add_column :users, :city, :string
    add_column :users, :phone, :string
  end
end
