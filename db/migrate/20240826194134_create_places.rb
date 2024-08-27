class CreatePlaces < ActiveRecord::Migration[7.1]
  def change
    create_table :places do |t|
      t.string :name
      t.float :price
      t.string :location
      t.text :description
      t.float :rating
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
