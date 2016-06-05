CREATE DATABASE bookstore;

\c bookstore

CREATE TABLE books (
	id SERIAL PRIMARY KEY, 
	title VARCHAR(255), 
	author VARCHAR(255),
	year INTEGER,
	publisher VARCHAR(255)
	);
