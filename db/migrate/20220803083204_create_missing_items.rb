class CreateMissingItems < ActiveRecord::Migration[6.1]
  def change
    create_table :missing_items do |t|
      t.string :name
      t.string :description
      t.string :region
      t.string :city
      t.boolean :is_missing
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
