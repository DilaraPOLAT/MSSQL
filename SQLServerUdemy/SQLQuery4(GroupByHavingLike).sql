--GRUPLANDIRMALAR
use DbOgrenciNot
SELECT *FROM TBL_OGRENCILER

SELECT OGRSEHIR, COUNT(*) as'Toplam' FROM TBL_OGRENCILER GROUP BY OGRSEHIR

SELECT OGRCINSIYET ,COUNT(*) AS 'Toplam' FROM TBL_OGRENCILER GROUP BY OGRCINSIYET

Update TBL_NOTLAR  set ORTALAMA=(sýnav1+sýnav2+sýnav3)/3 
UPDATE TBL_NOTLAR SET DURUM=1 WHERE ORTALAMA>=50
UPDATE TBL_NOTLAR SET DURUM=0 WHERE ORTALAMA<50

SELECT OGRKULUP ,COUNT(*)AS'Toplam' FROM TBL_OGRENCILER GROUP BY OGRKULUP
SELECT OGRCINSIYET ,COUNT(*)AS'Toplam' FROM TBL_OGRENCILER GROUP BY OGRCINSIYET
SELECT DURUM ,COUNT(*)AS'Toplam' FROM TBL_NOTLAR GROUP BY DURUM

--HAVING KOMUTU
SELECT OGRSEHIR , COUNT(*) AS'SAYI' FROM TBL_OGRENCILER GROUP BY OGRSEHIR HAVING COUNT(*)=1

SELECT OGRKULUP ,COUNT(*) AS'SAYI' FROM TBL_OGRENCILER GROUP BY OGRKULUP HAVING OGRKULUP='Biliþim'

SELECT DURUM,COUNT(*) AS 'GECENLER' FROM TBL_NOTLAR GROUP BY DURUM HAVING DURUM=1

SELECT DURUM,COUNT(*) AS 'KALANLAR' FROM TBL_NOTLAR GROUP BY DURUM HAVING DURUM=0

--LIKE KOMUTU(icerisinde istedigimiz degerin olup olmadigini belirtir)
SELECT *FROM TBL_OGRENCILER where OGRAD Like '%a%' AND OGRSOYAD Like '%a%'
SELECT * FROM TBL_OGRENCILER where OGRAD Like '%e_' or OGRCINSIYET Like '%ý_'
select *from TBL_OGRENCILER where OGRKULUP  not like '_i%'

--DISTINCT KOMUTU(Tekrarasiz olrak getiriyor)
Select Distinct OGRSEHIR from TBL_OGRENCILER
select distinct OGRCINSIYET from TBL_OGRENCILER 
select distinct OGRKULUP from TBL_OGRENCILER where OGRCINSIYET like '%ý_'
select count (distinct OGRSEHIR) from TBL_OGRENCILER

--ORDER BY KOMUTU(Sýralama islemlerinde kullaniliyor enable asc seklinde kucukten buyuge)
select * from TBL_OGRENCILER order by OGRAD desc
select *from TBL_NOTLAR
select SINAV1 FROM TBL_NOTLAR ORDER BY SINAV1
SELECT distinct OGRSEHIR FROM TBL_OGRENCILER ORDER BY OGRSEHIR desc

--LIKE ISARETLERI
select *from TBL_OGRENCILER where OGRSEHIR like '%ir_%'
select *from TBL_OGRENCILER where OGRAD like '%[A,B]%'  --Adýnýn icinden a veya b bulunanlarý listeledi
select *from TBL_OGRENCILER where OGRAD like '[A,B]%'  --Adý  a veya b ile baslayanlarý listeledi
select *from TBL_OGRENCILER where OGRAD like '%[n,i]'  --Adý  n veya i ile sonlananlarý listeledi
select *from TBL_OGRENCILER where OGRKULUP like '[a-h]%'  --Kulup adi a'dan h'ye baslayanlari listeledi

--TOP VE PERCENT KOMUTLARI(Istedigimiz sayidakileri listeler orn ilk uc kisiyi)
select top 3 OGRAD from TBL_OGRENCILER 
select *from TBL_OGRENCILER
select distinct top 3 OGRAD from TBL_OGRENCILER--Hocaya sor
select *from TBL_OGRENCILER
select top 4* from TBL_OGRENCILER order by OGRID desc
select top 60 percent *from TBL_OGRENCILER  --tblOgrencilerin %60'ný getirdi.

--in not in  KULLANIMI
select *from TBL_OGRENCILER where OGRSEHIR in('izmir','ankara','edirne')
select * from TBL_NOTLAR where SINAV1 in (85,88,45)

--BETWEEN(aralýk belirtmemizi saglýyor)
select *from TBL_NOTLAR where SINAV1 between 45 and 85
select*from TBL_NOTLAR where ortalama between 75 and 100
select *from TBL_OGRENCILER where OGRSEHIR between 'A' and 'F'  --between son sart kapsamýyor e yazdýgýmda e harfinde olan sehirleri
  --getirmedi f yazdýgýmda e harfinde baslayan sehirleri getirdi.
select *from TBL_OGRENCILER where OGRAD not between 'A' and 'K'


