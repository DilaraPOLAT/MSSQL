--DDL KOMUTLARI

Create Table TBLDERSLER
(
  DERSID tinyint,
  DERSAD varchar(20)
)

Alter Table TBLDERSLER
add KONTENJAN smallint --(De�i�iklik yapt�k add ile ekleme drop ile silme)

Alter Table TBLDERSLER
Drop Column KONTENJAN

--DML KOMUTLARI

Select OGRAD,OGRSOYAD from TBL_OGRENCILER

Select* from TBL_OGRENCILER
Select* from TBL_OGRENCILER where OGRID=1
Select OGRCINSIYET from TBL_OGRENCILER where OGRAD='Emel'--Emel ad�ndaki ki�i veya ki�ilerin cinsiyet bilgisini getirir.
