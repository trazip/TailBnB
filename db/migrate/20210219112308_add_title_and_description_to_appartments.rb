class AddTitleAndDescriptionToAppartments < ActiveRecord::Migration[6.0]
  def change
    add_column :appartments, :title, :string
    add_column :appartments, :description, :text
  end
end
