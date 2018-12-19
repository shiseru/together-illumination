App.room = App.cable.subscriptions.create "RoomChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    # Called when there's incoming data on the websocket for this channel
    $('#messages').prepend data['message']

  speak: (room_id, user_id, content)->
    @perform 'speak', {room_id: room_id, user_id: user_id, content: content}

  $(document).on 'keypress', '[data-behavior~=room_speaker]', (event) ->
    if event.keyCode is 13 # return key = send
      App.room.speak(gon.room_id, gon.user_id, $('.js-content').val())
      event.target.value = ''
      event.preventDefault()

