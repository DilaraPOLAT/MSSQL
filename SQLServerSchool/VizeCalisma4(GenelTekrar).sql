use vizeHazirlik
--CREATE: Veritaban�ve tablo gibi bir veritaban�nesnesi olu�turur.

--Create database vizeHazirlik
create table musteri(

id tinyint primary key identity(1,1),
isim varchar(20) not null,
soyisim varchar(20),
sehir varchar(20),
yas tinyint,
);

select*from musteri
select*from personel

--ALTER: Daha �nceden olu�turulmu� olan veritaban� tablolar� �zerinde de�i�iklik yapmak i�in kullan�l�r
ALTER TABLE musteri RENAME personel;--Hata verdi Oracle'da bu �ekilde
sp_rename 'musteri', 'personel';--Tablo ad�n� degistirebildik
select*from personel
ALTER TABLE personel ADD maas INT, ulke varchar(20); --Tabloya yeni alan ekleme
ALTER TABLE personel ALTER column yas VARCHAR(3);--Tablodaki mevcut olan column veri tipini degistirme
ALTER TABLE personel ALTER column yas tinyint;
ALTER TABLE personel ADD cinsiyet varchar(1)
ALTER TABLE personel DROP COLUMN cinsiyet;--Tablodaki column silme

--DROP: Veritaban�ya da tablo silmek i�in kullan�lan komuttur
DROP DATABASE vizeHazirlik  -- veri taban�n� siler
DROP TABLE personel  -- Tabloyu siler veritaban�ndan

--TRUNCATE: Tablonun i�indeki verileri siler,ancak tablonun kendisini silmez.
TRUNCATE DATABASE vizeHazirlik
TRUNCATE TABLE personel

--INSERT INTO: Veritaban�na kay�t eklemek i�in kullan�l�r
INSERT INTO personel values('Dilara','Polat','Elaz��',21,3000,'T�rkiye','K')
INSERT INTO personel values('Tugba','Y�lmaz','Lahey',85,4000,'Hollanda','K')
INSERT INTO personel values('Helena','Polat','New York',41,3500,'ABD','K')
INSERT INTO personel values('Ay�e','Sar�','Br�ksel',30,2000,'Bel�ika','K')
INSERT INTO personel values('Ali','Top','Berlin',28,2500,'Almanya','E')
INSERT INTO personel values('Ahmet','Peri','Konya',10,5000,'T�rkiye','E')
INSERT INTO personel values('Ahmet','�i�ek','Konya',10,5000,'T�rkiye','E')
INSERT INTO personel values('Mehemet','�i�ek','Konya',10,4200,'T�rkiye','E')
INSERT INTO personel values('Asl�','�i�ek','Karaman',10,5000,'T�rkiye','K')

INSERT INTO personel (isim,soyisim,yas,maas)values('Lara','Timur',20,3000)

--UPDATE: Veritaban�nda bulunan verileri de�i�tirmek(g�ncellemek)amac�yla kullan�lan bir deyimdir.
select*from personel
UPDATE personel set soyisim='Kaya' where id=7 --eger where sarti eklemeseydik soyisim s�tunundaki tum verileri 'Kaya' yapard�.
UPDATE personel set yas=19 where id=9

--DELETE :  Veritaban�nda bulunan bir tablodaki istenilen kay�tlar� silmek amac�yla kullan�lan bir SQL komutudur.
DELETE FROM personel where id=1
INSERT INTO personel  values('Dilara','Polat','Elaz��',21,3000,'T�rkiye','K')

--�GRANT: Belirtilen ki�iye ya da gruba veri kullanma ve komut �al��t�rma izni verir.
--�DENY: ��lem yapmak i�in verilen izinleri k�s�tlar ya da kald�r�r.
--�REVOKE: Verilen t�m izinleri iptal eder.

--LIKE
select*from personel
Select *from personel where ulke like '%i%'
Select *from personel where ulke like 't%'
Select *from personel where ulke like '%D'
Select *from personel where ulke like '%ye'
Select *from personel where ulke like '%i_a'
Select *from personel where ulke like '%[a,b]'--sonu a veya b ile biten ulkeleri getirir
Select *from personel where ulke like '%[a-d]'-- sonu a dan d ye olanlar� getirir

--DISTINCT
select*from personel
select distinct ulke from personel
select count(distinct ulke)  from personel 
select avg(distinct yas) from personel

--SUM
select sum(maas) from personel

--MAX - MIN
Select Max(maas) from personel
Select Min(yas) from personel

--TOP - PERCENT
select top 6 *from personel
select *from personel
select top 6 percent *from personel
select (maas*1.1) maas from personel

--IN ,NOT IN
select *from personel where yas in (20,41)

--BETWEEN
select *from personel where yas between 20 and 41



--Group by
select *from personel
select sehir from personel where sehir is not null group  by sehir  --null olan sehirler d�s�ndakileri grupand�r�d� 
select sehir from personel  group  by sehir 
select sehir from personel where sehir!='Berlin' group  by sehir  --neden null almad�  <HOCAYA SOR>
select sehir ,maas from personel    group  by sehir having  sehir !='New York' --neden null almad�
select *from personel
select ulke,avg(maas) from personel group by ulke 
-- ulke gore gruplayan maas� 3000'den buyukleri personel bilgilerini getiren sql sorgusunu yaz�n�z
select ulke from personel where maas>3000 group by ulke

--soyisme gore gruplayan max yas'dan  olan personelleri getiren sql sorguyu yaz�n�z
select *from personel
select soyisim,max(yas),min(yas) from personel group by soyisim having max(yas)<20
select soyisim,max(yas),min(yas) from personel group by soyisim having max(yas)>20

