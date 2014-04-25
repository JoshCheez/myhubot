module.exports = (robot) -> 

    
  robot.respond /tip (.*)/i, (msg) ->
    answers = msg.match[1]
    reg = /\s/g
    split = answers.split(/\s+/g)

    Employee_Data = []
    fs = require("fs")
    fileName = "Tipping.json"
    fs.exists fileName, (exists) ->
      if exists
        fs.stat fileName, (error, stats) ->
           fs.open fileName, "r", (error, fd) ->
            buffer = new Buffer(stats.size)
            fs.read fd, buffer, 0, buffer.length, null, (error, bytesRead, buffer) ->
              Employee_Data = JSON.parse(buffer)
              msg.send Employee_Data.Names.Josh.Burrito
              fs.close fd