class CreateSilvers < ActiveRecord::Migration[5.1]
  def change
    create_table :silvers do |t|
      t.references :location, index: true, foreign_key: true, null: false
      t.references :user, index: true, foreign_key: true, null: false
      t.timestamps
    end
  end
end
