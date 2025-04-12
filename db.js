const {Client} = require('pg')
require('dotenv').config()

let client

if (process.env.NODE_ENV === 'production') {
  // Production environment (Heroku)
  client = new Client({
    connectionString: process.env.DATABASE_URL,
    ssl: {
      rejectUnauthorized: false
    }
  });
} else {

    client = new Client({
    user: process.env.PG_USER,
    host: process.env.PG_HOST,
    database: process.env.PG_DATABASE,
    password: process.env.PG_PASSWORD,
    port: process.env.PG_PORT
    })
}

module.exports = client