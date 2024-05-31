-- Create the database
CREATE DATABASE IF NOT EXISTS cakey;

-- Switch to the database
USE cakey;

-- Create the pastries table
CREATE TABLE IF NOT EXISTS pastries (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description VARCHAR(255) NOT NULL,
    image_url VARCHAR(255),
    recipe JSON
);

-- Create the ingredients table
CREATE TABLE IF NOT EXISTS ingredients (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description VARCHAR(255)
);