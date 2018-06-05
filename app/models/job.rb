class Job < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  validates :employer, :presence => true

  validates :industry, :presence => true

  validates :job_title, :presence => true

  validates :start_date, :presence => true

end
