--9.12.2021

select *from Tblmusteriler
select *from Tblurunler
select *from TblUrunKatagori
select*from TblAlisverisKayit
select*from TblMusteriAlisverisTarihi

--ORNEK SORU= Musteri isim, soyisim, urun_ad,urun_satýs fiyatý bilgilerini getiren sorguyu yazýnýz
--urununun satýldýktan sonraki halini istiyoruz
--coka cok iliskiyi bire cok veya bire bire cevirmemiz gerekiyor 3.normal forma uymaz
--coka cok iliskiyi bir tblo olusturarark giderebiliriz

select TblMusteriler.isim,TblMusteriler.soyisim,TblUrunler.ad,TblAlisverisKayit.urun_fiyat from 
TblAlisverisKayit             --foreign key            = primary key
INNER JOIN TblMusteriler ON TblAlisverisKayit.musteri_id=TblMusteriler.id
INNER JOIN TblUrunler ON TblAlisverisKayit.urun_id=TblUrunler.id

-- 1. Alýsveris_id, musteri isim, soyisim,urun_ad,urun satýs fiyati ve alýsveris tarihi bilgilerini
--getiren sorguyu yazýnýz

select TblAlisverisKayit.alisveris_id,TblMusteriler.isim,TblMusteriler.soyisim,TblUrunler.ad,TblUrunler.fiyat,
TblMusteriAlisverisTarihi.tarih  from
TblAlisverisKayit
INNER JOIN TblMusteriler ON TblAlisverisKayit.musteri_id=TblMusteriler.id
INNER JOIN TblUrunler ON TblAlisverisKayit.urun_id=TblUrunler.id
INNER JOIN TblMusteriAlisverisTarihi ON TblAlisverisKayit.alisveris_id=TblMusteriAlisverisTarihi.id

--2. Tum musterilerin yaptýgý alýsveris tutuarýnýn toplamýný veren sorguyu yazýnýz
select sum(TblAlisverisKayit.urun_fiyat*TblAlisverisKayit.adet) as TOPLAM_ALÝSVERÝS_TUTARÝ from TblAlisverisKayit 

--3. Her bir musterinin  alýsveris tututarýnýn toplamýný veren sorguyu yazýnýz.
select sum(TblAlisverisKayit.urun_fiyat*TblAlisverisKayit.adet) as HER_MUSTERÝNÝN_TOPLAM_ALÝSVERÝS_TUTARÝ from TblAlisverisKayit group by TblAlisverisKayit.musteri_id

--4. Her bir musterinin isim,soyisim, bilgisi ve yaptýgý alýsveris tutuarýnýn toplamýný veren sorguyu yazýnýz
select TblMusteriler.isim,TblMusteriler.soyisim,sum(TblAlisverisKayit.urun_fiyat*TblAlisverisKayit.adet) HER_MUSTERÝNÝN_TOPLAM_ALISVERÝS_TUTARÝ from
TblAlisverisKayit
INNER JOIN TblMusteriler ON TblAlisverisKayit.musteri_id=TblMusteriler.id
group by TblMusteriler.isim,TblMusteriler.soyisim

--5.Alýsveris tutuarlarýna gore coktan aza dogru her bir musterinin isimsoyisim bilgisi ve yaptýgý alýsveris tuturýnýn toplamýný veren sorguyu yazýnýz.
select TblMusteriler.isim,TblMusteriler.soyisim,sum(TblAlisverisKayit.urun_fiyat*TblAlisverisKayit.adet) HER_MUSTERÝNÝN_TOPLAM_ALISVERÝS_TUTARÝ from
TblAlisverisKayit
INNER JOIN TblMusteriler ON TblAlisverisKayit.musteri_id=TblMusteriler.id
group by TblMusteriler.isim,TblMusteriler.soyisim order by HER_MUSTERÝNÝN_TOPLAM_ALISVERÝS_TUTARÝ desc

--En yuksek alýsveris yapan musteriin isim soyisim bilgisi ve yaptýgý alýsveris tutarýnýn toplamýný veren sorguyu yazýnýz
select top 1 TblMusteriler.isim,TblMusteriler.soyisim,sum(TblAlisverisKayit.urun_fiyat*TblAlisverisKayit.adet) HER_MUSTERÝNÝN_TOPLAM_ALISVERÝS_TUTARÝ from
TblAlisverisKayit
INNER JOIN TblMusteriler ON TblAlisverisKayit.musteri_id=TblMusteriler.id
group by TblMusteriler.isim,TblMusteriler.soyisim order by HER_MUSTERÝNÝN_TOPLAM_ALISVERÝS_TUTARÝ desc

create view Sonuc_Tablosu as
select TblMusteriler.isim,TblMusteriler.soyisim,sum(TblAlisverisKayit.urun_fiyat*TblAlisverisKayit.adet) Toplam from
TblAlisverisKayit
INNER JOIN TblMusteriler ON TblAlisverisKayit.musteri_id=TblMusteriler.id
group by TblMusteriler.isim,TblMusteriler.soyisim

drop view Sonuc_Tablosu

select *from Sonuc_Tablosu
select *from Sonuc_Tablosu where Toplam=(select max(Toplam) from Sonuc_Tablosu)
select top 1 * from Sonuc_Tablosu


