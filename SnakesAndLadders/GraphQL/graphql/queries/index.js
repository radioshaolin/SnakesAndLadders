
const fs = require('fs');
const path = require('path');

module.exports.players = fs.readFileSync(path.join(__dirname, 'players.gql'), 'utf8');
