class CreateAppartments < ActiveRecord::Migration[6.0]
  def change
    create_table :appartments do |t|
      t.string :address
      t.float :latitude
      t.float :longitude
      t.integer :price
      t.boolean :active
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
