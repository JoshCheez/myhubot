module.exports = (robot) -> 
  
  robot.respond /reply gif (.*)/i, (msg) ->
    search_term = msg.match[1]
    msg.http("http://replygif.net/api/gifs?tag=" + search_term + "&tag-operator=or&api-key=39YAprx5Yi")
      .get() (err, res, body) ->
        try
          json = JSON.parse(body)
          
          RandNum = Math.floor(Math.random()*json.length)
          msg.send json[RandNum].file
          
