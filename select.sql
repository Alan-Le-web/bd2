-- Название и продолжительность самого длительного трека.
SELECT trackname, duration FROM track
WHERE duration = (SELECT MAX(duration) FROM track);

-- Название треков, продолжительность которых не менее 3,5 минут.
SELECT trackname FROM track
WHERE duration >= 210;

-- Названия сборников, вышедших в период с 2018 по 2020 год включительно.
SELECT sbornikname FROM sbornik
WHERE  year BETWEEN 2018 AND 2020;

-- Исполнители, чьё имя состоит из одного слова.
SELECT artistname FROM artist 
WHERE artistname NOT LIKE '% %';

-- Название треков, которые содержат слово «мой» или «my».
SELECT trackname FROM track 
WHERE trackname LIKE '%мой%' OR trackname LIKE '%my%';

--Количество исполнителей в каждом жанре.
SELECT g.GenreName, COUNT(ag.ArtistID) FROM Genre g
LEFT JOIN Artist_Genre ag ON g.GenreID = ag.GenreID
LEFT JOIN Artist a ON ag.ArtistID = a.ArtistID
GROUP BY g.GenreName;

--Количество треков, вошедших в альбомы 1990–2020 годов.
SELECT a.albumname, COUNT(t.trackid) FROM album a
LEFT JOIN track t ON a.albumid = t.albumid 
WHERE  a.year BETWEEN 1990 AND 2020
GROUP BY a.albumname;

--Средняя продолжительность треков по каждому альбому.
SELECT a.albumname, AVG(t.duration) FROM album a
LEFT JOIN track t ON a.albumid = t.albumid 
GROUP BY a.albumname;

--Все исполнители, которые не выпустили альбомы в 2020 году.
SELECT a.artistname FROM artist a
LEFT JOIN album_artist aa ON a.artistid = aa.artistid 
LEFT JOIN album al ON aa.albumid = al.albumid 
WHERE  al.year != 2020
GROUP BY a.artistname
--HAVING SUM(CASE WHEN al.year = 2020 THEN 1 ELSE 0 END) = 0;

--Названия сборников, в которых присутствует конкретный исполнитель (выберите его сами).

SELECT s.sbornikname FROM sbornik s
JOIN sbornik_track st ON s.sbornikid = st.sbornikid
JOIN track t ON st.trackid = t.trackid 
JOIN album a ON t.albumid = a.albumid 
JOIN album_artist aa ON a.albumid = aa.albumid
JOIN artist a2 ON aa.artistid = a2.artistid 
WHERE a2.artistname = 'КИНО'
GROUP BY s.sbornikname;

--Названия альбомов, в которых присутствуют исполнители более чем одного жанра.
SELECT a.albumname FROM album a
JOIN album_artist aa ON a.albumid = aa.albumid
JOIN artist a2 ON aa.artistid = a2.artistid 
JOIN artist_genre ag ON a2.artistid = ag.artistid 
JOIN genre g ON ag.genreid = g.genreid
WHERE g.genreid > 1;

--Наименования треков, которые не входят в сборники.
select t.trackname from track t
LEFT JOIN sbornik_track st ON t.trackid = st.trackid
LEFT JOIN sbornik s ON st.sbornikid = s.sbornikid 
where s.sbornikid is null;

--Исполнитель или исполнители, написавшие самый короткий по продолжительности трек, — теоретически таких треков может быть несколько.
SELECT a.artistname FROM artist a
JOIN album_artist aa ON a.artistid = aa.artistid 
JOIN album a2 ON aa.albumid = a2.albumid 
JOIN track t ON a2.albumid = t.albumid
WHERE duration = (SELECT MIN(duration) FROM track);


--Названия альбомов, содержащих наименьшее количество треков.
--SELECT a.albumname, COUNT(t.trackid) kol FROM album a 
--LEFT JOIN track t ON a.albumid = t.albumid 
--GROUP BY a.albumid, a.albumname
--WHERE min(COUNT(t.trackid));
SELECT a.albumname, COUNT(t.trackid) AS kol
FROM album a
LEFT JOIN track t ON a.albumid = t.albumid
GROUP BY a.albumid, a.albumname
HAVING COUNT(t.trackid) = (
    SELECT MIN(track_count)
    FROM (
        SELECT COUNT(t2.trackid) AS track_count
        FROM album a2
        LEFT JOIN track t2 ON a2.albumid = t2.albumid
        GROUP BY a2.albumid
    ) AS track_counts
);