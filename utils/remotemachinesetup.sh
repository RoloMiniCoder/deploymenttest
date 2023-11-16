#!/bin/bash

# Update package list
sudo apt-get update

# Install PostgreSQL and Git
sudo apt-get install -y postgresql postgresql-contrib git

# Install Node.js and npm
curl -fsSL https://deb.nodesource.com/setup_14.x | sudo -E bash -
sudo apt-get install -y nodejs

# Clone the repository (replace REPO_URL with the actual URL)
git clone REPO_URL

# Navigate to the repository directory
cd your_repository_directory

# Install project dependencies
npm install

# Create PostgreSQL database and user (replace DB_NAME, DB_USER, and DB_PASSWORD)
sudo -u postgres psql -c "CREATE DATABASE DB_NAME;"
sudo -u postgres psql -c "CREATE USER DB_USER WITH PASSWORD 'DB_PASSWORD';"
sudo -u postgres psql -c "ALTER ROLE DB_USER SET client_encoding TO 'utf8';"
sudo -u postgres psql -c "ALTER ROLE DB_USER SET default_transaction_isolation TO 'read committed';"
sudo -u postgres psql -c "ALTER ROLE DB_USER SET timezone TO 'UTC';"
sudo -u postgres psql -c "GRANT ALL PRIVILEGES ON DATABASE DB_NAME TO DB_USER;"

# Run SQL script to create tables and schema (replace SCRIPT_NAME.sql)
psql -h localhost -U DB_USER -d DB_NAME -a -f SCRIPT_NAME.sql

# Run the Node.js application
npm start
