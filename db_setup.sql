CREATE TABLE users (
	user_id SERIAL PRIMARY KEY,
	email VARCHAR(75) NOT NULL,
	pass_hash VARCHAR(255) NOT NULL,
	username VARCHAR(25) NOT NULL
);

CREATE TABLE ingredients (
	food_id SERIAL PRIMARY KEY,
	food_name VARCHAR(255) NOT NULL,
	measure_type varchar(15) NOT NULL
);

CREATE TABLE user_recipes (
	recipe_id SERIAL PRIMARY KEY,
	author_id INT REFERENCES users(user_id),
	name VARCHAR(100) NOT NULL,
	prep_time_min INT NOT NULL,
	instructions TEXT NOT NULL,
	is_private BOOL NOT NULL
);

CREATE TABLE user_favs (
	id SERIAL PRIMARY KEY,
	fav_user_id INT REFERENCES users(user_id),
	recipe_id INT REFERENCES user_recipes(recipe_id)
);

CREATE TABLE recipes_ingredients (
	id SERIAL PRIMARY KEY,
	food_id INT REFERENCES ingredients(food_id),
	recipe_id INT REFERENCES user_recipes(recipe_id),
	quantity FLOAT NOT NULL
);

CREATE TABLE grocery_list (
	id SERIAL PRIMARY KEY,
	user_id INT REFERENCES users(user_id),
	food_id INT REFERENCES ingredients(food_id),
	quantity FLOAT NOT NULL
);

CREATE TABLE occasions (
	occasion_id SERIAL PRIMARY KEY ,
	user_id INT REFERENCES users(user_id),
	recipe_1 INT REFERENCES user_recipes(recipe_id),
	recipe_2 INT REFERENCES user_recipes(recipe_id),
	occ_date date NOT NULL
);
