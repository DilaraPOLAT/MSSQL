--1.01.2022 
--Birlestirme islemleri
select *from TBLDERSLER
select *from TBL_NOTLAR
select *from TBL_OGRENCILER


select NOTID,DERSAD from TBL_NOTLAR 
INNER JOIN TBLDERSLER ON TBL_NOTLAR.DERS=TBLDERSLER.DERSID

select NOTID,DERSAD ,OGRAD,SINAV1,SINAV2,SINAV3,ORTALAMA,DURUM from TBL_NOTLAR 
INNER JOIN
TBLDERSLER ON TBL_NOTLAR.DERS=TBLDERSLER.DERSID
INNER JOIN
TBL_OGRENCILER ON TBL_NOTLAR.OGRENCI=TBL_OGRENCILER.OGRID

select NOTID,DERSAD ,OGRAD+ ' '+OGRSOYAD AS ADSOYAD,SINAV1,SINAV2,SINAV3,ORTALAMA,DURUM from TBL_NOTLAR 
INNER JOIN
TBLDERSLER ON TBL_NOTLAR.DERS=TBLDERSLER.DERSID
INNER JOIN
TBL_OGRENCILER ON TBL_NOTLAR.OGRENCI=TBL_OGRENCILER.OGRID

select NOTID,DERSAD ,OGRAD+ ' '+OGRSOYAD AS ADSOYAD,SINAV1,SINAV2,SINAV3,ORTALAMA,DURUM from TBL_NOTLAR 
INNER JOIN
TBLDERSLER ON TBL_NOTLAR.DERS=TBLDERSLER.DERSID
INNER JOIN
TBL_OGRENCILER ON TBL_NOTLAR.OGRENCI=TBL_OGRENCILER.OGRID

--ALT SORGULAR (SUBQUERY)
update TBL_NOTLAR SET ORTALAMA=(SINAV1+SINAV2+SINAV3)/3 where DERS=1
update TBL_NOTLAR SET DURUM='True' where ORTALAMA>=50 and ders=1 -- ya da -> update TBL_NOTLAR SET DURUM=1 where ORTALAMA>=50 and ders=1
update TBL_NOTLAR SET DURUM='False' where ORTALAMA<=50 and ders=1

--Dersler tablosunda ismi matematik olan derse ait s�nav bilgisini getiren sorguyu yaz�n�z
select DERS,SINAV1,SINAV2,SINAV3,ORTALAMA,DURUM from TBLDERSLER
INNER JOIN TBL_NOTLAR ON
TBL_NOTLAR.DERS=TBLDERSLER.DERSID
WHERE DERSID=1

--SUB QUERY
SELECT *FROM TBL_NOTLAR WHERE DERS=(SELECT DERSID FROM TBLDERSLER WHERE DERSAD='MATEMAT�K')
--Dersler tablosundaki dersad� algoritma olan notlar tablosundaki en yuksek notu olan�n bilgilirini getiren sorgu
SELECT TOP 1*  FROM TBL_NOTLAR WHERE DERS=(SELECT DERSID FROM TBLDERSLER WHERE DERSAD='ALGOR�TMA') ORDER BY ORTALAMA DESC


--INNER JOIN
SELECT OGRENCI FROM TBL_NOTLAR
SELECT OGRID FROM TBL_OGRENCILER
--Ogrenciler tablosundaki 11 ve 12.kay�tlar yok notlar tabalosundan

SELECT * FROM TBL_NOTLAR
INNER JOIN TBL_OGRENCILER ON 
TBL_OGRENCILER.OGRID=TBL_NOTLAR.OGRENCI

--LEFT RIGHT JOIN
SELECT * FROM TBL_NOTLAR
RIGHT JOIN TBL_OGRENCILER ON 
TBL_OGRENCILER.OGRID=TBL_NOTLAR.OGRENCI
--mehmet ve bernay�da getirdi

--FULL JOIN ->Tum tablolar� birlestirir
SELECT * FROM TBL_NOTLAR
FULL JOIN TBL_OGRENCILER ON 
TBL_OGRENCILER.OGRID=TBL_NOTLAR.OGRENCI

--UNION JOIN -> �ki tabloyu birle�tirir
SELECT *FROM TBL_KULUPLER UNION SELECT *FROM TBLDERSLER

--AR�TMET�K FONKS�YONLAR
SELECT 20+4 AS TOPLAM
SELECT 20-4 AS FARK
SELECT 20*4 AS CARPIM
SELECT 20/4 AS BOLME

--S�nav2 notu 45 alt�nda olan ogrencilere 10 puan ekleyelim
SELECT *FROM TBL_NOTLAR
UPDATE TBL_NOTLAR SET SINAV2=SINAV2+10 WHERE SINAV2<45 AND DERS=1

SELECT AVG(ORTALAMA) FROM TBL_NOTLAR WHERE DERS=1

--s�n�f ortalamas�n�n alt�nda olan ogrencilerin durum 2 sutunlar�n yan�nda alt�nda aksi durumda ustunde yazd�ran sorguyu yaz�n�z
SELECT*,'�st�nde' as 'DURUM2' FROM TBL_NOTLAR
WHERE  ORTALAMA>(SELECT AVG(ORTALAMA) FROM TBL_NOTLAR WHERE DERS IN(1,2))
union  select*,'Alt�nda' as 'DURUM2'
FROM TBL_NOTLAR WHERE  ORTALAMA<(SELECT AVG(ORTALAMA)  FROM TBL_NOTLAR  WHERE DERS IN (1,2))

SELECT*,'�st�nde' as 'DURUM2' FROM TBL_NOTLAR
WHERE  ORTALAMA>(SELECT AVG(ORTALAMA) FROM TBL_NOTLAR WHERE DERS IN(1,2))
union  select*,'Alt�nda' as 'DURUM2'
FROM TBL_NOTLAR WHERE  ORTALAMA<(SELECT AVG(ORTALAMA)  FROM TBL_NOTLAR  WHERE DERS IN (1,2))

--Matematiksel Fonksiyonlar

--ABS - >Mutlak deger
select abs (-85) as mutlak
--Power ->ust almal i�in kullan�l�r
select power(2,4) as ust--16
--SQRT ->Karekok
select SQRT(225) as karekok
--Floor-> taban
select floor(4.86) as taban
--CEILING-> tavan
select ceiling(4.86) as tavan

--SUM VE AVG FONKS�YONLARI














