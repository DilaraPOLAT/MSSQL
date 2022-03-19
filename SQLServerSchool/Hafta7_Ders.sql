use VTDERS21EKIM
--HAFTA 7 DERS ILISKISEL VERITABANLARI-VIZE SORUSU
select *from kisiler
select *from personel
select *from uyeler

select *from kisiler ,personel
select isim from uyeler, personel--Hata verir cunku hangi tablonun isim sutunu
select uye_adi from personel,uyeler
select uyeler.isim from uyeler, personel
select u.CINSIYET, u.ISIM,u.SOYISIM from uyeler u

create database VT_ALISVERIS
use VT_ALISVERIS

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

CREATE TABLE TblAlisverisKayit(
alisveris_id INT PRIMARY KEY IDENTITY(1,1),
musteri_id INT FOREIGN KEY REFERENCES TblMusteriler(id),
urun_id INT FOREIGN KEY REFERENCES TblUrunler(id),
adet INT NOT NULL,
tarih datetime DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO TblMusteriler Values('Ali','Kaya','05555555555','alikaya@gmail.com'),
                                ('Vei','DAÐLI','05555555444','velidaðli@gmail.com'),
								('Ayþe','BÝLÝR','05555555333','aysebilir@gmail.com')
INSERT INTO TblUrunKatagori VALUES
('GIDA'),('SARKUTERÝ'),('CÝKOLATA'),('BÝSKÜVÝ'),('UNLU MAMAÜLLER'),('TEMÝZLÝK ÜRÜNLERÝ')

select *from TblMusteriler
update TblMusteriler set soyisim='KAYA' where id=1

INSERT INTO TblUrunler VALUES('Çay',29.75,'113',1),
                             ('Ekmek',1.4,'114',5),
							 ('Halley',1.5,'115',4),
							 ('Negro',2.5,'116',4),
							 ('Deterjan',35.55,'117',6),
							 ('Ayçiçek yaðý',98.55,'118',1),
							 ('Gevrek',15.25,'119',5)
					

INSERT INTO TblAlisverisKayit (musteri_id , urun_id , adet) VALUES (1,2,5),
                                                                   (2,5,3),
															       (3,7,10),
															       (1,8,4)


INSERT INTO TblUrunler VALUES ('Ayçiçek yaðý',98.55,'118',1),
							 ('Gevrek',15.25,'119',5)

select TblMusteriler.isim, TblMusteriler.soyisim,TblUrunler.ad, TblUrunler.fiyat,TblAlisverisKayit.tarih
from((TblAlisverisKayit
INNER JOIN TblMusteriler ON TblAlisverisKayit.musteri_id=TblMusteriler.id)
INNER JOIN TblUrunler ON TblAlisverisKayit.urun_id=TblUrunler.id)
--n-1

