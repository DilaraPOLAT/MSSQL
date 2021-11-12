USE VTDERS21EKIM
SELECT *FROM PERSONEL

select kent,count(*) from PERSONEL group by kent
select kent,count(*) from PERSONEL group by kent,isim
select kent ,count(*) from PERSONEL group by kent having count(*)>1
select kent ,count(*) from PERSONEL where kent!='Ankara' group by kent 
select kent ,count(*) from PERSONEL group by kent having kent!='Ankara'
select kent ,count(*) from PERSONEL where count(*)<2 group by kent--Hata verecek cunku gruplama yapmadan once sart yazýldý gibi oluyor. 
select kent ,count(*) from PERSONEL group by kent having count(*)<2
SELECT *FROM PERSONEL
select kent ,count(*),avg(maas) from PERSONEL group by kent
select kent ,count(*),avg(maas) from PERSONEL group by kent having count(*)<2

select ulke,avg(maas)from PERSONEL where maas>3000 group by ulke order by avg(maas)asc
select ulke from PERSONEL where maas>3000 group by ulke order by avg(maas)asc
select ulke,avg(maas)from PERSONEL  group by ulke,maas having maas>3000 order by avg(maas)asc
select ulke,avg(maas)from PERSONEL  group by ulke having maas>3000 order by avg(maas)asc--HATA
select ulke,avg(maas)from PERSONEL  group by ulke having min(maas)>3000 order by avg(maas)asc
select ulke from PERSONEL  group by ulke having min(maas)>3000 order by avg(maas)asc

select ulke, avg(maas) from PERSONEL group by ulke
select ulke, avg(maas) from PERSONEL group by ulke,maas
select ulke  from PERSONEL group by ulke,maas
select maas  from PERSONEL group by ulke,maas

--yaþý 25'den buyuk erkek türkiyede yaþayan veya  maaþý 2000 den buyuk kýzlarý getir.
select *from PERSONEL where (yas>25 and cinsiyet= 'E' and ulke='Türkiye') or(maas>2000 and cinsiyet='K')