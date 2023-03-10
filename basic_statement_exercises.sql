use albums_db;
select database();
show create database albums_db;
show tables;
show create table albums;
 
--  PRIMARY KEY (`id`)
-- `name` varchar(240) NOT NULL, the album name
-- `sales` float DEFAULT NULL, earings could be money or number sold?

select *
from albums
where artist = 'Pink Floyd';
-- The Dark Side of the Moon, The Wall

select release_date, name
from albums
where name = "Sgt. Pepper's Lonely Hearts Club Band";
-- 1967

select genre
from albums
where name = 'Nevermind';
-- Grunge,Alternative Rock

select name, release_date
from albums
where release_date between 1990 and 1999;

/*The Bodyguard,Jagged Little Pill,Come On Over,Falling into You,Let's talk about love,Dangerous,the immaculate collections,
Titanic: Muscic from the Motion Picture,Metallica,Nevermind,Supernatural*/

select name, sales
from albums
where sales < 20;

/*Grease,bad,sgt.pepper,dirty dancing,lets talk about love,dangerous,the immaculate collection,abbey road,born in the usa
brothers in arms,titanic,nevermind,the wall */

