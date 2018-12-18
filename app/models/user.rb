class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # post model
  has_many :posts

  # room model
  has_many :owner_rooms, class_name: 'Room', foreign_key: 'owner_id'
  has_many :participant_rooms, class_name: 'Room', foreign_key: 'participant_id'

  # message model
  has_many :messages
end
