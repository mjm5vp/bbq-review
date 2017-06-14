class CreateLocations < ActiveRecord::Migration[5.1]
  def change
    create_table :locations do |t|
      t.string :name
      t.string :address
      t.string :img_url
      t.integer :gold
      t.integer :silver
      t.integer :bronze
      t.integer :total_score
      t.integer :total_votes
      t.references :item, index: true, foreign_key: true
      t.timestamps
    end
  end
end
