class CreateRides < ActiveRecord::Migration[7.0]
  def change
    create_table :rides do |t|
      t.integer :start_station_id
      t.integer :end_station_id
      t.integer :bike_id
      t.integer :user_id
      t.datetime  :start_time
      t.datetime  :end_time

      t.timestamps
    end
  end
end
