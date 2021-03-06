class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.string :name
      t.string :img_url
      t.references :city, index: true, foreign_key: true
      t.timestamps
    end
  end
end
