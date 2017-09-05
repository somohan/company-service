var merge = require('webpack-merge')
var prodEnv = require('./prod.env')

module.exports = merge(prodEnv, {
  NODE_ENV: '"development"',
  //API_ENDPOINT: "http://localhost:4567/"
  API_ENDPOINT: "\"" + process.env.API_ENDPOINT + "\""
})
