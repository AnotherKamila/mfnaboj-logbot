log_analyzer = require './log_analyzer'

bots = { 'irc' }

for b of bots
    bots[b] = (require "./#{b}bot").bot log_analyzer.respond

console.log 'ready'
