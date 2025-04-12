const express = require('express')
const client = require('./db')
const app = express()
app.use(express.json())
require('dotenv').config()

client.connect()
  .then(() => {
    console.log('Connected to PostgreSQL');
    // Start your server or perform database operations here
  })
  .catch(err => {
    console.error('Connection error', err.stack);
  })

const PORT = process.env.PORT || 3000

app.listen(PORT, () => {
    console.log('Server running on localhost:3000')
})

const checkTableNames = async () => {
    const res = await client.query(`
        SELECT table_name
        FROM information_schema.tables
        WHERE table_schema = 'public'
          AND table_type = 'BASE TABLE';
      `);
      console.log('Tables in the public schema:');
      res.rows.forEach(row => console.log(row.table_name));
}

checkTableNames()

app.post('/register/', async (request, response) => {
    const {name, email, phone, gender, experience, skills} = request.body


    const dbUser = await client.query(
        `SELECT
            *
        FROM
            user_info
        WHERE
            name = $1;
    `, [name]
    );

    console.log(dbUser)
    if (dbUser.rows.length === 0) {
        await client.query(
            `INSERT INTO user_info (
                name, phone, email, gender, experience, skills
            )
            VALUES ($1, $2, $3, $4, $5, $6);`, [name, phone, email, gender, experience, skills]
        );
        response.status(200)
        response.send('User registered successfully')
    } else {
        response.status(400)
        response.send('User already exists')
    }
})

app.get('/', async (request, response) => {
    let {page, gender='', skills='', experience} = request.query
    let offset = 0
    
    console.log(experience)

    if(parseInt(page) > 1) {
        offset = (((page || 1)) * 5) - 1
    }

    if (experience==='') {
        experience=null
    }


    try {
    const result = await client.query(
        `SELECT 
            *
        FROM
            user_info
        WHERE
            (gender = COALESCE(NULLIF($1, ''), gender)) 
            AND (skills LIKE COALESCE(NULLIF($2, ''), skills))
            AND (experience = COALESCE($3::INTEGER, experience))
        ORDER BY
            id
        LIMIT
            5 
        OFFSET
            $4;
        `, [gender, skills, experience, offset]
    )

    response.status(200)
    response.send(result.rows)
    } catch (err) {
        console.log(`${err}`)
        response.status(400)
    }
})