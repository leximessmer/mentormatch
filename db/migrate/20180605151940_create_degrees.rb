class CreateDegrees < ActiveRecord::Migration
  def change
    create_table :degrees do |t|
      t.string :school
      t.string :degree
      t.date :graduation_date
      t.integer :user_id

      t.timestamps

    end
  end
end
