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

--Ayþe çýnar'ýn notlarýný görüntülemek istiyorum
SELECT DERSAD,SINAV1 FROM TBL_NOTLAR INNER JOIN TBLDERSLER ON
TBLDERSLER.DERSID=TBL_NOTLAR.DERS WHERE OGRENCI=(SELECT OGRID FROM TBL_OGRENCILER WHERE OGRAD='AYÞE' AND OGRSOYAD='ÇINAR')

SELECT SUM(SINAV1) FROM TBL_NOTLAR INNER JOIN TBLDERSLER ON
TBLDERSLER.DERSID=TBL_NOTLAR.DERS WHERE OGRENCI=(SELECT OGRID FROM TBL_OGRENCILER WHERE OGRAD='AYÞE' AND OGRSOYAD='ÇINAR')

--Ayþe Çýnar'ýn algoritma dersinde almýþ olduðu 1sýnav sýnýf ortalamasýnýn üstünde mi altýnda mý belirten sorgu
select *,'ustunde','durum' from TBL_NOTLAR SELECT sýnav1 FROM TBL_NOTLAR 
INNER JOIN TBLDERSLER ON
TBLDERSLER.DERSID=TBL_NOTLAR.DERS 
WHERE  DERSAD='Algoritma' and AVG(SINAV1)>(SELECT SUM(SINAV1) FROM TBL_NOTLAR INNER JOIN TBLDERSLER ON
TBLDERSLER.DERSID=TBL_NOTLAR.DERS WHERE OGRENCI=(SELECT OGRID FROM TBL_OGRENCILER WHERE OGRAD='AYÞE' AND OGRSOYAD='ÇINAR'))


--ALFABETÝK FONKSIYONLAR
--Upper ve Lower Fonksiyonlarý
select upper('hello') as 'Column'--buyuk harfe donusturur
select upper(ograd) as 'ogrenci adý' from TBL_OGRENCILER

select lower(OGRSEHIR) as 'sehir' from TBL_OGRENCILER

--Substring Fonksiyonu
select substring(OGRAD,1,2)+'.'+OGRSOYAD as 'ogrsoyad' from TBL_OGRENCILER

--soru:kulup adýnýn ilk 3 hanesini getiren sorgu
select substring(OGRAD,1,2)+'.'+OGRSOYAD as 'ogrsoyad',substring(KULUPAD,1,3) from TBL_OGRENCILER
INNER JOIN TBL_KULUPLER on 
TBL_KULUPLER.KULUPID=TBL_OGRENCILER.OGRKULUP

--Left ve Right Komutlarý
select left('HELLO WORLD',5)--Soldan sadece 5 harfi aldý
select ders,avg(ortalama) from TBL_NOTLAR group by ders
select dersad,avg(ortalama) from TBL_NOTLAR INNER JOIN TBLDERSLER ON TBLDERSLER.DERSID=TBL_NOTLAR.DERS group by DERSAD
select left(dersad,3),avg(ortalama) from TBL_NOTLAR INNER JOIN TBLDERSLER ON TBLDERSLER.DERSID=TBL_NOTLAR.DERS group by DERSAD
--ondalýklý ifadede de ilk iki basamagý getir
select left(dersad,3),cast(avg(ortalama) as decimal(4,2)) from TBL_NOTLAR INNER JOIN TBLDERSLER ON TBLDERSLER.DERSID=TBL_NOTLAR.DERS group by DERSAD

--Len Kullanýmý
select len(OGRSEHIR) from TBL_OGRENCILER 

select ograd,len(OGRAD) as OgradUzunlugu,OGRKULUP from TBL_OGRENCILER where OGRSEHIR='Edirne'and 
OGRKULUP=(select KULUPID from TBL_KULUPLER where KULUPAD='Biliþim')

--soru:ismi 3 ve 4 karakterli ogrencileeei getireciegim
select * from TBL_OGRENCILER where len(ograd)=3 or len(ograd)=4

--soru:isim +soyisim 3 ve 7 karakter arasýnda olan ogrencileri getiriniz
select *from TBL_OGRENCILER where (len(ograd)+len(ogrsoyad))>=3 and (len(ograd)+len(ogrsoyad))<=7 

--Ltrim ve Rtrim Replace Komutlarý
select ltrim('    korkma sonmez bu safaklarda')--soldaki boslugu kaldýrýyor
select rtrim('    korkma sonmez bu safaklarda         ')--sagdaki boslugu kaldýrýyor
select replace('murat yücedað' ,'yücedað','Y.dað')
select replace('merhaba bugün hava soguk' ,'ü','u')
--1.paraöetre ana cümle 2.cumle bulunacak deger, 3.cumle yeni deger

--CharIndex Kullanýmý

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

TRUNCATE TABLE TBL_URUNLER--Urunler tablosunu sýfýrlýyoruz

--Veri ekleme iþlemi
INSERT INTO TBL_KATEGORI (KATEGORIADI) VALUES('BÝLGÝSAYAR')
INSERT INTO TBL_KATEGORI (KATEGORIADI) VALUES('BEYAZ EÞYA')
INSERT INTO TBL_KATEGORI (KATEGORIADI) VALUES('KÜÇÜK EV ALETÝ')
INSERT INTO TBL_KATEGORI (KATEGORIADI) VALUES('TV')

INSERT INTO TBL_URUNLER (URUNAD,URUNMARKA,KATEGORI,URUNALISFIYATI,URUNSATISFIYATI,URUNSTOK)
VALUES('BUZDOLABI','SIEMENS',2,4356,4588,10)

SELECT*FROM TBL_URUNLER
SELECT *FROM TBL_KATEGORI

UPDATE TBL_URUNLER SET URUNAD='KETIL' WHERE URUNAD='SU ISITICI'
UPDATE TBL_URUNLER SET URUNAD='SU ISITICI' WHERE URUNAD='KETIL'

SELECT KATEGORIADI, COUNT(*) AS 'TOPLAM ÜRÜN' FROM TBL_URUNLER INNER JOIN TBL_KATEGORI ON
TBL_KATEGORI.KATEGORIID=TBL_URUNLER.KATEGORI GROUP BY KATEGORIADI ORDER BY COUNT(*)

--Kategori adý bilgisayar olan ürünleri satýþ fiyatýna 500 tl zam yapalým
update TBL_URUNLER set URUNSATISFIYATI=URUNSATISFIYATI+500 where
KATEGORI=(select KATEGORIID from TBL_KATEGORI where KATEGORIADI ='BÝLGÝSAYAR')

--SORU: Tv kategorisinde ürünleri satýþ fiyatýna 510 indirim yapan sorguyu yazýnýz
update TBL_URUNLER set URUNSATISFIYATI=URUNSATISFIYATI-(URUNSATISFIYATI*0.1) where
KATEGORI=(select KATEGORIID from TBL_KATEGORI where KATEGORIADI ='TV')

SELECT COUNT(*) AS 'Kaç afklý ürün',sum(urunstok)AS 'stok sayýsý' FROM TBL_URUNLER

--Budolabýndan elde etiðim kar:
select URUNID,URUNAD ,URUNMARKA,KATEGORIADI ,URUNSATISFIYATI,URUNALISFIYATI,URUNSTOK,
(URUNSATISFIYATI-URUNALISFIYATI) AS 'KAR',
(URUNSATISFIYATI-URUNALISFIYATI)*URUNSTOK AS 'TOPLAM KAR'
from TBL_URUNLER
INNER JOIN TBL_KATEGORI ON
TBL_KATEGORI.KATEGORIID=TBL_URUNLER.KATEGORI

--PROSEDÜRLER
--Prosedür kullanýmý : Kullanýmý uzun olan sorgularý kýsaltarak iþimizi kolaylaþtýrýr

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

--Procedure silme ve güncelleme drop & alter

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

--Paremetreli procedure Kullanýmý

create procedure URUNGETIR
@Deger varchar(50)='Buzdolabý'
as
select URUNAD,URUNSTOK,URUNMARKA from TBL_URUNLER
where URUNAD=@Deger

execute URUNGETIR @Deger='Çamaþýr Makinesi'

DROP procedure URUNGETIR

--Soru:stok sayýsý dýsardan girilen degerden buyuk olan urunleri getiren procedure'larý getirin
create procedure STOKSAYISI
@Deger int
as
select *from TBL_URUNLER where URUNSTOK>@Deger

execute STOKSAYISI @Deger=15



