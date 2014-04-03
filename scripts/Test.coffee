module.exports = (robot) -> 
  robot.hear /cat/i, (msg) ->
    msg.send "Cats are horrible"
