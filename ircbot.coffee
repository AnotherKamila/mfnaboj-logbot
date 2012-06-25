irc = require 'irc'

[ network, channel, nick ] = [ "irc.freenode.net", "#mfnaboj", "logbot" ]

client = new irc.Client network, nick, channels: [ channel ]
client.on 'error', (err) -> console.error "ERROR: #{err.command} #{err.args.join ' '}"

exports.bot = (respond) ->
    client.on 'message', (from, to, message) ->
        console.log "#{from} => #{to}: #{message}"
        client.say (if to == channel then to else from), respond(message)
    client
