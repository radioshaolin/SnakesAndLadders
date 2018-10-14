
const fs = require('fs');
const path = require('path');

module.exports.createGame = fs.readFileSync(path.join(__dirname, 'createGame.gql'), 'utf8');
module.exports.startGame = fs.readFileSync(path.join(__dirname, 'startGame.gql'), 'utf8');
module.exports.joinGame = fs.readFileSync(path.join(__dirname, 'joinGame.gql'), 'utf8');
module.exports.completeGame = fs.readFileSync(path.join(__dirname, 'completeGame.gql'), 'utf8');
module.exports.startSession = fs.readFileSync(path.join(__dirname, 'startSession.gql'), 'utf8');
module.exports.register = fs.readFileSync(path.join(__dirname, 'register.gql'), 'utf8');
module.exports.makeTurn = fs.readFileSync(path.join(__dirname, 'makeTurn.gql'), 'utf8');
