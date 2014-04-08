module.exports = (robot) -> 
  robot.respond /cat/i, (msg) ->
    msg.send "They are horrible"

  robot.respond /dog/i, (msg) ->
    msg.send "Who let those [animals] out anyway?"

  robot.respond /(divide|subtract|add|multiply)(.*)/i, (msg) ->
    sign = msg.match[1]
    initial = msg.match[2]
    RegEx = /[-]?\d+/g
    ChosenMath = initial.match(RegEx)
    ChosenMath = ChosenMath.filter(Boolean)
    if ChosenMath.length <= 1
      msg.send "I'm no fool. You can't divide a single number. Get on my level"
      return
    x = 0
    total = 0
    switch sign
      when "divide"
        total = ChosenMath[0]
        while x < (ChosenMath.length - 1)
          total = total / ChosenMath[x + 1]
          x++
      when "subtract"
        total = ChosenMath[0]
        while x < (ChosenMath.length - 1)
          total = total - ChosenMath[x + 1]
          x++
      when "multiply"
        total = 1
        while x < (ChosenMath.length)
          if ChosenMath[x] == 0
            total = 0
          else
            total = total * ChosenMath[x]
            x++
      when "add"
        while x < (ChosenMath.length)
          total = total + parseInt(ChosenMath[x])
          x++
    msg.send total
  robot.respond /complement (.*)/i, (msg) ->
    target = msg.match[1]
    console.log(target)
    ComplementData = []
    fs = require("fs")
    fileName = "ComplementList.txt"
    fs.exists fileName, (exists) ->
      if exists
        fs.stat fileName, (error, stats) ->
          fs.open fileName, "r", (error, fd) ->
            buffer = new Buffer(stats.size)
            fs.read fd, buffer, 0, buffer.length, null, (error, bytesRead, buffer) ->
              data = buffer.toString("utf8", 0, buffer.length)
              ComplementData = data.split('\n')
              console.log(ComplementData[40])
              fs.close fd
      console.log(ComplementData[20])    