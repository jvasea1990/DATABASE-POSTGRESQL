SELECT 'Create Database chat_db' WHERE NOT EXISTS (
    SELECT FROM pg_database WHERE datname='chat_db'
)\gexec

CREATE TABLE if not EXISTS clients (
    id int PRIMARY KEY,
    name varchar (63),
    phone varchar (15),
    email varchar (127), 
    password varchar (127)
);

CREATE TABLE IF NOT EXISTS cities (
    id int PRIMARY KEY,
    name VARCHAR (63)
);

CREATE TABLE IF NOT EXISTS streets (
    id int PRIMARY KEY,
    name varchar (127) 
);
CREATE TABLE IF NOT EXISTS products (
    id int PRIMARY KEY,
    name varchar (127) NOT NULL,
    price numeric DEFAULT 0
);

CREATE TABLE IF NOT EXISTS locations (
    id int PRIMARY KEY,
    client_id int,
    city_id int,
    street_id int, 
    number varchar (15), 
    CONSTRAINT fk_location_client FOREIGN KEY (client_id) REFERENCES clients(id),
    CONSTRAINT fk_location_city FOREIGN KEY (city_id) REFERENCES cities(id),
    CONSTRAINT fk_location_street FOREIGN KEY (street_id) REFERENCES streets(id)
);