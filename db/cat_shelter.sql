DROP TABLE IF EXISTS cats;
DROP TABLE IF EXISTS owners;

CREATE TABLE owners (
  id SERIAL4 primary key,
  name VARCHAR(255),
  age INT4,
  background TEXT,
  accommodation_type VARCHAR(255)

);

CREATE TABLE cats (
  id SERIAL4 primary key,
  name VARCHAR(255),
  age INT4,
  gender VARCHAR(255),
  color VARCHAR(255),
  description TEXT,
  admission_date DATE,
  status VARCHAR(255),
  owner_id INT4 REFERENCES owners(id)
);
