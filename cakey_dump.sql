-- Create the database
CREATE DATABASE IF NOT EXISTS cakey_test;

-- Switch to the database
USE cakey_test;

-- Drop existing tables if they exist to avoid conflicts
DROP TABLE IF EXISTS pastry_ingredient;
DROP TABLE IF EXISTS steps;
DROP TABLE IF EXISTS pastries;
DROP TABLE IF EXISTS recipes;
DROP TABLE IF EXISTS ingredients;

-- Create the ingredients table
CREATE TABLE IF NOT EXISTS ingredients (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description VARCHAR(255)
);

-- Create the recipes table
CREATE TABLE IF NOT EXISTS recipes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

-- Create the steps table
CREATE TABLE IF NOT EXISTS steps (
    id INT AUTO_INCREMENT PRIMARY KEY,
    description TEXT NOT NULL,
    timer INT NOT NULL,
    step_number INT NOT NULL,
    recipe_id INT,
    FOREIGN KEY (recipe_id) REFERENCES recipes(id)
);

-- Create the pastries table
CREATE TABLE IF NOT EXISTS pastries (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description VARCHAR(255) NOT NULL,
    image_url VARCHAR(255),
    recipe_id INT,
    FOREIGN KEY (recipe_id) REFERENCES recipes(id)
);

-- Create the pastry_ingredient association table
CREATE TABLE IF NOT EXISTS pastry_ingredient (
    pastry_id INT,
    ingredient_id INT,
    FOREIGN KEY (pastry_id) REFERENCES pastries(id),
    FOREIGN KEY (ingredient_id) REFERENCES ingredients(id)
);