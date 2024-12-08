-- Заполняем данными таблицу артисты
INSERT INTO artist(ArtistID, artistname)
VALUES(1, 'КИНО');
INSERT INTO artist(ArtistID, artistname)
VALUES(2, 'РУКИ ВВЕРХ');
INSERT INTO artist(ArtistID, artistname)
VALUES(3, 'КАРМЕН');
INSERT INTO artist(ArtistID, artistname)
VALUES(4, 'ТЕХНОЛОГИЯ');
INSERT INTO artist(ArtistID, artistname)
VALUES(5, 'Metalisa');
--update artist
--set artistname = 'РУКИ ВВЕРХ'
--WHERE ArtistID = 2;
--delete from artist;

-- Заполняем данными таблицу жанры
INSERT INTO genre 
VALUES(1, 'Рок');
INSERT INTO genre 
VALUES(2, 'Поп');
INSERT INTO genre 
VALUES(3, 'Техно');
INSERT INTO genre 
VALUES(4, 'Фолк');

-- Заполняем данными таблицу альбомы
INSERT INTO album 
VALUES(1, 'Трамвай', 1986);
INSERT INTO album  
VALUES(2, 'Оранжевое небо', 2000);
INSERT INTO album 
VALUES(3, 'Кнопка', 1999);
INSERT INTO album 
VALUES(4, 'Гудбай', 1998);
INSERT INTO album 
VALUES(5, 'The best from the west', 2020);

-- Заполняем данными таблицу треки
INSERT INTO track 
VALUES(1, 'Пачка сигарет', 180, 1);
INSERT INTO track  
VALUES(2, 'Звезда по имени солнце', 162, 1);
INSERT INTO track
VALUES(3, 'Алёшка', 230, 2);
INSERT INTO track
VALUES(4, 'Лондон гудбай', 202, 4);
INSERT INTO track
VALUES(5, 'Нажми на кнопку', 160, 3);
INSERT INTO track
VALUES(6, 'Странные танцы', 304, 3);
INSERT INTO track
VALUES(7, 'It my life', 290, 3);
INSERT INTO track
VALUES(8, 'my own', 120, 4);
INSERT INTO track
VALUES(9, 'own my', 121, 4);
INSERT INTO track
VALUES(10, 'my', 122, 4);
INSERT INTO track
VALUES(11, 'oh my god', 123, 4);
INSERT INTO track
VALUES(12, 'myself', 124, 4);
INSERT INTO track
VALUES(13, 'by myself', 125, 4);
INSERT INTO track
VALUES(14, 'bemy self', 126, 4);
INSERT INTO track
VALUES(15, 'myself by', 127, 4);
INSERT INTO track
VALUES(16, 'by myself by', 128, 4);
INSERT INTO track
VALUES(17, 'beemy', 129, 4);
INSERT INTO track
VALUES(18, 'premyne', 130, 4);
--update track
--set trackname = 'Oh My God'
--WHERE trackid = 11;

-- Заполняем данными таблицу сборники
INSERT INTO sbornik 
VALUES(1, 'Рок - прямоток', 1987);
INSERT INTO sbornik  
VALUES(2, 'Танцеваотные хиты', 2000);
INSERT INTO sbornik 
VALUES(3, 'Техномафия', 2000);
INSERT INTO sbornik 
VALUES(4, 'Лучшие из лучших', 2001);
INSERT INTO sbornik 
VALUES(5, 'Голден стар', 2020);

-- Запомлянем промежуточные таблицы
INSERT INTO sbornik_track
VALUES(1, 1);
INSERT INTO sbornik_track
VALUES(1, 2);
INSERT INTO sbornik_track
VALUES(2, 3);
INSERT INTO sbornik_track
VALUES(3, 4);
INSERT INTO sbornik_track
VALUES(3, 5);
INSERT INTO sbornik_track
VALUES(3, 6);
INSERT INTO sbornik_track
VALUES(4, 1);
INSERT INTO sbornik_track
VALUES(4, 2);
INSERT INTO sbornik_track
VALUES(4, 3);
INSERT INTO sbornik_track
VALUES(4, 4);
INSERT INTO sbornik_track
VALUES(4, 5);
INSERT INTO sbornik_track
VALUES(4, 6);
INSERT INTO sbornik_track
VALUES(5, 1);


INSERT INTO album_artist
VALUES(1, 1);
INSERT INTO album_artist
VALUES(2, 2);
INSERT INTO album_artist
VALUES(3, 4);
INSERT INTO album_artist
VALUES(4, 3);
INSERT INTO album_artist
VALUES(5, 5);

INSERT INTO artist_genre
VALUES(1, 1);
INSERT INTO artist_genre
VALUES(2, 2);
INSERT INTO artist_genre
VALUES(3, 3);
INSERT INTO artist_genre
VALUES(3, 4);
INSERT INTO artist_genre
VALUES(4, 3);

-- проверим
SELECT * FROM artist;
SELECT * FROM genre;
SELECT * FROM album;
SELECT * FROM track;
SELECT * FROM sbornik;
SELECT * FROM sbornik_track;
SELECT * FROM album_artist;
SELECT * FROM artist_genre;
