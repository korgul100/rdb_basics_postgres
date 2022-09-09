CREATE TABLE shoe_instance  (
    id serial PRIMARY KEY,
    color char(25) NOT NULL,
    size decimal NOT NULL,
    make char(25) NOT NULL,
    model char(25) NOT NULL,
    person_id int REFERENCES person(id)
);