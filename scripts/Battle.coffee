module.exports = (robot) -> 


  robot.respond /attack chzbot(.*)/i, (msg) ->
    x = 0
    delay = (time, fn) ->
      setTimeout fn, time 
    message_string =      
    message2 = 
    new_line = "\n"    

    JoshBot =
      Health: Math.floor((Math.random()*50)+15)
      Dmg: Math.floor((Math.random()*15)+5)
  
    ChzBot =
      Health: Math.floor((Math.random()*45)+15)
      Dmg: Math.floor((Math.random()*10)+5)
  
    message_string = ("JoshBot started with " + JoshBot.Health + " health and " + JoshBot.Dmg + " damage!")
    message_string += new_line
    message2 = ("ChzBot started with " + ChzBot.Health + " health and " + ChzBot.Dmg + " damage!")       
    message_string += message2
    message_string += new_line



      
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
          #Write ChzBot Attack Script	
          JoshBot.Health = JoshBot.Health - ChzBot.Dmg
          message2 = ("ChzBot hit JoshBot for " + ChzBot.Dmg + " points of damage. JoshBot has " + JoshBot.Health + " hitpoints left!")      
          message_string += message2
          message_string += new_line          
          ChzBotturn = 0
          JoshBotturn = 1
          
        #When JoshBot Dies
        if JoshBot.Health <= 0
          JoshBotDead = 1
          battle = 0
          message2 = ("Chzbot has successfully slain JoshBot. May he rest in peace")      
          message_string += message2
          msg.send message_string

    
        #When ChzBot Dies
        if ChzBot.Health <= 0
          ChzBotDead = 1
          battle = 0
          message2 = ("JoshBot has successfully slain ChzBot. Three cheers for the victor!")  
          message_string += message2
          msg.send message_string
       
        #JoshBot's Turn
        while JoshBotturn is 1 and battle isnt 0
    
        #Write JoshBot Attack Script
          ChzBot.Health = ChzBot.Health - JoshBot.Dmg
          message2 = ("JoshBot hit ChzBot for " + JoshBot.Dmg + " points of damage. ChzBot has " + ChzBot.Health + " hitpoints left!")     
          message_string += message2
          message_string += new_line
          ChzBotturn = 1
          JoshBotturn = 0
      
        #When JoshBot Dies
        if JoshBot.Health <= 0 and battle isnt 0
          JoshBotDead = 1
          battle = 0
          message2 = ("Chzbot has successfully slain JoshBot. May he rest in peace")    
          message_string += message2
          msg.send message_string          

    
        #When ChzBot Dies
        if ChzBot.Health <= 0 and battle isnt 0
          ChzBotDead = 1
          battle = 0
          message2 = ("JoshBot has successfully slain ChzBot. Three cheers for the victor!")   
          message_string += message2
          msg.send message_string          