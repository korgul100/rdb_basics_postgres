INSERT INTO shoe_instance (color, size, make, model, person_id)
VALUES ('grey', 12.5, 'Vans', 'Float', (SELECT id FROM person WHERE name='Chris'));
