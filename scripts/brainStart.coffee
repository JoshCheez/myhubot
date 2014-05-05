module.exports = (robot) -> 

  tiploaded = false
  TipData = {}
  Employee_Data = []
  robot.brain.on 'loaded', ->
    if tiploaded is true
      return
        
    console.log "bite me"
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


#  setInterval (->            
#    done = tiploaded
#    console.log(done)
#    if done is true
#      fs = require("fs")
#      robot.brain.set  'TipData', Employee_Data
#      console.log Employee_Data
#      fs.writeFile "Tipping.txt", Employee_Data, (err) ->
#
#        throw err if err
#        console.log "It is saved!"
#        return
#    else 
#      console.log "Not Loaded Yet"
#  ), 1000
