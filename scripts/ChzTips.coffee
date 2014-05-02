module.exports = (robot) -> 
  

  robot.hear /kill(.*)/i, (msg) ->
    msg.send "KILLING"
    robot.brain.remove 'TipData'
  

  robot.respond /tip (.*)/i, (msg) ->
    answers = msg.match[1]
    reg = /\s/g
    transfer_data = answers.split(/\s+/g)
    Tips = robot.brain.get('TipData')
    dataloaded = robot.brain.get('DataLoaded')
    msg.send Tips.Names.Josh.Burrito
    if dataloaded is false 
      console.log "Tips is Null"
    else  
      msg.send "Tips is here!"

      