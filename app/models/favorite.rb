class Favorite < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  validates :favorited_id, :presence => true

  validates :favoriter_id, :presence => true

end
