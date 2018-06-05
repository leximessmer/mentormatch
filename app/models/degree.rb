class Degree < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  validates :degree, :presence => true

  validates :graduation_date, :presence => true

  validates :school, :presence => true

end
