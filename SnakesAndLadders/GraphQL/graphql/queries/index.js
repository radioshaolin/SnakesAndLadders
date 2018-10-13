
const fs = require('fs');
const path = require('path');

module.exports.test = fs.readFileSync(path.join(__dirname, 'test.gql'), 'utf8');
