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


-- Insert sample data into ingredients
INSERT INTO ingredients (name, description) VALUES
('Flour', 'All-purpose flour'),
('Sugar', 'Granulated sugar'),
('Butter', 'Unsalted butter'),
('Eggs', 'Large eggs'),
('Chocolate Chips', 'Semisweet chocolate chips'),
('Baking Soda', 'Baking soda for leavening'),
('Salt', 'Table salt'),
('Vanilla Extract', 'Pure vanilla extract'),
('Cocoa Powder', 'Unsweetened cocoa powder'),
('Milk', 'Whole milk'),
('Yeast', 'Active dry yeast');

-- Insert sample data into recipes
INSERT INTO recipes (name) VALUES
('Chocolate Chip Cookie Recipe'),
('Chocolate Cake Recipe'),
('Cinnamon Roll Recipe');

-- Insert sample data into steps with step_number
INSERT INTO steps (description, timer, step_number, recipe_id) VALUES
-- Chocolate Chip Cookie Recipe Steps
('Preheat oven to 350 degrees F (175 degrees C).', 10, 1, 1),
('Cream together the butter, white sugar, and brown sugar until smooth.', 10, 2, 1),
('Beat in the eggs one at a time, then stir in the vanilla.', 5, 3, 1),
('Dissolve baking soda in hot water. Add to the batter along with salt.', 5, 4, 1),
('Stir in flour and chocolate chips.', 5, 5, 1),
('Drop by large spoonfuls onto ungreased pans.', 5, 6, 1),
('Bake for about 10 minutes, or until edges are nicely browned.', 10, 7, 1),

-- Chocolate Cake Recipe Steps
('Preheat oven to 350 degrees F (175 degrees C).', 10, 1, 2),
('Grease and flour two nine-inch round pans.', 5, 2, 2),
('In a large bowl, stir together the sugar, flour, cocoa, baking powder, baking soda, and salt.', 10, 3, 2),
('Add the eggs, milk, oil, and vanilla, mix for 2 minutes on medium speed of mixer.', 5, 4, 2),
('Pour into the prepared pans.', 5, 5, 2),
('Bake for 30 to 35 minutes in the preheated oven.', 35, 6, 2),
('Cool for 10 minutes before removing from pans to cool completely.', 10, 7, 2),

-- Cinnamon Roll Recipe Steps
('Dissolve yeast in warm milk in a large bowl.', 10, 1, 3),
('Add sugar, butter, salt, eggs, and flour. Mix well.', 10, 2, 3),
('Knead the dough into a large ball, using your hands dusted lightly with flour.', 5, 3, 3),
('Put in a bowl, cover and let rise in a warm place about 1 hour, or until doubled in size.', 60, 4, 3),
('Roll the dough out on a lightly floured surface.', 5, 5, 3),
('Spread melted butter all over the dough.', 5, 6, 3),
('Mix sugar and cinnamon and sprinkle over buttered dough.', 5, 7, 3),
('Roll up dough and cut into 12 rolls.', 5, 8, 3),
('Place rolls in a lightly greased 9x13 inch baking pan.', 5, 9, 3),
('Bake rolls in preheated oven until golden brown, about 30 minutes.', 30, 10, 3),
('Spread frosting on warm rolls before serving.', 5, 11, 3);

-- Insert sample data into pastries
INSERT INTO pastries (name, description, image_url, recipe_id) VALUES
('Chocolate Chip Cookies', 'Classic cookies with chocolate chips.', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRmv5FKDmnactNtxaIzHqKP_cIirqdDd5NgMg&s', 1),
('Chocolate Cake', 'Rich and moist chocolate cake.', 'https://cakesbymk.com/wp-content/uploads/2023/05/Template-Size-for-Blog-Photos-25-1203x1536.jpg', 2),
('Cinnamon Rolls', 'Soft and fluffy cinnamon rolls.', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTT-LI72CKRoE6s-uuHspVQ9Al9t7K7X2Ok7g&s', 3);

-- Insert sample data into pastry_ingredient
INSERT INTO pastry_ingredient (pastry_id, ingredient_id) VALUES
-- Chocolate Chip Cookies Ingredients
(1, 1), -- Flour
(1, 2), -- Sugar
(1, 3), -- Butter
(1, 4), -- Eggs
(1, 5), -- Chocolate Chips
(1, 6), -- Baking Soda
(1, 7), -- Salt
(1, 8), -- Vanilla Extract

-- Chocolate Cake Ingredients
(2, 1), -- Flour
(2, 2), -- Sugar
(2, 4), -- Eggs
(2, 7), -- Salt
(2, 8), -- Vanilla Extract
(2, 9), -- Cocoa Powder
(2, 10), -- Milk

-- Cinnamon Rolls Ingredients
(3, 1), -- Flour
(3, 2), -- Sugar
(3, 3), -- Butter
(3, 4), -- Eggs
(3, 7), -- Salt
(3, 10), -- Milk
(3, 11); -- Yeast
