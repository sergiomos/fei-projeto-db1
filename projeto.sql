
DROP DATABASE IF EXISTS spotify
CREATE DATABASE spotify;

CREATE TABLE singers (
 singer_id INT PRIMARY KEY AUTO_INCREMENT,
 name VARCHAR(255) NOT NULL,
 birthday DATE NOT NULL,

)

CREATE TABLE discs (
 disc_id INT PRIMARY KEY AUTO_INCREMENT,
 title VARCHAR(255) NOT NULL,
 launch_date DATE NOT NULL,
 singer_id INT NOT NULL,

 FOREIGN KEY (singer_id) REFERENCES singers(singer_id)
)

CREATE TABLE musics (
 music_id INT PRIMARY KEY AUTO_INCREMENT,
 title VARCHAR(255) NOT NULL,
 duration INT NOT NULL,
 disc_id INT,

 FOREIGN KEY (disc_id) REFERENCES discs(disc_id)
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


