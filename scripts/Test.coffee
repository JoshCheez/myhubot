module.exports = (robot) -> 
  robot.hear /cat/i, (msg) ->
    msg.send "They are horrible"

  robot.hear /dog/i, (msg) ->
    msg.send "Who let those [animals] out anyway?"
