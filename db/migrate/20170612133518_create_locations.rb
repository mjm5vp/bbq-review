class CreateLocations < ActiveRecord::Migration[5.1]
  def change
    create_table :locations do |t|
      t.string :name
      t.string :address
      t.string :img_url
      # t.references :item, index: true, foreign_key: true
      t.timestamps
    end
  end
end
