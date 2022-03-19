use vizeHazirlik
--CREATE: Veritabanýve tablo gibi bir veritabanýnesnesi oluþturur.

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

--ALTER: Daha önceden oluþturulmuþ olan veritabaný tablolarý üzerinde deðiþiklik yapmak için kullanýlýr
ALTER TABLE musteri RENAME personel;--Hata verdi Oracle'da bu þekilde
sp_rename 'musteri', 'personel';--Tablo adýný degistirebildik
select*from personel
ALTER TABLE personel ADD maas INT, ulke varchar(20); --Tabloya yeni alan ekleme
ALTER TABLE personel ALTER column yas VARCHAR(3);--Tablodaki mevcut olan column veri tipini degistirme
ALTER TABLE personel ALTER column yas tinyint;
ALTER TABLE personel ADD cinsiyet varchar(1)
ALTER TABLE personel DROP COLUMN cinsiyet;--Tablodaki column silme

--DROP: Veritabanýya da tablo silmek için kullanýlan komuttur
DROP DATABASE vizeHazirlik  -- veri tabanýný siler
DROP TABLE personel  -- Tabloyu siler veritabanýndan

--TRUNCATE: Tablonun içindeki verileri siler,ancak tablonun kendisini silmez.
TRUNCATE DATABASE vizeHazirlik
TRUNCATE TABLE personel

--INSERT INTO: Veritabanýna kayýt eklemek için kullanýlýr
INSERT INTO personel values('Dilara','Polat','Elazýð',21,3000,'Türkiye','K')
INSERT INTO personel values('Tugba','Yýlmaz','Lahey',85,4000,'Hollanda','K')
INSERT INTO personel values('Helena','Polat','New York',41,3500,'ABD','K')
INSERT INTO personel values('Ayþe','Sarý','Brüksel',30,2000,'Belçika','K')
INSERT INTO personel values('Ali','Top','Berlin',28,2500,'Almanya','E')
INSERT INTO personel values('Ahmet','Peri','Konya',10,5000,'Türkiye','E')
INSERT INTO personel values('Ahmet','Çiçek','Konya',10,5000,'Türkiye','E')
INSERT INTO personel values('Mehemet','Çiçek','Konya',10,4200,'Türkiye','E')
INSERT INTO personel values('Aslý','Çiçek','Karaman',10,5000,'Türkiye','K')

INSERT INTO personel (isim,soyisim,yas,maas)values('Lara','Timur',20,3000)

--UPDATE: Veritabanýnda bulunan verileri deðiþtirmek(güncellemek)amacýyla kullanýlan bir deyimdir.
select*from personel
UPDATE personel set soyisim='Kaya' where id=7 --eger where sarti eklemeseydik soyisim sütunundaki tum verileri 'Kaya' yapardý.
UPDATE personel set yas=19 where id=9

--DELETE :  Veritabanýnda bulunan bir tablodaki istenilen kayýtlarý silmek amacýyla kullanýlan bir SQL komutudur.
DELETE FROM personel where id=1
INSERT INTO personel  values('Dilara','Polat','Elazýð',21,3000,'Türkiye','K')

--•GRANT: Belirtilen kiþiye ya da gruba veri kullanma ve komut çalýþtýrma izni verir.
--•DENY: Ýþlem yapmak için verilen izinleri kýsýtlar ya da kaldýrýr.
--•REVOKE: Verilen tüm izinleri iptal eder.

--LIKE
select*from personel
Select *from personel where ulke like '%i%'
Select *from personel where ulke like 't%'
Select *from personel where ulke like '%D'
Select *from personel where ulke like '%ye'
Select *from personel where ulke like '%i_a'
Select *from personel where ulke like '%[a,b]'--sonu a veya b ile biten ulkeleri getirir
Select *from personel where ulke like '%[a-d]'-- sonu a dan d ye olanlarý getirir

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
select sehir from personel where sehir is not null group  by sehir  --null olan sehirler dýsýndakileri grupandýrýdý 
select sehir from personel  group  by sehir 
select sehir from personel where sehir!='Berlin' group  by sehir  --neden null almadý  <HOCAYA SOR>
select sehir ,maas from personel    group  by sehir having  sehir !='New York' --neden null almadý
select *from personel
select ulke,avg(maas) from personel group by ulke 
-- ulke gore gruplayan maasý 3000'den buyukleri personel bilgilerini getiren sql sorgusunu yazýnýz
select ulke from personel where maas>3000 group by ulke

--soyisme gore gruplayan max yas'dan  olan personelleri getiren sql sorguyu yazýnýz
select *from personel
select soyisim,max(yas),min(yas) from personel group by soyisim having max(yas)<20
select soyisim,max(yas),min(yas) from personel group by soyisim having max(yas)>20

