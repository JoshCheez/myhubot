ComplementData = [3,4]
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
          fs.close fd