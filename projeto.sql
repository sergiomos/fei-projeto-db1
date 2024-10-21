
DROP DATABASE IF EXISTS spotify
CREATE DATABASE spotify;

CREATE TABLE musics (
 id int NOT NULL,
 title varchar(100) NOT NULL,
 duration NOT NULL,
 PRIMARY KEY (id)
)

CREATE TABLE singers (
 id int NOT NULL,
 name varchar(255) NOT NULL,
 birthday NOT NULL,
 PRIMARY KEY (id)
 
)

CREATE TABLE discs (
 id int NOT NULL,
 title varchar(100) NOT NULL,
 launch_date NOT NULL,
 singer_id int NOT NULL,
 PRIMARY KEY (id)
)

CREATE TABLE users (
 id int NOT NULL,
 name varchar(100) NOT NULL,
 email varchar(100) NOT NULL,
 register_date int NOT NULL,
 PRIMARY KEY (id
)

CREATE TABLE playlists (
 id int NOT NULL,
 title varchar(100) NOT NULL,
 user_id int NOT NULL,
 PRIMARY KEY (id
)

CREATE TABLE disc_music (
 disc_id int NOT NULL,
 music_id int NOT NULL,
 PRIMARY KEY (id
)

CREATE TABLE playlist_music (
 playlist_id int NOT NULL,
 music_id int NOT NULL,
 PRIMARY KEY (id
)

CREATE TABLE music_singer (
 singer_id int NOT NULL,
 music_id int NOT NULL,
 PRIMARY KEY (id
)
