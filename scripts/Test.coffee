# Commands:
#   JoshBot giphy me <search term> - grabs a random gif from the search term.
#   JoshBot chz me <search item> - grabs a random gif from cheezburger
#   JoshBot divide - divide
#   JoshBot subtract - subracts
#   JoshBot add - adds
#   JoshBot multiply - multiplies
#   JoshBot compliment me (or a User) - compliments a user
#   JoshBot add compliment - add a compliment to the compliment list
#   JoshBot insult me (or a User) - insults a user
#   JoshBot add insult - adds an insult to the insult list




module.exports = (robot) -> 

    
  robot.respond /giphy me(.*)/i, (msg) ->
    search_term = msg.match[1]
    msg.http("http://api.giphy.com/v1/gifs/search?q=" + search_term + "&api_key=dc6zaTOxFJmzC&limit=15")
      .get() (err, res, body) ->
        try
          json = JSON.parse(body)
          RandNum = Math.floor(Math.random()*json.data.length)
          msg.send json.data[RandNum].images.fixed_height.url
     


  robot.respond /chz me(.*)/i, (msg) ->
    searched_term = msg.match[1]
    msg.http("http://search.cheezburger.com/api/search?q=" + searched_term + "%20type:gif")    
      .get() (err, res, body) ->
        try
          json = JSON.parse(body)
          RandNum = Math.floor(Math.random()*json.models.length)
          msg.send json.models[RandNum].url + ".gif"
         

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
    target = msg.envelope.user.name
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
              randomnum = Math.floor(Math.random()*ComplimentData.length)
              console.log(randomnum)
              if target is "me"
                msg.send "#{msg.message.user.name}, " + ComplimentData[randomnum]
              else
                msg.send target + ", " + ComplimentData[randomnum]
              fs.close fd
              

  robot.respond /add compliment (.*)/i, (msg) ->
    comp = msg.match[1]
    fs = require("fs")
    fs.appendFile "ComplimentList.txt", "\r\n" + comp, (err) ->
      throw err if err
      msg.send "It is saved!"
      return

      
  robot.respond /insult (.*)/i, (msg) ->
    target = msg.match[1]
    InsultData = []
    fs = require("fs")
    fileName = "InsultList.txt"
    fs.exists fileName, (exists) ->
      if exists
        fs.stat fileName, (error, stats) ->
           fs.open fileName, "r", (error, fd) ->
            buffer = new Buffer(stats.size)
            fs.read fd, buffer, 0, buffer.length, null, (error, bytesRead, buffer) ->
              data = buffer.toString("utf8", 0, buffer.length)
              InsultData = data.split('\n')
              randomnum = InsultData[Math.floor(Math.random()*InsultData.length)]
              if target is "me"
                msg.send "#{msg.message.user.name}, " + randomnum
              else
                msg.send target + ", " + randomnum
              fs.close fd 


  robot.respond /add insult (.*)/i, (msg) ->
    comp = msg.match[1]
    fs = require("fs")
    fs.appendFile "InsultList.txt", "\r\n" + comp, (err) ->
      throw err if err
      msg.send "It is saved!"
      return      


      
  robot.hear /good morning(.*)/i, (msg) ->
    target = msg.envelope.user.name
    MorningData = []
    fs = require("fs")
    fileName = "MorningList.txt"
    fs.exists fileName, (exists) ->
      if exists
        fs.stat fileName, (error, stats) ->
           fs.open fileName, "r", (error, fd) ->
            buffer = new Buffer(stats.size)
            fs.read fd, buffer, 0, buffer.length, null, (error, bytesRead, buffer) ->
              data = buffer.toString("utf8", 0, buffer.length)
              MorningData = data.split('\n')
              randomnum = Math.floor(Math.random()*MorningData.length)
              console.log(randomnum)
              if target is "me"
                msg.send "#{msg.message.user.name}, " + MorningData[randomnum]
              else
                msg.send target + ", " + MorningData[randomnum]
              fs.close fd       
 
      
  
  
  robot.respond /attack chzbot(.*)/i, (msg) ->
    delay = (time, fn) ->
      setTimeout fn, time  
    message = []
    JoshBot =
      Health: Math.floor((Math.random()*50)+15)
      Dmg: Math.floor((Math.random()*15)+5)
  
    ChzBot =
      Health: Math.floor((Math.random()*45)+15)
      Dmg: Math.floor((Math.random()*10)+5)
  
    message.push ("JoshBot started with " + JoshBot.Health + " health and " + JoshBot.Dmg + " damage!")
    message.push ("ChzBot started with " + ChzBot.Health + " health and " + ChzBot.Dmg + " damage!")       


      
    #Battle Script
    battle = 1
    ChzBotDead = 0
    JoshBotDead = 0

    ChzBotturn = 1
    JoshBotturn = 0
   
    delay 1000, ->
      while battle is 1
       #ChzBot's Turn

        while ChzBotturn is 1 and battle isnt 0
          console.log (message)
          #Write ChzBot Attack Script	
          JoshBot.Health = JoshBot.Health - ChzBot.Dmg
          message.push ("ChzBot hit JoshBot for " + ChzBot.Dmg + " points of damage. JoshBot has " + JoshBot.Health + " hitpoints left!")
          ChzBotturn = 0
          JoshBotturn = 1
          
        #When JoshBot Dies
        if JoshBot.Health <= 0
          JoshBotDead = 1
          battle = 0
          message.push ("Chzbot has successfully slain JoshBot. May he rest in peace")
          msg.send message...
    
        #When ChzBot Dies
        if ChzBot.Health <= 0
          ChzBotDead = 1
          battle = 0
          message.push ("JoshBot has successfully slain ChzBot. Three cheers for the victor!")
          msg.send message...
       
        #JoshBot's Turn
        while JoshBotturn is 1 and battle isnt 0
    
        #Write JoshBot Attack Script
          ChzBot.Health = ChzBot.Health - JoshBot.Dmg
          message.push ("JoshBot hit ChzBot for " + JoshBot.Dmg + " points of damage. ChzBot has " + ChzBot.Health + " hitpoints left!")
          ChzBotturn = 1
          JoshBotturn = 0
      
        #When JoshBot Dies
        if JoshBot.Health <= 0 and battle isnt 0
          JoshBotDead = 1
          battle = 0
          message.push ("Chzbot has successfully slain JoshBot. May he rest in peace")
          msg.send message...
    
        #When ChzBot Dies
        if ChzBot.Health <= 0 and battle isnt 0
          ChzBotDead = 1
          battle = 0
          message.push ("JoshBot has successfully slain ChzBot. Three cheers for the victor!")
          msg.send message...
