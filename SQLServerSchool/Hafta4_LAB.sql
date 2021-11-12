USE VTDERS21EKIM
--LAB 4.HAFTA
--SORU 1:Personel tablosundan maaþý 1500, 3000, 3700, 4000 olan kayýtlarý getiriniz.
SELECT * FROM PERSONEL where  maas in (1500,3000,3700,4000) 

--SORU 2:Personel tablosundan yaþý 20  ile 30(20 ve 30 dahil) arasýnda erkeklerin isim 
--soyisi ve yaþ bilgilerini getiren sorguyu getiriniz.
Select isim,soyisim,yas from personel where (yas>=20 and yas>=30 ) and cinsiyet='E'

--SORU 3:Personel tablosunu kullanarak ülkesi Türkiye olan ve ismi 'A' ya da 'F' ile 
--baþlayan maaþý 1500 TL'den büyük olan kayýtlarý soy isimleri alfabetik sýralý olacak þekilde 
--getiren sorguyu yazýnýz.
Select * from personel where (ULKE='Türkiye' and (ISIM like'A%' or ISIM like'F%'))and maas>1500 order by SOYISIM asc

--SORU 4:Ýsmi A ile baþlayan veya S ile biten erkekeleri ismine göre alfabetik olarak sýralayan sorguyu yazýnýz.
Select * from personel where (ISIM like 'A%' or ISIM like '%S') and CINSIYET ='E' order by isim asc

--SORU 5:Ýsmi 5 harfli olan personeli maaþýna göre büyükten küçüðe sýralayýnýz.
Select *from personel where ISIM like'_____' order by MAAS asc
Select *from personel where len(isim)=5 order by MAAS asc

--SORU 6:Personel tablosunda ülkesi Türkiye olmayan , maaþý 2000'den büyük olan isminde 'a,e,f' harflerini bulunduran
--isim, soyisim, yaþ bilgilerini soyisimleri ters sözlük sýralý þekilde yazdýran sorguyu yazdýrýnýz.
Select ISIM, SOYISIM,YAS from personel where ULKE!='Türkiye' and maas>2000 and isim like'%[a,e,f]%' order by SOYISIM desc

--SORU 7:Personel tablosundan ülkesi Almanya olmayan soyismi 3 harften uzun olan veya y ile baþlayan ismi 4 harften 
--uzun olan yaþý 35'te küçük personeli yazdýran sorguyu yazýnýz.
Select * from personel where ULKE!='Almanya' and (len(SOYISIM)>3 or SOYISIM like'y%' )and len(ISIM)>4 and YAS<35 

--SORU 8:Personel tablosundan maaþý yaþýnýn 100 katýndan fazla olan personelin isim, yaþ ve %10 zamlý maaþýný maaþa göre 
--sýralý olarak gösteren sorguyu yazýnýz.
Select isim, yas, maas*1.1 zamlý_maas from personel where MAAS>(yas*100) order by maas desc