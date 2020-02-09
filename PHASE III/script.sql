SET search_path to game_store_app;
SET ROLE game_store_app;
CREATE TABLE customer (
	customer_id SERIAL PRIMARY KEY,
	first_name TEXT NOT NULL,
	last_name TEXT NOT NULL,
	email TEXT NOT NULL UNIQUE,
	username TEXT NOT NULL,
	address TEXT NOT NULL,
	password TEXT NOT NULL,
	CHECK(first_name !~ '\s' AND last_name !~ '\s'),
	CHECK (email ~* '^\w+@\w+[.]\w+$'),
	CHECK (char_length(password)>=8)
);

CREATE TABLE developer (
	dev_id INT PRIMARY KEY,
	name TEXT NOT NULL
);

CREATE TABLE game (
	game_id BIGSERIAL PRIMARY KEY,
	dev_id INT NOT NULL REFERENCES developer(dev_id),
	title TEXT NOT NULL,
	release_date DATE NOT NULL,
	genre TEXT NOT NULL,
	rating INT NOT NULL,
	number_of_sales SERIAL NOT NULL,
	price FLOAT NOT NULL
);

CREATE TABLE cart_item
(
	item_id SERIAL PRIMARY KEY,
	game_id BIGSERIAL NOT NULL REFERENCES game(game_id),
	quantity INT NOT NULL,
	unit_cost FLOAT NOT NULL,
	total_price FLOAT NOT NULL
);
CREATE TABLE cart (
	cart_id SERIAL PRIMARY KEY,
	item_id SERIAL NOT NULL REFERENCES cart_item(item_id),
	customer_id SERIAL NOT NULL REFERENCES customer(customer_id),
	total_cost FLOAT NOT NULL
);
CREATE TABLE payment(
	payment_id SERIAL PRIMARY KEY,
	amount FLOAT NOT NULL,
	payment_type BOOLEAN NOT NULL
);
CREATE TABLE admin (
	admin_id SERIAL PRIMARY KEY,
	email TEXT NOT NULL UNIQUE,
	username TEXT NOT NULL,
	password TEXT NOT NULL,
	CHECK (email ~* '^\w+@\w+[.]\w+$'),
	CHECK (char_length(password)>=8)
);
