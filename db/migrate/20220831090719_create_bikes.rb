class CreateBikes < ActiveRecord::Migration[7.0]
  def change
    create_table :bikes do |t|
      t.integer :identifier
      t.integer :current_station_id
      t.integer :battery_percentage

      t.timestamps
    end
  end
end
