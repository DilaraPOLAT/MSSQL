CREATE DATABASE VT_ALISVERIS2
use VT_ALISVERIS2
--HAFTA 8 DERS
CREATE TABLE TblMusteriler(
id INT PRIMARY KEY IDENTITY(1,1),
isim VARCHAR(30) NOT NULL,
soyisim VARCHAR(30) NOT NULL,
ceptel CHAR(11) NOT NULL,
mail VARCHAR(30) NOT NULL,

);

CREATE TABLE TblUrunKatagori(
id INT PRIMARY KEY IDENTITY(1,1),
kategori VARCHAR(50) NOT NULL
);

CREATE TABLE TblUrunler(
id INT PRIMARY KEY IDENTITY(1,1),
ad VARCHAR(50) NOT NULL,
fiyat FLOAT NOT NULL,
barkod VARCHAR(30) NOT NULL,
urun_kategori_id INT FOREIGN KEY REFERENCES TblUrunKatagori(id)
);

CREATE TABLE TblMusteriAlisverisTarihi(
id INT PRIMARY KEY IDENTITY(1,1),
tarih datEtime DEFAULT CURRENT_TIMESTAMP--Pembe renkli olanlar MsSQL hazýr fonksiyonlar gun ay yýl saaat dakikayý otomotik alýyor
);

CREATE TABLE TblAlisverisKayit(
alisveris_id INT FOREIGN KEY  REFERENCES TblMusteriAlisverisTarihi(id),
musteri_id INT FOREIGN KEY REFERENCES TblMusteriler(id),
urun_id INT FOREIGN KEY REFERENCES TblUrunler(id),
urun_fiyat FLOAT NOT NULL,
adet INT NOT NULL,
);

--------------------------------------------------------------------------
INSERT INTO TblMusteriler Values('Ali','Kaya','05555555555','alikaya@gmail.com'),
                                ('Vei','DAÐLI','05555555444','velidaðli@gmail.com'),
								('Ayþe','BÝLÝR','05555555333','aysebilir@gmail.com')

INSERT INTO TblUrunKatagori VALUES
('GIDA'),('SARKUTERÝ'),('CÝKOLATA'),('BÝSKÜVÝ'),('UNLU MAMAÜLLER'),('TEMÝZLÝK ÜRÜNLERÝ')

INSERT INTO TblUrunler VALUES('Peynir',15.00,'100',2),
                             ('Yumurta',23.50,'101',1),
							 ('Çay',19.50,'102',1),
							 ('Halley',1.5,'103',4),
							 ('Negro',2.5,'104',4),
							 ('Deterjan',35.55,'105',6)

-------------------------------------------------------------------------------------------
select *from TblMusteriler
select *from TblUrunler

--1.MUSTERÝYE ALISVERÝSÝ EKLEYELÝM

INSERT INTO TblMusteriAlisverisTarihi(tarih) values (CURRENT_TIMESTAMP);
select *from TblMusteriAlisverisTarihi
--Primary key olmayan tablo zayýf tablodur
SELECT *FROM TblAlisverisKayit

DECLARE @fiyat float set @fiyat=(SELECT fiyat from TblUrunler where id=1)
--Declare kýsmý anlýk kaydedildiði icin beraber kullanýlacagý yer ile calsýtýrýlmalý
INSERT INTO TblAlisverisKayit(alisveris_id,musteri_id,urun_id,urun_fiyat,adet) 
VALUES (1,1,1,@fiyat,3)--peynir

DECLARE @fiyat float set @fiyat=(SELECT fiyat from TblUrunler where id=3)
INSERT INTO TblAlisverisKayit(alisveris_id,musteri_id,urun_id,urun_fiyat,adet) 
VALUES (1,1,3,@fiyat,4)--çay

DECLARE @fiyat float set @fiyat=(SELECT fiyat from TblUrunler where id=5)
INSERT INTO TblAlisverisKayit(alisveris_id,musteri_id,urun_id,urun_fiyat,adet) 
VALUES (1,1,5,@fiyat,4)--negro



--2.MUSTERÝYE ALISVERÝSÝ EKLEYELÝM

SELECT *FROM TblAlisverisKayit

INSERT INTO TblMusteriAlisverisTarihi(tarih) values (CURRENT_TIMESTAMP);
select *from TblMusteriAlisverisTarihi

DECLARE @fiyat float set @fiyat=(SELECT fiyat from TblUrunler where id=1)
INSERT INTO TblAlisverisKayit(alisveris_id,musteri_id,urun_id,urun_fiyat,adet) 
VALUES (2,2,1,@fiyat,3)--peynir

DECLARE @fiyat float set @fiyat=(SELECT fiyat from TblUrunler where id=2)
INSERT INTO TblAlisverisKayit(alisveris_id,musteri_id,urun_id,urun_fiyat,adet) 
VALUES (2,2,2,@fiyat,5)--yumurta

DECLARE @fiyat float set @fiyat=(SELECT fiyat from TblUrunler where id=6)
INSERT INTO TblAlisverisKayit(alisveris_id,musteri_id,urun_id,urun_fiyat,adet) 
VALUES (2,2,6,@fiyat,5)--deterjan
---------------------------------------------------------------------------------

--SELECT WHERE ÝLE 4 TABLODAN SORGU CEKMEK
SELECT TblAlisverisKayit.alisveris_id, TblMusteriler.isim,TblMusteriler.soyisim,TblUrunler.ad,
TblUrunler.fiyat  GUNCEL_FIYAT, TblAlisverisKayit.urun_fiyat ESKI_FIYAT, TblAlisverisKayit.adet,
TblMusteriAlisverisTarihi.tarih
FROM TblAlisverisKayit,TblMusteriler,TblUrunler,TblMusteriAlisverisTarihi
WHERE((TblMusteriler.id=TblAlisverisKayit.musteri_id) and (TblUrunler.id=TblAlisverisKayit.urun_id))
and (TblAlisverisKayit.alisveris_id=TblMusteriAlisverisTarihi.id)

--SELECT INNER JOIN ÝLE 4 TABLODAN SORGU CEKME
SELECT TblAlisverisKayit.alisveris_id, TblMusteriler.isim,TblMusteriler.soyisim,TblUrunler.ad,
TblUrunler.fiyat  GUNCEL_FIYAT, TblAlisverisKayit.urun_fiyat ESKI_FIYAT, TblAlisverisKayit.adet,
TblMusteriAlisverisTarihi.tarih
FROM(TblAlisverisKayit 
INNER JOIN TblMusteriler ON TblAlisverisKayit.musteri_id=TblMusteriler.id
INNER JOIN TblUrunler ON TblAlisverisKayit.urun_id=TblUrunler.id
INNER JOIN TblMusteriAlisverisTarihi ON TblAlisverisKayit.alisveris_id=TblMusteriAlisverisTarihi.id)
--NOT: 4 tablodan bilgi cekersem 3 inner joýn kullanýrým

-----------------------------------------------------------------------------------
--BIRINCI MUSTERI deterjan, yumurta  ve çayý tek bir alýsveriste alýrsa 

UPDATE TblUrunler SET fiyat =17.25 where id=1
select *from TblUrunler
SELECT *FROM TblAlisverisKayit

INSERT INTO TblMusteriAlisverisTarihi(tarih) values (CURRENT_TIMESTAMP);
select *from TblMusteriAlisverisTarihi

DECLARE @fiyat float set @fiyat=(SELECT fiyat from TblUrunler where id=1)
INSERT INTO TblAlisverisKayit(alisveris_id,musteri_id,urun_id,urun_fiyat,adet) 
VALUES (2,2,1,@fiyat,3)--peynir

DECLARE @fiyat float set @fiyat=(SELECT fiyat from TblUrunler where id=2)
INSERT INTO TblAlisverisKayit(alisveris_id,musteri_id,urun_id,urun_fiyat,adet) 
VALUES (2,2,2,@fiyat,5)--yumurta

DECLARE @fiyat float set @fiyat=(SELECT fiyat from TblUrunler where id=6)
INSERT INTO TblAlisverisKayit(alisveris_id,musteri_id,urun_id,urun_fiyat,adet) 
VALUES (2,2,6,@fiyat,5)--deterjan

--SELECT INNER JOIN ÝLE 5 TABLODAN SORGU CEKME
SELECT TblAlisverisKayit.alisveris_id, TblMusteriler.isim,TblMusteriler.soyisim,TblUrunler.ad,
TblUrunKatagori.kategori, TblUrunler.fiyat  GUNCEL_FIYAT, TblAlisverisKayit.urun_fiyat SATIS_FIYAT, TblAlisverisKayit.adet,
TblMusteriAlisverisTarihi.tarih
FROM(TblAlisverisKayit 
INNER JOIN TblMusteriler ON TblAlisverisKayit.musteri_id=TblMusteriler.id
INNER JOIN TblUrunler ON TblAlisverisKayit.urun_id=TblUrunler.id
INNER JOIN TblMusteriAlisverisTarihi ON TblAlisverisKayit.alisveris_id=TblMusteriAlisverisTarihi.id
INNER JOIN TblUrunKatagori ON TblUrunler.urun_kategori_id= TblUrunKatagori.id);


--update ruls, delete ruls arastýr diyelim ki urunler tablosunda sildigimiz urunu kayýt tablosunda nasýl tutulur.
--Yumusak silme islemi: aktif diye bir sutun olustururuz binary boolean olarak silindi i silinmedi mi anlayabiliriz.

							 

