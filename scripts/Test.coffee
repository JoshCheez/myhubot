module.exports = (robot) -> 
  robot.respond /cat/i, (msg) ->
    msg.send "They are horrible"

  robot.respond /dog/i, (msg) ->
    msg.send "Who let those [animals] out anyway?"

  robot.respond /multiply (.*)/i, (msg) ->
    mathsign = msg.match[1]
    re = /\D+/
    mathassignment = mathsign.split(re)
    x = 0
    total = 1
    if mathassignment.length <= 1
      msg.send "I'm no fool. You can't multiply a single number. Get on my level"
      return
    else
      while x < (mathassignment.length)
        if mathassignment[x] == 0
          total = 0
        else
          total = total * mathassignment[x]
          x++
    msg.send total
    

  robot.respond /add (.*)/i, (msg) ->
    mathsign = msg.match[1]
    re = /\D+/
    mathassignment = mathsign.split(re)
    x = 0
    total = 0
    if mathassignment.length <= 1
      msg.send "I'm no fool. You can't add a single number. Get on my level"
      return
    else
      while x < (mathassignment.length)
        total = total + parseInt(mathassignment[x])
        x++
    msg.send total

  robot.respond /subtract (.*)/i, (msg) ->
    mathsign = msg.match[1]
    re = /\D+/
    mathassignment = mathsign.split(re)
    x = 0
    total = mathassignment[0]
    if mathassignment.length <= 1
      msg.send "I'm no fool. You can't subtract a single number. Get on my level"
      return
    else
      while x < (mathassignment.length - 1)
        total = total - mathassignment[x + 1]
        x++
    msg.send total

  robot.respond /divide (.*)/i, (msg) ->
    mathsign = msg.match[1]
    re = /\D+/
    mathassignment = mathsign.split(re)
    x = 0
    total = mathassignment[0]
    if mathassignment.length <= 1
      msg.send "I'm no fool. You can't divide a single number. Get on my level"
      return
    else
      while x < (mathassignment.length - 1)
        total = total / mathassignment[x + 1]
        x++
    msg.send total