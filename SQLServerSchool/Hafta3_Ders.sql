USE  VTDERS21EKIM
--<> EÞÝT DEÐÝLDÝR  VEYA !=

SELECT* FROM KISILER
SELECT AD,SOYAD FROM kisiler
SELECT *FROM kisiler WHERE sehir='Ankara'
select distinct sehir from kisiler

select*from yazarlar
SELECT*FROM YAZARLAR WHERE DOGUM_YILI>1825
select *from yazarlar where OLUM_YILI<>1910
select *from yazarlar where isim>'Ali'
select *from yazarlar where DOGUM_YILI>1825 and DOGUM_YILI<1943
select *from yazarlar where DOGUM_YILI between 1820 and 1900
select *from UYELER where isim='Deniz' and cinsiyet='k'
select *from UYELER where isim='Deniz' or cinsiyet='k'
select *from UYELER where  cinsiyet='E' and (soyisim='Aydýn' or soyisim='Zafer')
select*from personel where isim='Ahmet' and isim='Mehmet'

select *from personel where (yas>30 and cinsiyet='E')or(yas<25 and cinsiyet='K')
select*from personel where (yas>30 or kent='Ankara') and (maas>2500 or cinsiyet='K')

--ORDER BY ->sýralama asc=Kucukten buyuge desc=Buyukten kucuge
select isim, soyisim from uyeler  order by isim
select isim,soyisim from uyeler order by isim desc
select *from personel where cinsiyet='E' and ulke='Türkiye'order by maas 

--TOP(kaç tanesini almak istiyorsak)
select top 2 *from uyeler

--LIKE(Dogrudan esitlik aranmiyorsa kullanýlýr ismi a ile baslayan isminin icinde c olanlar gibi)
--  % = sýfýr veya daha fazla karakter yerine
--  _ = sadece 1 karakter yerine
--  [liste] = listedeki karakterlerden herhangi biri
-- [^liste] veya [!liste] = listedeki karakterlerden herhangi biri olmayan
select *from uyeler where soyisim like 'z%'
select *from uyeler where isim like '%t'
select *from uyeler where isim like '%er%'
select *from uyeler where isim not like '%er'
select *from uyeler where UYE_ADI like 'h_zafer'
select *from uyeler where UYE_ADI like 'er[h]an'
select *from UYELER where UYE_ADI like '[^EK]%'

--IN isleci (where icerisinde birden fazla degeri kosul olarak kullanýrken kullanýlýr)
select *from personel where yas in (22,23,25,26)
select *from personel where isim in('ayse','abbas')

--BETWEEN
select isim ,soyisim, yas from personel where yas between 20 and 26

--AS(olarak) SOZCUGU VE TAKMA ISIMLER
select isim as 'ad',soyisim as'soyad' from UYELER
select u.isim ,u.soyisim from uyeler u where u.cinsiyet='K'and u.isim='Derya'

--Kumeleme fonksiyonlarý