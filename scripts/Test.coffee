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
              randomnum = Math.floor(Math.random()*ComplimentData.length)
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
       

  robot.respond /bret bomb(.*)/i, (msg) ->
    new_line = "\n"   
  
    message_string = "http://i.imgur.com/SERXnhF.gif"
    message_string += new_line
    message_string += "http://i.imgur.com/SERXnhF.gif"
    message_string += new_line
    message_string += "http://i.imgur.com/5Gd83Sy.gif"
    message_string += new_line
    message_string += "http://i.imgur.com/5Gd83Sy.gif"
    message_string += new_line
    message_string += "http://i.imgur.com/VGHdphI.gif"
    message_string += new_line
    message_string += "http://i.imgur.com/SERXnhF.gif"
    msg.send message_string
    
  robot.hear /sad(.*)/i, (msg) ->
    msg.send "Cheer up! " + "http://i.imgur.com/ug4bv3J.gif"
    
  robot.respond /sandwich bomb(.*)/i, (msg) ->
    new_line = "\n"   
    randomnum = Math.floor(Math.random()*4)
    console.log randomnum
    if randomnum is 0
      message_string = "http://i.imgur.com/9uiCesi.jpg"
      message_string += new_line
      message_string += "http://i.imgur.com/RoV1abo.jpg"
      message_string += new_line
      message_string += "http://i.imgur.com/vuEwUMs.jpg"
      message_string += new_line
      message_string += "http://i.imgur.com/HRJEguE.jpg"
      message_string += new_line
      message_string += "http://i.imgur.com/fQYjE5f.jpg"
      message_string += new_line
      message_string += "http://i.imgur.com/CUse5nY.jpg"
      msg.send message_string    
    if randomnum is 1
      message_string = "http://i.imgur.com/9uiCesi.jpg"
      message_string += new_line
      message_string += "http://i.imgur.com/RoV1abo.jpg"
      message_string += new_line
      message_string += "http://i.imgur.com/vuEwUMs.jpg"
      message_string += new_line
      message_string += "http://i.imgur.com/HRJEguE.jpg"
      message_string += new_line
      message_string += "http://i.imgur.com/fQYjE5f.jpg"
      message_string += new_line
      message_string += "http://i.imgur.com/CUse5nY.jpg"
      msg.send message_string
    if randomnum is 2
      message_string = "http://i.imgur.com/9uiCesi.jpg"
      message_string += new_line
      message_string += "http://i.imgur.com/RoV1abo.jpg"
      message_string += new_line
      message_string += "http://i.imgur.com/vuEwUMs.jpg"
      message_string += new_line
      message_string += "http://i.imgur.com/HRJEguE.jpg"
      message_string += new_line
      message_string += "http://i.imgur.com/fQYjE5f.jpg"
      message_string += new_line
      message_string += "http://i.imgur.com/CUse5nY.jpg"
      msg.send message_string
    if randomnum is 3
      message_string = "http://i.imgur.com/xzehchs.jpg"
      message_string += new_line
      message_string += "http://i.imgur.com/Y9ZQ5ud.jpg"
      message_string += new_line
      message_string += "http://i.imgur.com/YiOvJt3.jpg"
      message_string += new_line
      message_string += "http://i.imgur.com/CIJfbOR.jpg"
      message_string += new_line
      message_string += "http://i.imgur.com/cNvwVxx.jpg"
      msg.send message_string
    
    
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
              if target is "me"
                msg.send "#{msg.message.user.name}, " + MorningData[randomnum]
              else
                msg.send target + ", " + MorningData[randomnum]
              fs.close fd       
 
      
  
  
