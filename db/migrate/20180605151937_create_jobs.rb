class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.string :job_title
      t.string :employer
      t.date :start_date
      t.date :end_date
      t.string :industry
      t.integer :user_id

      t.timestamps

    end
  end
end
