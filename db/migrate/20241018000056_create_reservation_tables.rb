class CreateReservationTables < ActiveRecord::Migration[7.0]
  def change
    create_table :reservation_tables do |t|
      t.references :reservation, null: false, foreign_key: true
      t.references :table, null: false, foreign_key: true

      t.timestamps
    end
  end
end
