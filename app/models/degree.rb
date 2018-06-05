class Degree < ApplicationRecord
  # Direct associations

  belongs_to :user,
             :counter_cache => true

  # Indirect associations

  # Validations

  validates :degree, :presence => true

  validates :graduation_date, :presence => true

  validates :school, :presence => true

end
