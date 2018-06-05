class User < ApplicationRecord
  # Direct associations

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
