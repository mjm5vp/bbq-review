class CreateFavorites < ActiveRecord::Migration[5.1]
  def change
    create_table :favorites do |t|
      t.integer :medal
      # t.references :item, index: true, foreign_key: false, null: false
      t.references :location, index: true, foreign_key: true, null: false
      t.references :user, index: true, foreign_key: true, null: false
      t.timestamps
    end
  end
end
