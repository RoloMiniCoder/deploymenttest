-- Create the 'todo' database
CREATE DATABASE todo;

-- Connect to the 'todo' database
\c todo;

-- Create the 'todo_items' table
CREATE TABLE todo_items (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    completed BOOLEAN
);

-- Display the structure of the 'todo_items' table
\d todo_items;
