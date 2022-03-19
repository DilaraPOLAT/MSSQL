--Hafta11 LAB
use VTDERS21EKIM

--1.Personel tablosunda kullanarak VIEW AD_SOYAD isminde view olusturalým ayný soruyu isminde sorguyu gizleeyecek
--þekilde GIZLI_VIEW_AD_SOYAD ismþnde view olusturalým view icerigini gosterelim

create view view_Ad_soyad
as
(select p.isim as isim,p.soyisim as soyisim from personel p);
select *from view_Ad_soyad

create view gizli_view_ad_soyad with encryption--sorguus gizlenmis view design kýsmýn kapalý
as
(select p.isim as isim,p.soyisim as soyisim from personel p);
select *from gizli_view_ad_soyad

--2.VIEW_MAAS_RAPOR isminde view olusturalým view icerigini gostererlim
create view view_maas_rapor
as
(select max(p.MAAS) as MAX_MAAS,min(p.MAAS) as MIN_MAAS,avg(p.MAAS) as ORTALAMA,sum(p.MAAS) as TOPLAM from personel p);
select *from  view_maas_rapor

--3.VIEW_MAAS_RAPOR isimindeki view degistirelim 

alter view view_maas_rapor
as
(select count(*) as yeni_alan_toplam_kisi,max(p.MAAS) as MAX_MAAS,min(p.MAAS) as MIN_MAAS,avg(p.MAAS) as ORTALAMA,sum(p.MAAS) as TOPLAM from personel p);
select *from view_maas_rapor

--4.VIEW_KITAP_YAZAR olusturalým
--view_kitap_yazar kullanarak kitap adýnda Q olnalarý (select) gosterelim

create view view_kitap_yazar
as
(select y.isim as isim,y.NO as soyisim,k.ISIM as kitap_adi from KITAPLAR k, KYAZARLAR y,kitapyazar ky 
where k.NO=ky.KNO and y.NO=ky.YNO);
select*from view_kitap_yazar

select *from view_kitap_yazar v where v.kitap_adi like('%Q')


--5.VIEW_GENEL_MAAS_VÝEW personelin ortalama maasýnýn tutan bir view olacak bu view kullanarak
--ortalamadan buyuk en kucuk maasý olan kiþiyi getirrelim

create view view_genel_maas
as
(select avg(maas) as ortmaas from personel);
select*from view_genel_maas

select top 1* from personel p ,view_genel_maas v where p.MAAS>v.ortmaas order by p.MAAS asc

--6.view_ulke_maas ulkesine esit ortalama 
create view view_ulke_maas
as
select ulke ,avg(maas) as ortmaas from personel group by ulke

select*from personel p,view_ulke_maas v where (p.ULKE=v.ULKE) and (p.MAAS < v.ortmaas)

