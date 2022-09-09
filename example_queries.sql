/* select the names of persons of particular age */
SELECT name FROM person WHERE age=15;

/* select the colors of shoes that a person has */
SELECT color FROM shoe_instance WHERE person_id=
    (SELECT id from person WHERE name='John');

/* select the names of the clubs that a particular person is involved in */
SELECT name FROM club WHERE id IN
    (SELECT club_id FROM person_club WHERE person_id=
        (SELECT id FROM person WHERE name='Sarah'));