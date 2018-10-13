
const fs = require('fs');
const path = require('path');

module.exports.createGame = fs.readFileSync(path.join(__dirname, 'createGame.gql'), 'utf8');
module.exports.joinGame = fs.readFileSync(path.join(__dirname, 'joinGame.gql'), 'utf8');
module.exports.createPlayer = fs.readFileSync(path.join(__dirname, 'createPlayer.gql'), 'utf8');
