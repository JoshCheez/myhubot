module.exports = (robot) -> 


  robot.respond /attack chzbot(.*)/i, (msg) ->
    x = 0
    delay = (time, fn) ->
      setTimeout fn, time 
    message_string =      
    message2 = 
    
    battle = 1
    ChzBotDead = 0
    JoshBotDead = 0

    ChzBotturn = 1
    JoshBotturn = 0
    
    new_line = "\n"    
    

    
    BattleScript = (attacktype, attacking_bot, defending_bot) ->
      console.log attacktype
      switch attacktype
        when "1"
          defending_bot.Health = defending_bot.Health - (attacking_bot.Dmg * 1.5)
          return (attacking_bot.Name + " critically hit " + defending_bot.Name + " for " + (attacking_bot.Dmg * 1.5) + " points of damage." + defending_bot.Name + " has " + defending_bot.Health + " hitpoints left!")
        when "2"
          defending_bot.Health = defending_bot.Health - attacking_bot.Dmg
          return (attacking_bot.Name + " critically hit " + defending_bot.Name + " for " + (attacking_bot.Dmg * 1.5) + " points of damage." + defending_bot.Name + " has " + defending_bot.Health + " hitpoints left!")
        when "3"
          defending_bot.Health = defending_bot.Health - attacking_bot.Dmg
          return (attacking_bot.Name + " critically hit " + defending_bot.Name + " for " + (attacking_bot.Dmg * 1.5) + " points of damage." + defending_bot.Name + " has " + defending_bot.Health + " hitpoints left!")        
        when "4"
          defending_bot.Health = defending_bot.Health - attacking_bot.Dmg
          return (attacking_bot.Name + " critically hit " + defending_bot.Name + " for " + (attacking_bot.Dmg * 1.5) + " points of damage." + defending_bot.Name + " has " + defending_bot.Health + " hitpoints left!")  
        when "5"
          defending_bot.Health = defending_bot.Health - (attacking_bot.Dmg * .5)
          return (attacking_bot.Name + " hit a glancing blow to " + defending_bot.Name + " for " + (attacking_bot.Dmg * .5) + " points of damage." + defending_bot.Name + " has " + defending_bot.Health + " hitpoints left!")          
        when "6"
          return (attacking_bot.Name + " has MISSED!")        
    JoshBot =
      Name: "JoshBot"
      Health: Math.floor((Math.random()*50)+15)
      Dmg: Math.floor((Math.random()*15)+5)
  
    ChzBot =
      Name: "ChzBot"
      Health: Math.floor((Math.random()*45)+15)
      Dmg: Math.floor((Math.random()*10)+5)
  
    message_string = ("JoshBot started with " + JoshBot.Health + " health and " + JoshBot.Dmg + " damage!")
    message_string += new_line
    message2 = ("ChzBot started with " + ChzBot.Health + " health and " + ChzBot.Dmg + " damage!")       
    message_string += message2
    message_string += new_line



      
    #Battle Script

   
    delay 1000, ->
      while battle is 1
       #ChzBot's Turn

        while ChzBotturn is 1 and battle isnt 0
          #Write ChzBot Attack Script	
          attack_type = Math.floor(Math.random() * 5) + 1          
          message2 = BattleScript attack_type, ChzBot, JoshBot
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
          attack_type = Math.floor(Math.random() * 5) + 1        
          message2 = BattleScript attack_type, JoshBot, ChzBot    
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