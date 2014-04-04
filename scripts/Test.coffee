module.exports = (robot) -> 
  robot.respond /cat/i, (msg) ->
    msg.send "They are horrible"

  robot.respond /dog/i, (msg) ->
    msg.send "Who let those [animals] out anyway?"
