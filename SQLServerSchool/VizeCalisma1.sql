--VÝZE HAZIRLIK
create database vizeHazirlik
use vizeHazirlik

create table kullanici(
kullanici_is int identity,
kullanici_adi varchar(25) not null,
sifre varchar(5) not null
);

select * from kullanici
insert into kullanici values ('Dilara','1234')
insert into kullanici values ('Sevim',123)
insert into kullanici values('polat',5874)
update kullanici set kullanici_adi='admin' where kullanici_is=2
delete from kullanici where kullanici_is=3

--Tablodaki sütun adýný deðistirme
ALTER TABLE kullanici RENAME column kullanici_is TO kullanici_id;--Hocaya sor
--Drop table kullanici --Tabloyu siliyoruz 
--Truncate table kullanici -- Tabloyu sýfýrladý id 1 den baþlar.
