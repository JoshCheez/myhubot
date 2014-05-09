# Description:
#   Utility commands surrounding Hubot uptime.
#
# Commands:
#   hubot ping - Reply with pong
#   hubot echo <text> - Reply back with <text>
#   hubot time - Reply with current time
#   hubot die - End hubot process

module.exports = (robot) ->
  robot.respond /PING$/i, (msg) ->
    msg.send "PONG"

  robot.respond /ADAPTER$/i, (msg) ->
    msg.send robot.adapterName

  robot.respond /ECHO (.*)$/i, (msg) ->
    msg.send msg.match[1]

  robot.respond /TIME$/i, (msg) ->
    msg.send "Server time is: #{new Date()}"

  robot.respond /DIE$/i, (msg) ->
    console.log (msg.message.user.name)
    loaded = robot.brain.get 'TipsLoaded'
    EmployeeData = robot.brain.get 'TipData'
    if loaded is true and EmployeeData
      JSON_Data = JSON.stringify(EmployeeData);    
      fs = require("fs")
      fs.writeFile "Tipping.txt", JSON_Data, (err) ->
        throw err if err
        msg.send "It has been saved before death!"
    else 
      msg.send "There is nothing to save!"    
    if msg.message.user.name is "Josh"
      robot.brain.remove 'TipsLoaded'
      robot.brain.remove  'TipData'        
      msg.send "Goodbye, cruel world."
      process.exit 0
