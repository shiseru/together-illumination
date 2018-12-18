class Room < ApplicationRecord
  belongs_to :post
  belongs_to :owner, class_name: 'User', foreign_key: 'owner_id'
  belongs_to :participant, class_name: 'User', foreign_key: 'participant_id'

  has_many :messages

  def is_authorized?(user_id)
    return owner_id == user_id || participant_id == user_id
  end
end
