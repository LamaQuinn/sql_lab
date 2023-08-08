-- Create Users table
CREATE TABLE Users (
    id SERIAL PRIMARY KEY,
    email VARCHAR(20),
    username VARCHAR(20),
    password VARCHAR(100),
    profile_picture VARCHAR(400)
);

-- Create Recipe table
CREATE TABLE Recipe (
    id SERIAL PRIMARY KEY,
    instructions VARCHAR(4000),
    public_private BOOLEAN,
    recipe_title VARCHAR(100),
    users_id INTEGER REFERENCES Users(id)
);

-- Create Ingredients table
CREATE TABLE Ingredients (
    id SERIAL PRIMARY KEY,
    list_ingredients VARCHAR(500)
);

-- Create recipe_ingredients table
CREATE TABLE recipe_ingredients (
    id SERIAL PRIMARY KEY,
    recipe_id INTEGER REFERENCES Recipe(id),
    ingredients_id INTEGER REFERENCES Ingredients(id)
);

-- Create Recipe_photos table
CREATE TABLE Recipe_photos (
    id SERIAL PRIMARY KEY,
    photo_url VARCHAR(400),
    recipe_id INTEGER REFERENCES Recipe(id)
);

-- Create Views table
CREATE TABLE Views (
    id SERIAL PRIMARY KEY,
    recipe_id INTEGER REFERENCES Recipe(id)
);

-- Create Tags table
CREATE TABLE Tags (
    id SERIAL PRIMARY KEY,
    tag VARCHAR(30)
);

-- Create Recipe_Tags table
CREATE TABLE Recipe_Tags (
    id SERIAL PRIMARY KEY,
    tags_id INTEGER REFERENCES Tags(id),
    recipe_id INTEGER REFERENCES Recipe(id)
);

-- Create Grocery table
CREATE TABLE Grocery (
    id SERIAL PRIMARY KEY,
    user_id INTEGER REFERENCES Users(id),
    recipe_ingredients_id INTEGER REFERENCES recipe_ingredients(id)
);

-- Create Occasion table
CREATE TABLE Occasion (
    id SERIAL PRIMARY KEY,
    name VARCHAR
);

-- Create Occasion_recipes table
CREATE TABLE Occasion_recipes (
    id SERIAL PRIMARY KEY,
    occasion_id INTEGER REFERENCES Occasion(id),
    recipe_id INTEGER REFERENCES Recipe(id)
);


INSERT INTO Users (email, username, password, profile_picture)
VALUES
    ('user1@example.com', 'user1', 'hashed_password_1', 'profile_pic_url_1'),
    ('user2@example.com', 'user2', 'hashed_password_2', 'profile_pic_url_2'),
    ('user3@example.com', 'user3', 'hashed_password_3', 'profile_pic_url_3');
