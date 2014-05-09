module.exports = (robot) -> 

  tiploaded = false
  flags = 0
  JSON_Data = 
  TipData = {}
  console.log tiploaded
  Employee_Data = []
  robot.brain.on 'loaded', ->
    if tiploaded is true
      return
        
    robot.brain.remove 'TipData'
    fs = require("fs")
    fileName = "Tipping.txt"
    fd = null
    fs.exists fileName, (exists) ->
      if exists
        fs.stat fileName, (error, stats) ->
          fs.open fileName, "r", (error, fd) ->
            buffer = new Buffer(stats.size)
            fs.read fd, buffer, 0, buffer.length, null, (error, bytesRead, buffer) ->
              
              Employee_Data = JSON.parse(buffer)

              console.log "IM LOADED"
              tiploaded = true
              fs.close fd 

              
  interval =  setInterval (->                           
    while tiploaded is true and flags is 0
      console.log ("flag is " + flags)
      flags = 1  
      robot.brain.set 'TipsLoaded', tiploaded
      robot.brain.set  'TipData', Employee_Data
      clearInterval(interval)
  ), 500
  
