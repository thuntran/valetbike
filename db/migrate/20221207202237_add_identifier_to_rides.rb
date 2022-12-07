class AddIdentifierToRides < ActiveRecord::Migration[7.0]
  def change
    add_column :rides, :identifier, :integer
  end
end
