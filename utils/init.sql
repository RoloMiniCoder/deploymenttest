-- Create the database
CREATE DATABASE todo;

-- Connect to the new database
\c todo;

-- Create tables and perform any other setup
DROP TABLE IF EXISTS todo_items;
CREATE TABLE IF NOT EXISTS todo_items (id SERIAL PRIMARY KEY, name VARCHAR(255), completed BOOLEAN DEFAULT false);
INSERT INTO todo_items (name) VALUES ('first task');
INSERT INTO todo_items (name, completed) VALUES ('second task', true);
