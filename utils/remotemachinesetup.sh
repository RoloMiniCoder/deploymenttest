#!/bin/bash

# Update package list
sudo apt-get update

# Install PostgreSQL and Git
sudo apt-get install -y postgresql postgresql-contrib git

# Install Node.js and npm
curl -fsSL https://deb.nodesource.com/setup_14.x | sudo -E bash -
sudo apt-get install -y nodejs

# Clone the repository
git clone https://github.com/RoloMiniCoder/deploymenttest.git

# Navigate to the repository directory
cd deploymenttest

# Install project dependencies
npm install

# Create PostgreSQL database and user
sudo -u postgres psql -c "CREATE DATABASE todo;"
sudo -u postgres psql -c "CREATE USER myuser WITH PASSWORD 'secret';"
sudo -u postgres psql -c "ALTER ROLE myuser SET client_encoding TO 'utf8';"
sudo -u postgres psql -c "ALTER ROLE myuser SET default_transaction_isolation TO 'read committed';"
sudo -u postgres psql -c "ALTER ROLE myuser SET timezone TO 'UTC';"
sudo -u postgres psql -c "GRANT ALL PRIVILEGES ON DATABASE todo TO myuser;"

# Run SQL script to create tables and schema (replace SCRIPT_NAME.sql)
psql -h localhost -U myuser -d todo -a -f ./init.sql

# Run the Node.js application
npm start
