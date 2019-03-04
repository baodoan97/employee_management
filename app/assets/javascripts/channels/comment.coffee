App.comment = App.cable.subscriptions.create "CommentChannel",
  connected: ->
    console.log("websocket Client Connected")

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    console.log("fall")

  send_comment: (data) ->
    @perform 'send_comment', message:data
    console.log(data)
