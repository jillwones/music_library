TRUNCATE TABLE albums RESTART IDENTITY;

INSERT INTO albums
(title, release_year, artist_id)
VALUES('More Life', 2017, 1);

INSERT INTO albums
(title, release_year, artist_id)
VALUES('Divide', 2017, 2);