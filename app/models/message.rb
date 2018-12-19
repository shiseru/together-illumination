class Message < ApplicationRecord
  belongs_to :room
  belongs_to :user

  # when message is created, do asynchronous broadcasting job
  after_create_commit { MessageBroadcastJob.perform_later self }
end
