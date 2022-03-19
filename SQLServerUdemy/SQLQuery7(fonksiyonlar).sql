--2.01.2022

use DbOgrenciNot 
select *from TBL_NOTLAR
SELECT *FROM TBL_OGRENCILER
select *from TBL_KULUPLER

--AVG VE SUM FONKSIYONLARI
select sum(SINAV1) from TBL_NOTLAR where OGRENCI=1
select SINAV1 ,DERS from TBL_NOTLAR WHERE OGRENCI=1

SELECT DERSAD,SINAV1 FROM TBL_NOTLAR INNER JOIN TBLDERSLER ON
TBLDERSLER.DERSID=TBL_NOTLAR.DERS WHERE OGRENCI=1

--Ay�e ��nar'�n notlar�n� g�r�nt�lemek istiyorum
SELECT DERSAD,SINAV1 FROM TBL_NOTLAR INNER JOIN TBLDERSLER ON
TBLDERSLER.DERSID=TBL_NOTLAR.DERS WHERE OGRENCI=(SELECT OGRID FROM TBL_OGRENCILER WHERE OGRAD='AY�E' AND OGRSOYAD='�INAR')

SELECT SUM(SINAV1) FROM TBL_NOTLAR INNER JOIN TBLDERSLER ON
TBLDERSLER.DERSID=TBL_NOTLAR.DERS WHERE OGRENCI=(SELECT OGRID FROM TBL_OGRENCILER WHERE OGRAD='AY�E' AND OGRSOYAD='�INAR')

--Ay�e ��nar'�n algoritma dersinde alm�� oldu�u 1s�nav s�n�f ortalamas�n�n �st�nde mi alt�nda m� belirten sorgu
select *,'ustunde','durum' from TBL_NOTLAR SELECT s�nav1 FROM TBL_NOTLAR 
INNER JOIN TBLDERSLER ON
TBLDERSLER.DERSID=TBL_NOTLAR.DERS 
WHERE  DERSAD='Algoritma' and AVG(SINAV1)>(SELECT SUM(SINAV1) FROM TBL_NOTLAR INNER JOIN TBLDERSLER ON
TBLDERSLER.DERSID=TBL_NOTLAR.DERS WHERE OGRENCI=(SELECT OGRID FROM TBL_OGRENCILER WHERE OGRAD='AY�E' AND OGRSOYAD='�INAR'))


--ALFABET�K FONKSIYONLAR
--Upper ve Lower Fonksiyonlar�
select upper('hello') as 'Column'--buyuk harfe donusturur
select upper(ograd) as 'ogrenci ad�' from TBL_OGRENCILER

select lower(OGRSEHIR) as 'sehir' from TBL_OGRENCILER

--Substring Fonksiyonu
select substring(OGRAD,1,2)+'.'+OGRSOYAD as 'ogrsoyad' from TBL_OGRENCILER

--soru:kulup ad�n�n ilk 3 hanesini getiren sorgu
select substring(OGRAD,1,2)+'.'+OGRSOYAD as 'ogrsoyad',substring(KULUPAD,1,3) from TBL_OGRENCILER
INNER JOIN TBL_KULUPLER on 
TBL_KULUPLER.KULUPID=TBL_OGRENCILER.OGRKULUP

--Left ve Right Komutlar�
select left('HELLO WORLD',5)--Soldan sadece 5 harfi ald�
select ders,avg(ortalama) from TBL_NOTLAR group by ders
select dersad,avg(ortalama) from TBL_NOTLAR INNER JOIN TBLDERSLER ON TBLDERSLER.DERSID=TBL_NOTLAR.DERS group by DERSAD
select left(dersad,3),avg(ortalama) from TBL_NOTLAR INNER JOIN TBLDERSLER ON TBLDERSLER.DERSID=TBL_NOTLAR.DERS group by DERSAD
--ondal�kl� ifadede de ilk iki basamag� getir
select left(dersad,3),cast(avg(ortalama) as decimal(4,2)) from TBL_NOTLAR INNER JOIN TBLDERSLER ON TBLDERSLER.DERSID=TBL_NOTLAR.DERS group by DERSAD

--Len Kullan�m�
select len(OGRSEHIR) from TBL_OGRENCILER 

select ograd,len(OGRAD) as OgradUzunlugu,OGRKULUP from TBL_OGRENCILER where OGRSEHIR='Edirne'and 
OGRKULUP=(select KULUPID from TBL_KULUPLER where KULUPAD='Bili�im')

--soru:ismi 3 ve 4 karakterli ogrencileeei getireciegim
select * from TBL_OGRENCILER where len(ograd)=3 or len(ograd)=4

--soru:isim +soyisim 3 ve 7 karakter aras�nda olan ogrencileri getiriniz
select *from TBL_OGRENCILER where (len(ograd)+len(ogrsoyad))>=3 and (len(ograd)+len(ogrsoyad))<=7 

--Ltrim ve Rtrim Replace Komutlar�
select ltrim('    korkma sonmez bu safaklarda')--soldaki boslugu kald�r�yor
select rtrim('    korkma sonmez bu safaklarda         ')--sagdaki boslugu kald�r�yor
select replace('murat y�ceda�' ,'y�ceda�','Y.da�')
select replace('merhaba bug�n hava soguk' ,'�','u')
--1.para�etre ana c�mle 2.cumle bulunacak deger, 3.cumle yeni deger

--CharIndex Kullan�m�

select CHARINDEX('a','SQL Derslerine Devam Ediyoruz')--19. karakterde buluyor
select CHARINDEX('a','SQL Derslerine Devam Ediyoruz',15)--15.karakterden sonra bul

select CHARINDEX('a',ograd) from TBL_OGRENCILER
select REVERSE(dersad) from TBLDERSLER--Terseten yazma

--GENEL TEKRAR
--DDL KOMUTLARI GENEL TEKRAR
create database SatisVT
use SatisVT

create table TBL_KATEGORI(
KATEGORIID tinyint identity(1,1) primary key,
KATEGORIADI VARCHAR(50)
)

create table TBL_URUNLER(
URUNID INT IDENTITY(1,1) PRIMARY KEY,
URUNAD VARCHAR(50),
URUNMARKA VARCHAR(50),
KATEGORI TINYINT,
URUNALISFIYATI DECIMAL(18,2),
URUNSATISFIYATI DECIMAL(18,2),
URUNSTOK SMALLINT check(URUNSTOK>0), --Negatif deger girilmesne izin verilmesin
URUNDURUM BIT DEFAULT '1'
)

create table TBL_PERSONEL(
PERSONELID SMALLINT IDENTITY(1,1) PRIMARY KEY,
PERSONELADSOYAD VARCHAR(50)
)

create table TBL_MUSTERI(
MUSTERIID INT PRIMARY KEY IDENTITY(1,1),
MUSTERIAD VARCHAR(50),
MUSTERISOYAD VARCHAR(50),
MUSTERISEHIR VARCHAR(13),
MUSTERIBAKIYE DECIMAL(18,2)
)

create table TBL_HAREKET(
HAREKETID INT PRIMARY KEY IDENTITY(1,1),
URUN INT,
MUSTERI INT,
PERSONEL SMALLINT,
ADET INT,
TUTAR DECIMAL(18,2),
TARIH SMALLDATETIME
)

TRUNCATE TABLE TBL_URUNLER--Urunler tablosunu s�f�rl�yoruz

--Veri ekleme i�lemi
INSERT INTO TBL_KATEGORI (KATEGORIADI) VALUES('B�LG�SAYAR')
INSERT INTO TBL_KATEGORI (KATEGORIADI) VALUES('BEYAZ E�YA')
INSERT INTO TBL_KATEGORI (KATEGORIADI) VALUES('K���K EV ALET�')
INSERT INTO TBL_KATEGORI (KATEGORIADI) VALUES('TV')

INSERT INTO TBL_URUNLER (URUNAD,URUNMARKA,KATEGORI,URUNALISFIYATI,URUNSATISFIYATI,URUNSTOK)
VALUES('BUZDOLABI','SIEMENS',2,4356,4588,10)

SELECT*FROM TBL_URUNLER
SELECT *FROM TBL_KATEGORI

UPDATE TBL_URUNLER SET URUNAD='KETIL' WHERE URUNAD='SU ISITICI'
UPDATE TBL_URUNLER SET URUNAD='SU ISITICI' WHERE URUNAD='KETIL'

SELECT KATEGORIADI, COUNT(*) AS 'TOPLAM �R�N' FROM TBL_URUNLER INNER JOIN TBL_KATEGORI ON
TBL_KATEGORI.KATEGORIID=TBL_URUNLER.KATEGORI GROUP BY KATEGORIADI ORDER BY COUNT(*)

--Kategori ad� bilgisayar olan �r�nleri sat�� fiyat�na 500 tl zam yapal�m
update TBL_URUNLER set URUNSATISFIYATI=URUNSATISFIYATI+500 where
KATEGORI=(select KATEGORIID from TBL_KATEGORI where KATEGORIADI ='B�LG�SAYAR')

--SORU: Tv kategorisinde �r�nleri sat�� fiyat�na 510 indirim yapan sorguyu yaz�n�z
update TBL_URUNLER set URUNSATISFIYATI=URUNSATISFIYATI-(URUNSATISFIYATI*0.1) where
KATEGORI=(select KATEGORIID from TBL_KATEGORI where KATEGORIADI ='TV')

SELECT COUNT(*) AS 'Ka� afkl� �r�n',sum(urunstok)AS 'stok say�s�' FROM TBL_URUNLER

--Budolab�ndan elde eti�im kar:
select URUNID,URUNAD ,URUNMARKA,KATEGORIADI ,URUNSATISFIYATI,URUNALISFIYATI,URUNSTOK,
(URUNSATISFIYATI-URUNALISFIYATI) AS 'KAR',
(URUNSATISFIYATI-URUNALISFIYATI)*URUNSTOK AS 'TOPLAM KAR'
from TBL_URUNLER
INNER JOIN TBL_KATEGORI ON
TBL_KATEGORI.KATEGORIID=TBL_URUNLER.KATEGORI

--PROSED�RLER
--Prosed�r kullan�m� : Kullan�m� uzun olan sorgular� k�saltarak i�imizi kolayla�t�r�r

SELECT*FROM TBL_HAREKET
SELECT*FROM TBL_PERSONEL

CREATE PROCEDURE HAREKETLER
AS
SELECT HAREKETID,URUNAD,MUSTERIAD,PERSONELADSOYAD,ADET, TUTAR,TARIH
FROM TBL_HAREKET
INNER JOIN TBL_URUNLER ON
TBL_HAREKET.URUN=TBL_URUNLER.URUNID
INNER JOIN TBL_MUSTERI ON
TBL_HAREKET.MUSTERI=TBL_MUSTERI.MUSTERIID
INNER JOIN TBL_PERSONEL ON
TBL_HAREKET.PERSONEL=TBL_PERSONEL.PERSONELID
--Programmability ->stored procedure->system procedure
execute HAREKETLER

--Procedure silme ve g�ncelleme drop & alter

create procedure Deneme
as
select *from TBL_URUNLER where URUNSTOK>10

exec Deneme

drop procedure Deneme

ALTER PROCEDURE [dbo].[HAREKETLER]
AS
SELECT HAREKETID,URUNAD,LEFT(MUSTERIAD,1)+'.',PERSONELADSOYAD,ADET, TUTAR,TARIH
FROM TBL_HAREKET
INNER JOIN TBL_URUNLER ON
TBL_HAREKET.URUN=TBL_URUNLER.URUNID
INNER JOIN TBL_MUSTERI ON
TBL_HAREKET.MUSTERI=TBL_MUSTERI.MUSTERIID
INNER JOIN TBL_PERSONEL ON
TBL_HAREKET.PERSONEL=TBL_PERSONEL.PERSONELID

EXEC HAREKETLER

--Paremetreli procedure Kullan�m�

create procedure URUNGETIR
@Deger varchar(50)='Buzdolab�'
as
select URUNAD,URUNSTOK,URUNMARKA from TBL_URUNLER
where URUNAD=@Deger

execute URUNGETIR @Deger='�ama��r Makinesi'

DROP procedure URUNGETIR

--Soru:stok say�s� d�sardan girilen degerden buyuk olan urunleri getiren procedure'lar� getirin
create procedure STOKSAYISI
@Deger int
as
select *from TBL_URUNLER where URUNSTOK>@Deger

execute STOKSAYISI @Deger=15



