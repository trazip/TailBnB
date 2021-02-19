class AddImageUrlToAppartments < ActiveRecord::Migration[6.0]
  def change
    add_column :appartments, :image_url, :text
  end
end
