class Message < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  validates :body, :presence => true

  validates :recipient_id, :presence => true

  validates :sender_id, :presence => true

end
