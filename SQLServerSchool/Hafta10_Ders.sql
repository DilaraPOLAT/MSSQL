--9.12.2021

select *from Tblmusteriler
select *from Tblurunler
select *from TblUrunKatagori
select*from TblAlisverisKayit
select*from TblMusteriAlisverisTarihi

--ORNEK SORU= Musteri isim, soyisim, urun_ad,urun_sat�s fiyat� bilgilerini getiren sorguyu yaz�n�z
--urununun sat�ld�ktan sonraki halini istiyoruz
--coka cok iliskiyi bire cok veya bire bire cevirmemiz gerekiyor 3.normal forma uymaz
--coka cok iliskiyi bir tblo olusturarark giderebiliriz

select TblMusteriler.isim,TblMusteriler.soyisim,TblUrunler.ad,TblAlisverisKayit.urun_fiyat from 
TblAlisverisKayit             --foreign key            = primary key
INNER JOIN TblMusteriler ON TblAlisverisKayit.musteri_id=TblMusteriler.id
INNER JOIN TblUrunler ON TblAlisverisKayit.urun_id=TblUrunler.id

-- 1. Al�sveris_id, musteri isim, soyisim,urun_ad,urun sat�s fiyati ve al�sveris tarihi bilgilerini
--getiren sorguyu yaz�n�z

select TblAlisverisKayit.alisveris_id,TblMusteriler.isim,TblMusteriler.soyisim,TblUrunler.ad,TblUrunler.fiyat,
TblMusteriAlisverisTarihi.tarih  from
TblAlisverisKayit
INNER JOIN TblMusteriler ON TblAlisverisKayit.musteri_id=TblMusteriler.id
INNER JOIN TblUrunler ON TblAlisverisKayit.urun_id=TblUrunler.id
INNER JOIN TblMusteriAlisverisTarihi ON TblAlisverisKayit.alisveris_id=TblMusteriAlisverisTarihi.id

--2. Tum musterilerin yapt�g� al�sveris tutuar�n�n toplam�n� veren sorguyu yaz�n�z
select sum(TblAlisverisKayit.urun_fiyat*TblAlisverisKayit.adet) as TOPLAM_AL�SVER�S_TUTAR� from TblAlisverisKayit 

--3. Her bir musterinin  al�sveris tututar�n�n toplam�n� veren sorguyu yaz�n�z.
select sum(TblAlisverisKayit.urun_fiyat*TblAlisverisKayit.adet) as HER_MUSTER�N�N_TOPLAM_AL�SVER�S_TUTAR� from TblAlisverisKayit group by TblAlisverisKayit.musteri_id

--4. Her bir musterinin isim,soyisim, bilgisi ve yapt�g� al�sveris tutuar�n�n toplam�n� veren sorguyu yaz�n�z
select TblMusteriler.isim,TblMusteriler.soyisim,sum(TblAlisverisKayit.urun_fiyat*TblAlisverisKayit.adet) HER_MUSTER�N�N_TOPLAM_ALISVER�S_TUTAR� from
TblAlisverisKayit
INNER JOIN TblMusteriler ON TblAlisverisKayit.musteri_id=TblMusteriler.id
group by TblMusteriler.isim,TblMusteriler.soyisim

--5.Al�sveris tutuarlar�na gore coktan aza dogru her bir musterinin isimsoyisim bilgisi ve yapt�g� al�sveris tutur�n�n toplam�n� veren sorguyu yaz�n�z.
select TblMusteriler.isim,TblMusteriler.soyisim,sum(TblAlisverisKayit.urun_fiyat*TblAlisverisKayit.adet) HER_MUSTER�N�N_TOPLAM_ALISVER�S_TUTAR� from
TblAlisverisKayit
INNER JOIN TblMusteriler ON TblAlisverisKayit.musteri_id=TblMusteriler.id
group by TblMusteriler.isim,TblMusteriler.soyisim order by HER_MUSTER�N�N_TOPLAM_ALISVER�S_TUTAR� desc

--En yuksek al�sveris yapan musteriin isim soyisim bilgisi ve yapt�g� al�sveris tutar�n�n toplam�n� veren sorguyu yaz�n�z
select top 1 TblMusteriler.isim,TblMusteriler.soyisim,sum(TblAlisverisKayit.urun_fiyat*TblAlisverisKayit.adet) HER_MUSTER�N�N_TOPLAM_ALISVER�S_TUTAR� from
TblAlisverisKayit
INNER JOIN TblMusteriler ON TblAlisverisKayit.musteri_id=TblMusteriler.id
group by TblMusteriler.isim,TblMusteriler.soyisim order by HER_MUSTER�N�N_TOPLAM_ALISVER�S_TUTAR� desc

create view Sonuc_Tablosu as
select TblMusteriler.isim,TblMusteriler.soyisim,sum(TblAlisverisKayit.urun_fiyat*TblAlisverisKayit.adet) Toplam from
TblAlisverisKayit
INNER JOIN TblMusteriler ON TblAlisverisKayit.musteri_id=TblMusteriler.id
group by TblMusteriler.isim,TblMusteriler.soyisim

drop view Sonuc_Tablosu

select *from Sonuc_Tablosu
select *from Sonuc_Tablosu where Toplam=(select max(Toplam) from Sonuc_Tablosu)
select top 1 * from Sonuc_Tablosu


