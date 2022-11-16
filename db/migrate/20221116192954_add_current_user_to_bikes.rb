class AddCurrentUserToBikes < ActiveRecord::Migration[7.0]
  def change
    add_column :bikes, :current_user_id, :integer
  end
end
