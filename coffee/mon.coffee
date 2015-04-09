pyurl = "http://127.0.0.1:8080/cpu"

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
    msg.http("http://127.0.0.1:")
    .get() (err, res, body) ->
      slogan = body.replace /<.*?>/g, ""
      msg.send slogan unless err


