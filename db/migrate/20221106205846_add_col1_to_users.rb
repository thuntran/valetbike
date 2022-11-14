class AddCol1ToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :col1, :float
  end
end
