-- 1. Liste o título de todas as músicas e suas durações.
SELECT title, duration FROM musics;

-- 2. Encontre o nome de todos os artistas que têm mais de 5 músicas em seu repertório.
SELECT a.name 
FROM singers a
JOIN singer_music am ON a.singer_id = am.singer_id
GROUP BY a.singer_id
HAVING COUNT(am.music_id) > 5;

-- 3. Quais são os títulos dos discos lançados após 2020?
SELECT title 
FROM disks 
WHERE launch_date > '2020-01-01';

-- 4. Liste os títulos das músicas e os nomes dos artistas que as interpretam, ordenados pelo título da música.
SELECT m.title AS music_title, a.name AS singers_name
FROM musics m
JOIN singer_music am ON m.music_id = am.music_id
JOIN singers a ON am.singer_id = a.singer_id
ORDER BY m.title;

-- 5. Encontre os títulos das playlists que contêm a música com o título 'Imagine'.
SELECT p.title
FROM playlists p
JOIN playlist_music pm ON p.playlist_id = pm.playlist_id
JOIN musics m ON pm.music_id = m.music_id
WHERE m.title = 'Imagine';

-- 6. Liste os usuários que criaram playlists que contêm músicas do disco 'Abbey Road'.
SELECT u.name 
FROM users u
JOIN playlists p ON u.user_id= p.user_id
JOIN playlist_music pm ON p.playlist_id = pm.playlist_id
JOIN musics m ON pm.music_id = m.music_id
JOIN disks d ON m.disk_id = d.disk_id
WHERE d.title = 'Abbey Road';

-- 7. Qual é a duração média das músicas de um artista específico?
SELECT a.name, AVG(m.duration) AS duration_media
FROM singers a
JOIN singer_music am ON a.singer_id = am.singer_id
JOIN musics m ON am.music_id = m.music_id
WHERE a.name = '<Nome do Artista>'
GROUP BY a.name;

-- 8. Encontre todos os artistas que não têm músicas.
SELECT a.name 
FROM singers a
LEFT JOIN singer_music am ON a.singer_id = am.singer_id
WHERE am.music_id IS NULL;

-- 9. Liste todos os discos que contêm mais de 10 músicas.
SELECT d.title
FROM disks d
JOIN musics m ON d.disk_id = m.disk_id
GROUP BY d.disk_id
HAVING COUNT(m.music_id) > 10;

-- 10. Quais são os nomes dos artistas que têm discos lançados antes de 2010 e que têm músicas na playlist 'Top 50'?
SELECT DISTINCT a.name
FROM singers a
JOIN disk d ON a.singer_id = d.singer_id
JOIN musics m ON d.disk_id = m.disk_id
JOIN playlist_music pm ON m.music_id = pm.music_id
JOIN playlists p ON pm.playlist_id = p.playlist_id
WHERE d.launch_date < '2010-01-01' AND p.title = 'Top 50';

-- 11. Quais músicas são interpretadas por mais de um artista?
SELECT m.title
FROM musics m
JOIN singer_music am ON m.music_id = am.music_id
GROUP BY m.music_id
HAVING COUNT(am.singer_id) > 1;

-- 12. Liste os títulos das músicas que aparecem em mais de uma playlist.
SELECT m.title
FROM musics m
JOIN playlist_music pm ON m.music_id = pm.music_id
GROUP BY m.music_id
HAVING COUNT(pm.playlist_id) > 1;

-- 13. Encontre os nomes dos usuários que têm playlists que incluem a música 'Bohemian Rhapsody'.
SELECT u.name
FROM users u
JOIN playlists p ON u.user_id= p.user_id
JOIN playlist_music pm ON p.playlist_id = pm.playlist_id
JOIN musics m ON pm.music_id = m.music_id
WHERE m.title = 'Bohemian Rhapsody';

-- 14. Qual é o título da música mais longa do disco 'Dark Side of the Moon'?
SELECT m.title
FROM musics m
JOIN disk d ON m.disk_id = d.disk_id
WHERE d.title = 'Dark Side of the Moon'
ORDER BY m.duration DESC
LIMIT 1;

-- 15. Liste todos os discos lançados por um artista específico em um determinado ano.
SELECT d.title
FROM disks d
JOIN singers a ON d.singer_id = a.singer_id
WHERE a.name = 'name do singers'  -- Substitua pelo name do singers específico
  AND EXTRACT(YEAR FROM d.launch_date) = 2021; -- Substitua pelo ano específico

-- 16. Quais são os nomes dos artistas que têm músicas em playlists criadas por um usuário específico?
SELECT DISTINCT a.name
FROM singers a
JOIN singer_music am ON a.singer_id = am.singer_id
JOIN musics m ON am.music_id = m.music_id
JOIN playlist_music pm ON m.music_id = pm.music_id
JOIN playlists p ON pm.playlist_id = p.playlist_id
JOIN users u ON p.user_id = u.user_id
WHERE u.name = '<Nome do Usuário>';

-- 17. Encontre a lista de músicas que não estão em nenhuma playlist.
SELECT m.title
FROM musics m
LEFT JOIN playlist_music pm ON m.music_id = pm.music_id
WHERE pm.playlist_id IS NULL;

-- 18. Liste os títulos das músicas e os nomes dos artistas que têm mais de 3 músicas em uma mesma playlist.
SELECT m.title AS music_title, a.name AS singers_name
FROM singers a
JOIN singer_music am ON a.singer_id = am.singer_id
JOIN musics m ON am.music_id = m.music_id
JOIN playlist_music pm ON m.music_id = pm.music_id
GROUP BY a.name, m.title, pm.playlist_id
HAVING COUNT(m.music_id) > 3;

-- 19. Quais são os discos que contêm músicas de artistas que têm pelo menos 2 discos lançados?
SELECT DISTINCT d.title
FROM disks d
JOIN musics m ON d.disk_id = m.disk_id
JOIN singers a ON d.singer_id = a.singer_id
WHERE (SELECT COUNT(*) FROM disks WHERE singer_id = a.singer_id) >= 2;

-- 20. Liste todos os usuários e suas playlists, mas apenas para playlists que contêm pelo menos 5 músicas.
SELECT u.name AS users_name, p.title AS playlist_title
FROM users u
JOIN playlists p ON u.user_id= p.user_id
JOIN playlist_music pm ON p.playlist_id = pm.playlist_id
GROUP BY u.name, p.title
HAVING COUNT(pm.music_id) >= 5;
