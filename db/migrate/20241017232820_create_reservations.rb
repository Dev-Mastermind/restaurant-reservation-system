class CreateReservations < ActiveRecord::Migration[7.0]
  def change
    create_table :reservations do |t|
      t.string :name
      t.integer :requested_capacity
      t.datetime :reserve_time

      t.timestamps
    end
  end
end
