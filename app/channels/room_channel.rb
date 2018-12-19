class RoomChannel < ApplicationCable::Channel
  def subscribed
    stream_from "room_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(message)
    Message.create(room_id: message['room_id'],
                   user_id: message['user_id'],
                   content: message['content'])
  end
end


