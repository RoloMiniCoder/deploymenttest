import db from '../persistence/db.js'

async function addItem(req, res) {
    const itemName = req.body.name
    const newItem = await db.addItem(itemName)
    res.send(newItem)
}

async function deleteItem(req, res) {
    await db.deleteItem(req.params.id)
    res.sendStatus(200)
}

async function getItems(req, res) {
    const items = await db.getAllItems();
    res.send(items)
}

async function updateItem(req, res) {
    await db.updateItem(req.params.id, {
        name: req.body.name,
        completed: req.body.completed
    })
    const item = await db.getItem(req.params.id)
    res.send(item)
}

export default { addItem, deleteItem, getItems, updateItem }
