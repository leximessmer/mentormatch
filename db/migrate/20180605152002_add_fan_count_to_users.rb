class AddFanCountToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :fans_count, :integer
  end
end
