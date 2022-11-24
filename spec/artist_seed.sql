TRUNCATE TABLE artists, albums RESTART IDENTITY;

INSERT INTO artists
(name, genre)
VALUES('Drake', 'rap');

INSERT INTO artists
(name, genre)
VALUES('Ed Sheeran', 'pop');

INSERT INTO albums
(title, release_year, artist_id)
VALUES('More Life', 2017, 1);

INSERT INTO albums
(title, release_year, artist_id)
VALUES('Divide', 2017, 2);