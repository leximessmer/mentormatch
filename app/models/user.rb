class User < ApplicationRecord
  # Direct associations

  has_many   :degrees,
             :dependent => :destroy

  has_many   :jobs,
             :dependent => :destroy

  has_many   :fans,
             :class_name => "Favorite",
             :foreign_key => "favorited_id",
             :dependent => :destroy

  has_many   :favorites,
             :foreign_key => "favoriter_id",
             :dependent => :destroy

  # Indirect associations

  # Validations

  validates :name, :presence => true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
