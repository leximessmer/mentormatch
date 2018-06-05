class Degree < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  validates :graduation_date, :presence => true

  validates :school, :presence => true

end
