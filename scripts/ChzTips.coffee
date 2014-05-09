module.exports = (robot) -> 
  
  robot.hear /kill (.*)/i, (msg) ->
    test = robot.brain.get('TipData')
    console.log test
    #robot.brain.remove 'TipData'

  
#add a robot.hear /tip help to show all the options.

  robot.respond /tip (.*)/i, (msg) ->
    Tip_Info = robot.brain.get('TipData')        

    Type_Of_Tips = [/burritos?/i, /poops?/i, /beers?/i, /cheezburgers?/i, /tacos?/i, /knife|knives/i]
    

    reg = /\s+/g
    
   #array holding the receiver's name[0], amount [1], and type [2] 
    transfer_data = msg.match[1].split(/\s+/g)

    CheckValidUser = (giver, receiver) ->
      #console.log Tip_Info.People
      x = 0
      y = 0
      while x <  (Tip_Info.People.length)
        if giver is (Tip_Info.People[x].Name.toLowerCase())
          #console.log "FOUND giver"
          break
        else
          #console.log "NOT FOUND giver"
        x++
      if x is 7
       x = -1
      while y <  (Tip_Info.People.length)
        if receiver is (Tip_Info.People[y].Name.toLowerCase())
          #console.log "FOUND receiver"
          break
        else
          #console.log "NOT FOUND receiver"
        y++ 
      if y is Tip_Info.People.length
       y = -1        
      return giverloc:x, receiverloc:y
    
    CheckValidTip = (TipType) ->  
      Type_Tips = ["Burrito", "Poop", "Beer", "Cheezburger", "Taco", "Knife"]    
      x = 0
      RegCompare = false
      #console.log Type_Of_Tips.length
      while x < Type_Of_Tips.length
        RegCompare = Type_Of_Tips[x].test(TipType.toLowerCase())      
        if RegCompare is true
          console.log "Tip Type found!"
          break
        else
          console.log "Tip Type not found!"
        x++
      if RegCompare is true
       return Type_Tips[x]
      else 
       return -1
    
    GiveTip = (giver, receiver, tipamount, tiptype) ->
      tipamount = parseFloat(tipamount)
      Tip_To_Int = parseFloat(Tip_Info.People[receiver][tiptype])
      Giving_Tip_To_Int = parseFloat(tipamount)
      Tip_Info.People[receiver][tiptype] += Giving_Tip_To_Int    
      msg.send (Tip_Info.People[giver].Name + " has successfully given " + Tip_Info.People[receiver].Name + " " + tipamount + " " + tiptype)       
      SaveTip()
    
    SaveTip = () ->
      loaded = robot.brain.get 'TipsLoaded'
      EmployeeData = robot.brain.get 'TipData'
      if loaded is true and EmployeeData
         JSON_Data = JSON.stringify(EmployeeData);    
         fs = require("fs")
         fs.writeFile "Tipping.txt", JSON_Data, (err) ->
           throw err if err
           console.log "Data has been saved to file"
       else 
         console.log "There is nothing to save!"
    
    
    if transfer_data[0] and transfer_data[1] and transfer_data[2]
      giving_user = msg.message.user.name.toLowerCase()
      console.log (giving_user + "give")
      receiving_user = transfer_data[0].toLowerCase()
      initialtipamount = parseFloat(transfer_data[1])
      initialtiptype = transfer_data[2].toLowerCase()
      locations = CheckValidUser giving_user, receiving_user
      if locations.giverloc isnt -1 and locations.receiverloc isnt -1
        if locations.giverloc is locations.receiverloc
          msg.send "You can't give yourself tips."
        else
          if initialtipamount % 1 is 0 and initialtipamount > 0
            console.log "Whole Number"
            validtip = CheckValidTip transfer_data[2]
            console.log validtip
            if validtip is -1 
              msg.send "Please enter a valid tip type!"
            else 
              console.log "correct tip!"
              GiveTip locations.giverloc, locations.receiverloc, initialtipamount, validtip            
          else
            msg.send "Please enter a valid number (no decimals and > 0)"

      else
        msg.send "Please enter a valid user"
     
    else
      msg.send "Enter the user name that you want to tip as well and the amount and type (tip Josh 100 beers)"

  robot.respond /save tips(.*)/i, (msg) ->
    loaded = robot.brain.get 'TipsLoaded'
    console.log loaded
    EmployeeData = robot.brain.get 'TipData'
    if loaded is true and EmployeeData
      JSON_Data = JSON.stringify(EmployeeData);    
      console.log JSON_Data
      fs = require("fs")
      fs.writeFile "Tipping.txt", JSON_Data, (err) ->
        throw err if err
        msg.send "It has been saved!"
    else 
      console.log "There is nothing to save!"
      
      
      
  robot.respond /how many ([^; ]*) does ([^; ]*) have?(.*)/i, (msg) ->

    Types_Of_Tips = [/burritos?/i, /poops?/i, /beers?/i, /cheezburgers?/i, /tacos?/i, /knife|knives/i]  
    console.log "here"
    Tips_Info = robot.brain.get('TipData')        
    CheckValidUser2 = (giver, receiver) ->
      x = 0
      y = 0
      while x <  (Tips_Info.People.length)
        if giver is (Tips_Info.People[x].Name.toLowerCase())
          #console.log "FOUND giver"
          break
        else
          #console.log "NOT FOUND giver"
        x++
      if x is 7
       x = -1
      while y <  (Tips_Info.People.length)
        if receiver is (Tips_Info.People[y].Name.toLowerCase())
          #console.log "FOUND receiver"
          break
        else
          #console.log "NOT FOUND receiver"
        y++ 
      if y is Tips_Info.People.length
       y = -1        
      return giverloc:x, receiverloc:y
      
      
    CheckValidTip2 = (TipType) ->  
   
      Types_Tips = ["Burrito", "Poop", "Beer", "Cheezburger", "Taco", "Knife"]    
      x = 0
      RegCompare = false
      while x < Types_Of_Tips.length
        RegCompare = Types_Of_Tips[x].test(TipType.toLowerCase())      
        if RegCompare is true
          #console.log "Tip Type found!"
          break
        else
          #console.log "Tip Type not found!"
        x++
      if RegCompare is true
       return Types_Tips[x]
      else 
       return -1
    gi = msg.message.user.name   
    tipstype = msg.match[1]    
    re = msg.match[2]    
    #Utils = require('C:\Users\Josh\HuBot\myhubot\lib/Utils.coffee').CheckValidTip tipstype      
    #console.log Utils    
    sValidTip = CheckValidTip2 tipstype       
    sValidUser = CheckValidUser2 gi, re
    if sValidUser.receiverloc is -1
      msg.send "Please enter a valid user"
    else
      if sValidTip is -1
        msg.send "Please enter a valid tip"
      else
        msg.send (Tips_Info.People[sValidUser.receiverloc].Name + " has " + Tips_Info.People[sValidUser.receiverloc][sValidTip] + " " + tipstype)
    