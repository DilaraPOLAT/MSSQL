USE VTDERS21EKIM
--L�KE
select *from personel
select isim from personel where isim like '%a'
select  ulke  from personel where ulke like't%'
select distinct ulke  from personel where ulke like't%'
select ulke from personel where ulke like '[a,b]%'--ulke ad� a eya b ile baslayanlar� listele

--Maa�� 3000'den buyuk olan acl�sanlar�n ad�,soyad� s�tunlar�n� getiriniz.
select isim,soyisim from personel where maas>3000

--yas� 25'den kucuk olan veya ismi mehmet olan personelleri getiriniz.
select *from personel where yas<25 or isim='Mehmet'

--soyad� y harfi ile baslayan cal�sanlar� goruntuleyiniz
select *from personel where soyisim like 'y%'

--ad� 'et' harfleri ile biten cal�sanlar� gorunutleyiniz
select *from personel where isim like '%et'





--