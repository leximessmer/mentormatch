class Favorite < ApplicationRecord
  # Direct associations

  belongs_to :favorite_user,
             :class_name => "User",
             :foreign_key => "favorited_id",
             :counter_cache => :fans_count

  belongs_to :user,
             :foreign_key => "favoriter_id",
             :counter_cache => true

  # Indirect associations

  # Validations

  validates :favorited_id, :presence => true

  validates :favoriter_id, :presence => true

end
