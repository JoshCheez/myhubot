module.exports = (robot) -> 

  robot.brain.remove 'TipData'
  Employee_Data = []
  fs = require("fs")
  fileName = "Tipping.txt"
  TipData = {}
  fs.exists fileName, (exists) ->
    if exists
      fs.stat fileName, (error, stats) ->
         fs.open fileName, "r", (error, fd) ->
          buffer = new Buffer(stats.size)
          fs.read fd, buffer, 0, buffer.length, null, (error, bytesRead, buffer) ->
            Employee_Data = JSON.parse(buffer)
           # robot.brain.on 'loaded', ->
            console.log "IM LOADED"
            robot.brain.set  'TipData', Employee_Data
            tiploaded = true
            robot.brain.set 'DataLoaded', tiploaded
            fs.close fd       


  setInterval (->            
    done = robot.brain.get('DataLoaded')
    if done is true
      fs = require("fs")
      fs.writeFile "Tipping.txt", TipData, (err) ->
        throw err if err
        msg.send "It is saved!"
        return
    else 
      console.log "Not Loaded Yet"
  ), 1000
