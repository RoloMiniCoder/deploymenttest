DROP TABLE IF EXISTS todo_items;
CREATE TABLE IF NOT EXISTS todo_items (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    completed BOOLEAN DEFAULT false
)
