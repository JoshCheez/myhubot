
module.exports = (robot) ->

  robot.respond /test me(.*)/i, (msg) ->
    Doge_Key = ""
    Doge_Action = "get_balance"
    msg.http("https://www.dogeapi.com/wow/v2/?api_key={" + Doge_Key + "}&a=" + Doge_Action)
      .get() (err, res, body) ->
        try
          json = JSON.parse(body)
          msg.send json
 

