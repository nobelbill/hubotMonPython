module.exports = (robot) ->
  robot.respond /PING$/i, (msg) ->
    msg.send "PONG"

  robot.respond /ADAPTER$/i, (msg) ->
    msg.send robot.adapterName

  robot.respond /ECHO (.*)$/i, (msg) ->
    msg.send msg.match[1]

  robot.respond /TIME$/i, (msg) ->
    msg.send "Server time is: #{new Date()}"

  robot.respond /DIE$/i, (msg) ->
    msg.send "Goodbye, cruel world."
    process.exit 0

  robot.respond /MON$/i, (msg) ->
    msg.send "python mon"

  robot.respond /CPU$/i, (msg) ->
    msg.http("http://127.0.0.1:5000/cpu")
    .get() (err, res, body) ->
      slogan = body
      msg.send slogan

  robot.respond /MEMORY$/i, (msg) ->
    msg.http("http://127.0.0.1:5000/memory")
    .get() (err, res, body) ->
      slogan = body
      msg.send slogan


  robot.respond /BOOK$/i, (msg) ->
    msg.http("http://127.0.0.1:5000/book")
    .get() (err, res, body) ->
      slogan = body
      msg.send slogan