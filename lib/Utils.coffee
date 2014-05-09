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

  Type_Of_Tips = [/burritos?/i, /poops?/i, /beers?/i, /cheezburgers?/i, /tacos?/i, /knife|knives/i]
  Type_Tips = ["Burrito", "Poop", "Beer", "Cheezburger", "Taco", "Knife"]    
  x = 0
  RegCompare = false;
  console.log Type_Of_Tips.length
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