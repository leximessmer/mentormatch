class AddJobCountToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :jobs_count, :integer
  end
end
