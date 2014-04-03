module.exports = (robot) -> 
  robot.hear /cat/i, (msg) ->
    msg.send "Cats are horrible"

  robot.hear /dog/i, (msg) ->
    msg.send "Who let those dogs out anyway?"
