module.exports = (robot) -> 
  robot.respond /cat/i, (msg) ->
    msg.send "They are horrible"

  robot.respond /dog/i, (msg) ->
    msg.send "#{msg.message.user.name}, Dog's are the worst"

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
  robot.respond /compliment (.*)/i, (msg) ->
    target = msg.match[1]
    ComplimentData = []
    fs = require("fs")
    fileName = "ComplimentList.txt"
    fs.exists fileName, (exists) ->
      if exists
        fs.stat fileName, (error, stats) ->
           fs.open fileName, "r", (error, fd) ->
            buffer = new Buffer(stats.size)
            fs.read fd, buffer, 0, buffer.length, null, (error, bytesRead, buffer) ->
              data = buffer.toString("utf8", 0, buffer.length)
              ComplimentData = data.split('\n')
              randomnum = ComplimentData[Math.floor(Math.random()*ComplimentData.length)]
              if target is "me"
                msg.send "#{msg.message.user.name}, " + randomnum
              else
                msg.send target + ", " + randomnum
              fs.close fd
              

  robot.respond /add compliment (.*)/i, (msg) ->
    comp = msg.match[1]
    fs = require("fs")
    fs.appendFile "ComplimentList.txt", "\r\n" + comp, (err) ->
      throw err if err
      msg.send "It is saved!"
      return

      
      
      
  robot.respond /attack chzbot(.*)/i, (msg) ->
    JoshBot =
      Health: Math.floor((Math.random()*50)+15)
      Dmg: Math.floor((Math.random()*15)+5)
  
    ChzBot =
      Health: Math.floor((Math.random()*45)+15)
      Dmg: Math.floor((Math.random()*10)+5)
  
    msg.send "JoshBot started with " + JoshBot.Health + " health and " + JoshBot.Dmg + " damage!"
    msg.send "ChzBot started with " + ChzBot.Health + " health and " + ChzBot.Dmg + " damage!"        
      
    setTimeout (->
#Battle Script
        battle = 1
        ChzBotDead = 0
        JoshBotDead = 0

        ChzBotturn = 1
        JoshBotturn = 0
        while battle is 1
          
          #ChzBot's Turn
          while ChzBotturn is 1
            
            #Write ChzBot Attack Script	
            JoshBot.Health = JoshBot.Health - ChzBot.Dmg
            msg.send ("ChzBot hit JoshBot for " + ChzBot.Dmg + " points of damage. JoshBot has " + JoshBot.Health + " hitpoints left!")
            ChzBotturn = 0
            JoshBotturn = 1
          
          #JoshBot's Turn
          while JoshBotturn is 1
            
            #Write JoshBot Attack Script
            ChzBot.Health = ChzBot.Health - JoshBot.Dmg
            msg.send ("JoshBot hit ChzBot for " + JoshBot.Dmg + " points of damage. ChzBot has " + ChzBot.Health + " hitpoints left!")
            ChzBotturn = 1
            JoshBotturn = 0
          
          #When JoshBot Dies
          if JoshBot.Health <= 0
            JoshBotDead = 1
            battle = 0
            msg.send ("Chzbot has successfully slain JoshBot. May he rest in peace")
          
          #When ChzBot Dies
          if ChzBot.Health <= 0
            ChzBotDead = 1
            battle = 0
            msg.send ("JoshBot has successfully slain ChzBot. Three cheers for the victor!")

    ), 3000     
  
    
    
  
  
  
  
  
  
  
  
  
  robot.hear /(.*)/i, (msg) ->
    if msg.envelope.user.name == "dgjng"
      msg.send("http://4.bp.blogspot.com/-iiccaFpk4bo/TqGYVhKl-DI/AAAAAAAADcs/BlBDtI_Jg9s/s1600/Picture-28.png#.png")
    