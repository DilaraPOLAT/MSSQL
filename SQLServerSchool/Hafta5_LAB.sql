USE VTDERS21EKIM
--HAFTA 5 LAB
Select *from personel
Select avg (maas) OrtalamaMaas from PERSONEL
Select sum(yas) ToplamYas from PERSONEL
Select min(yas) ToplamYas from PERSONEL
Select max(yas) ToplamYas from PERSONEL
Select count(distinct yas) from personel--Yaþý farkllý olan kaç kiþi var

--GRPOUP BY
Select ulke from personel group by ulke
Select ulke, count(per_no) personel_sayisi from personel where ulke is not null group by ulke order by count(per_no) desc
Select ulke , sum(maas) toplam, count(maas) sayi,avg(maas)ortalama from personel where ulke is not null group by ulke order by ortalama
update personel set kent='Antalya' where per_no=2
select ulke, cinsiyet,count(*) from personel group by ulke, cinsiyet order by ulke,cinsiyet
--ulke ve cinsiyete gore gruplandýrdý ve kaç tane ayný ulke ve ciniyette kayýt varsa verdi

--HAVÝNG
select ulke, cinsiyet,count(*) from personel group by ulke, cinsiyet having count(*)>2
select ulke,avg(maas)from personel group by ulke having min(maas)>=3000
--Maaþý 3000'den yüksek olan personellerrin ulke ve ortalama maas bilgisine gore gruplandirilmis sorgusu
select ulke,avg(maas) from personel where maas>3000 group by ulke order by avg(maas) desc
--NOT:where sorgu sonucu kayýt sorgusu having gruplandýrma sonucu kayýt sorgusu

--NESTED QUERY
select ulke,yas,min(maas) from personel--Hata verir cunku min(maas) tek bir deger dondurur.
select *from personel where maas<(select avg(maas) from personel)
select sum(maas) -(avg(maas)*count(*)) from personel
select upper(isim) isim ,soyisim,maas*1.1 zamliMaas from personel
--select ulke from ulkeler where kent in (select distinct kent from personel)
select *from personel where cinsiyet='E' and maas>(select avg(maas) from personel)





