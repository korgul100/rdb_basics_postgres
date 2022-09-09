/* Join table for person and club */
CREATE TABLE person_club (
    person_id int REFERENCES person(id),
    club_id int REFERENCES club(id),
    PRIMARY KEY (person_id, club_id)
);