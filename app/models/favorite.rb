class Favorite < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  validates :favoriter_id, :presence => true

end
