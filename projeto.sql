
DROP DATABASE IF EXISTS spotify;
CREATE DATABASE spotify;

CREATE TABLE singers (
 singer_id INT PRIMARY KEY AUTO_INCREMENT,
 name VARCHAR(255) NOT NULL,
 birthday DATE NOT NULL,
);

CREATE TABLE disks (
 disk_id INT PRIMARY KEY AUTO_INCREMENT,
 title VARCHAR(255) NOT NULL,
 launch_date DATE NOT NULL,
 singer_id INT NOT NULL,

 FOREIGN KEY (singer_id) REFERENCES singers(singer_id)
)

CREATE TABLE musics (
 music_id INT PRIMARY KEY AUTO_INCREMENT,
 title VARCHAR(255) NOT NULL,
 duration INT NOT NULL,
 disk_id INT,

 FOREIGN KEY (disk_id) REFERENCES disks(disk_id)
)

CREATE TABLE music_singer (
 singer_id INT NOT NULL,
 music_id INT NOT NULL,

 PRIMARY KEY (singer_id, music_id),
 FOREIGN KEY (music_id) REFERENCES musics(music_id),
 FOREIGN KEY (singer_id) REFERENCES singers(singer_id)
)

CREATE TABLE users (
 user_id INT PRIMARY KEY AUTO_INCREMENT,
 name VARCHAR(255) NOT NULL,
 email VARCHAR(255) NOT NULL UNIQUE,
 register_date DATE NOT NULL,
)

CREATE TABLE playlists (
 playlist_id INT PRIMARY KEY AUTO_INCREMENT,
 title VARCHAR(100) NOT NULL,
 user_id INT NOT NULL,

 FOREIGN KEY (user_id) REFERENCES users(user_id)
)

CREATE TABLE playlist_music (
 playlist_id INT NOT NULL,
 music_id INT NOT NULL,

 PRIMARY KEY (playlist_id, music_id)
 FOREIGN KEY (playlist_id) REFERENCES playlists(playlist_id)
 FOREIGN KEY (music_id) REFERENCES musics(music_id)
)


INSERT INTO singers (name, birthday) VALUES
('Alice', '1985-06-15'),
('Bob', '1978-09-22'),
('Charlie', '1990-01-05'),
('Diana', '1992-03-12'),
('Edward', '1980-11-30'),
('Fiona', '1988-07-20'),
('George', '1995-10-08'),
('Helen', '1983-05-27'),
('Isaac', '1997-02-14'),
('Jane', '1982-12-18');

INSERT INTO disks (title, launch_date, singer_id) VALUES
('Dreamscapes', '2015-09-10', 1),
('Echoes of Time', '2013-06-25', 2),
('Firefly', '2018-11-15', 3),
('Starlight', '2019-08-05', 4),
('Ocean Breeze', '2020-04-22', 5),
('Love Songs', '2017-02-14', 6),
('The Awakening', '2014-07-19', 7),
('Soul Reflections', '2016-03-10', 8),
('Whispers', '2021-12-01', 9),
('Timeless', '2019-09-22', 10);

INSERT INTO musics (title, duration, disk_id) VALUES
('Ocean Breeze', 300, 1),
('Waves', 180, 1),
('Dreaming', 240, 2),
('Echo', 270, 2),
('Firestarter', 320, 3),
('Bright Lights', 260, 3),
('Starlit Night', 340, 4),
('Into the Sky', 290, 4),
('Calm Waters', 305, 5),
('Sunset', 215, 5),
('Whispering Winds', 275, 6),
('Moonlight Dance', 295, 6),
('Awakening', 330, 7),
('New Dawn', 260, 7),
('Soul Reflection', 345, 8),
('Inner Peace', 290, 8),
('The Whisper', 300, 9),
('Timeless Moments', 275, 9),
('Love is Forever', 220, 10),
('Heartbeats', 310, 10);

INSERT INTO users (name, email, register_date) VALUES
('Lucas', 'lucas@gmail.com', '2024-01-01'),
('Mariana', 'mariana@yahoo.com', '2024-02-15'),
('Carlos', 'carlos@outlook.com', '2024-03-12'),
('Ana', 'ana@gmail.com', '2024-04-05'),
('Pedro', 'pedro@yahoo.com', '2024-05-07'),
('Julia', 'julia@outlook.com', '2024-06-20'),
('Felipe', 'felipe@gmail.com', '2024-07-10'),
('Larissa', 'larissa@yahoo.com', '2024-08-11'),
('Thiago', 'thiago@outlook.com', '2024-09-03'),
('Beatriz', 'beatriz@gmail.com', '2024-10-01');

INSERT INTO playlists (title, user_id) VALUES
('Lucas Playlist 1', 1),
('Mariana Playlist 1', 2),
('Carlos Playlist 1', 3),
('Ana Playlist 1', 4),
('Pedro Playlist 1', 5),
('Julia Playlist 1', 6),
('Felipe Playlist 1', 7),
('Larissa Playlist 1', 8),
('Thiago Playlist 1', 9),
('Beatriz Playlist 1', 10);

INSERT INTO music_singer (artista_id, musica_id) VALUES
(1, 1), (1, 2),
(2, 3), (2, 4),
(3, 5), (3, 6),
(4, 7), (4, 8),
(5, 9), (5, 10),
(6, 11), (6, 12),
(7, 13), (7, 14),
(8, 15), (8, 16),
(9, 17), (9, 18),
(10, 19), (10, 20);

INSERT INTO playlist_music (playlist_id, musica_id) VALUES
(1, 1), (1, 2), (1, 3),
(2, 4), (2, 5), (2, 6),
(3, 7), (3, 8), (3, 9),
(4, 10), (4, 11), (4, 12),
(5, 13), (5, 14), (5, 15),
(6, 16), (6, 17), (6, 18),
(7, 19), (7, 20), (7, 1),
(8, 2), (8, 3), (8, 4),
(9, 5), (9, 6), (9, 7),
(10, 8), (10, 9), (10, 10);
