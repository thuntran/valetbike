class CreateRides < ActiveRecord::Migration[7.0]
  def change
    create_table :rides do |t|
      t.integer :identifier
      t.integer :start_station
      t.integer :end_station
      t.integer :Bike
      t.integer :User
      t.datetime  :start_time
      t.datetime  :end_time

      t.timestamps
    end
  end
end
