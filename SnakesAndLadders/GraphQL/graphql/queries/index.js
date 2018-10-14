
const fs = require('fs');
const path = require('path');

module.exports.me = fs.readFileSync(path.join(__dirname, 'me.gql'), 'utf8');
module.exports.getLastGameWaitingForPlayers = fs.readFileSync(path.join(__dirname, 'getLastGameWaitingForPlayers.gql'), 'utf8');
module.exports.getLastTurn = fs.readFileSync(path.join(__dirname, 'getLastTurn.gql'), 'utf8');
