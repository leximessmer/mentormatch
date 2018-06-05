class AddDegreeCountToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :degrees_count, :integer
  end
end
