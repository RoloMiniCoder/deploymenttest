import express from 'express'
import todoRoutes from './routes/todoItems.js'
const app = express()

app.use(express.json());
app.use(express.static('static'));

app.get('/items', todoRoutes.getItems);
app.post('/items', todoRoutes.addItem)
app.put('/items/:id', todoRoutes.updateItem)
app.delete('/items/:id', todoRoutes.deleteItem)

app.listen(3000, () => console.log('Listening on port 3000'));
