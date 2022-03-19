USE VTDERS21EKIM
--LÝKE
select *from personel
select isim from personel where isim like '%a'
select  ulke  from personel where ulke like't%'
select distinct ulke  from personel where ulke like't%'
select ulke from personel where ulke like '[a,b]%'--ulke adý a eya b ile baslayanlarý listele

--Maaþý 3000'den buyuk olan aclýsanlarýn adý,soyadý sütunlarýný getiriniz.
select isim,soyisim from personel where maas>3000

--yasý 25'den kucuk olan veya ismi mehmet olan personelleri getiriniz.
select *from personel where yas<25 or isim='Mehmet'

--soyadý y harfi ile baslayan calýsanlarý goruntuleyiniz
select *from personel where soyisim like 'y%'

--adý 'et' harfleri ile biten calýsanlarý gorunutleyiniz
select *from personel where isim like '%et'





--