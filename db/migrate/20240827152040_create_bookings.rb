class CreateBookings < ActiveRecord::Migration[7.1]
  def change
    create_table :bookings do |t|
      t.references :place, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.date :checkin
      t.date :checkout
      t.float :total_price
      t.boolean :status

      t.timestamps
    end
  end
end
