class CreateReservations < ActiveRecord::Migration[5.0]
  def change
    create_table :reservations do |t|
      t.datetime :start_on
      t.datetime :end_on
      t.references :customer, foreign_key: true, index: true

      t.timestamps
    end
  end
end
