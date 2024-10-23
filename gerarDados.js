require('dotenv').config();
const { Client } = require('pg');
const { faker } = require('@faker-js/faker');

// Configurações de conexão com o banco de dados
const client = new Client({
  user: process.env.DB_USER,
  host: process.env.DB_HOST,
  database: process.env.DB_NAME,
  password: process.env.DB_PASSWORD,
  port: process.env.DB_PORT,
});

// Função para conectar ao banco de dados
async function connect() {
  try {
    await client.connect();
    console.log('Conectado ao banco de dados PostgreSQL');
  } catch (err) {
    console.error('Erro ao conectar ao banco de dados', err.stack);
  }
}

// Função para gerar dados aleatórios
function generateRandomData() {
  const singers = [];
  const disks = [];
  const musics = [];
  const users = [];
  const playlists = [];
  const singerMusic = [];
  const playlistMusic = [];

  // Gerar dados para a tabela singer
  for (let i = 0; i < 10; i++) {
    singers.push({
      name: faker.person.firstName(),
      birthday: faker.date.birthdate({ min: 1970, max: 2000, mode: 'year' }),
    });
  }

  // Gerar dados para a tabela disk e associar com singer
  for (let i = 0; i < 10; i++) {
    disks.push({
      title: faker.music.songName(),
      lauch_date: faker.date.past(10), // Nos últimos 10 anos
      singer_id: i + 1,
    });
  }

  // Gerar dados para a tabela music e associar com disk
  for (let i = 0; i < 20; i++) {
    musics.push({
      title: faker.music.songName(),
      duration: faker.number.int({ min: 180, max: 360 }), // Duração entre 3 e 6 minutos
      disk_id: faker.number.int({ min: 1, max: 10 }),
    });
  }

  // Gerar dados para a tabela user
  for (let i = 0; i < 10; i++) {
    users.push({
      name: faker.person.firstName(),
      email: faker.internet.email(),
      register_date: faker.date.past(1), // Nos últimos 1 ano
    });
  }

  // Gerar dados para a tabela Playlist e associar com user
  for (let i = 0; i < 10; i++) {
    playlists.push({
      title: faker.lorem.words(2) + ' Playlist',
      user_id: i + 1,
    });
  }

  // Gerar dados para a tabela singer_music (associação muitos-para-muitos)
  for (let i = 0; i < 20; i++) {
    singerMusic.push({
      singer_id: faker.number.int({ min: 1, max: 10 }),
      music_id: i + 1,
    });
  }

  // Gerar dados para a tabela Playlist_music (associação muitos-para-muitos)
  for (let i = 0; i < 30; i++) {
    playlistMusic.push({
      playlist_id: faker.number.int({ min: 1, max: 10 }),
      music_id: faker.number.int({ min: 1, max: 20 }),
    });
  }

  return { singers, disks, musics, users, playlists, singerMusic, playlistMusic };
}

// Função para inserir dados aleatórios no banco de dados
async function insertData() {
  const { singers, disks, musics, users, playlists, singerMusic, playlistMusic } = generateRandomData();

  try {
    // Inserir dados na tabela singer
    for (const singer of singers) {
      await client.query(
        'INSERT INTO singers (name, birthday) VALUES ($1, $2)',
        [singer.name, singer.birthday]
      );
    }

    // Inserir dados na tabela disk
    for (const disk of disks) {
      await client.query(
        'INSERT INTO disks (title, lauch_date, singer_id) VALUES ($1, $2, $3)',
        [disk.title, disk.lauch_date, disk.singer_id]
      );
    }

    // Inserir dados na tabela music
    for (const music of musics) {
      await client.query(
        'INSERT INTO musics (title, duration, disk_id) VALUES ($1, $2, $3)',
        [music.title, music.duration, music.disk_id]
      );
    }

    // Inserir dados na tabela user
    for (const user of users) {
      await client.query(
        'INSERT INTO users (name, email, register_date) VALUES ($1, $2, $3)',
        [user.name, user.email, user.register_date]
      );
    }

    // Inserir dados na tabela Playlist
    for (const playlist of playlists) {
      await client.query(
        'INSERT INTO playlists (title, user_id) VALUES ($1, $2)',
        [playlist.title, playlist.user_id]
      );
    }

    // Inserir dados na tabela singer_music
    for (const am of singerMusic) {
      await client.query(
        'INSERT INTO singer_music (singer_id, music_id) VALUES ($1, $2)',
        [am.singer_id, am.music_id]
      );
    }

    // Inserir dados na tabela Playlist_music
    for (const pm of playlistMusic) {
      await client.query(
        'INSERT INTO playlist_music (playlist_id, music_id) VALUES ($1, $2)',
        [pm.playlist_id, pm.music_id]
      );
    }

    console.log("Dados inseridos com sucesso!");
  } catch (err) {
    console.error("Erro ao inserir dados", err.stack);
  } finally {
    await client.end();
    console.log("Conexão com o banco de dados fechada");
  }
}

// Executa as funções
connect().then(insertData);
