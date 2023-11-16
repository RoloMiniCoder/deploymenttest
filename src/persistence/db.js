import pg from 'pg'
import dotenv from 'dotenv'

dotenv.config()
const { Client } = pg
const client = new Client({
    database: process.env.DB_NAME,
    user: process.env.DB_USER,
    host: process.env.DB_HOST,
    password: process.env.DB_PASSWORD
})

await client.connect().catch(err => {
    console.log(err)
    console.log('DATABASE CONNECTION FAILED')
    process.exit(1)
})

async function addItem(name) {
    const response = await client.query('INSERT INTO todo_items (name) VALUES ($1) RETURNING *', [name])
    return response.rows[0]
}

async function getItem(id) {
    const response = await client.query('SELECT * FROM todo_items WHERE id=$1', [id])
    return response.rows[0] || null
}

async function getAllItems() {
    const response = await client.query('SELECT * FROM todo_items')
    return response.rows
}

async function updateItem(id, item) {
    return await client.query('UPDATE todo_items SET name=$1, completed=$2 WHERE id=$3', [item.name, item.completed, id])
}

async function deleteItem(id) {
    return await client.query('DELETE FROM todo_items WHERE id=$1', [id])
}

export default { getItem, getAllItems, addItem, updateItem, deleteItem }
