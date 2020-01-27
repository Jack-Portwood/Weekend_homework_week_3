
  DROP TABLE tickets;
  DROP TABLE customers;
  DROP TABLE films;

  CREATE TABLE customers (
    id SERIAL8 PRIMARY KEY,  --serial provides a unqiue database made identifiyer
    name VARCHAR(255),
    funds NUMERIC
  );

  CREATE TABLE films (
    id SERIAL8 PRIMARY KEY,
    title VARCHAR(255),
    price NUMERIC
  );

  CREATE TABLE tickets(
    id SERIAL8 PRIMARY KEY,
    customer_id INT REFERENCES customers(id) ON DELETE CASCADE,
    film_id INT REFERENCES films(id) ON DELETE CASCADE
  );
