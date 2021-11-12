USE VTDERS21EKIM
--LAB 4.HAFTA
--SORU 1:Personel tablosundan maa�� 1500, 3000, 3700, 4000 olan kay�tlar� getiriniz.
SELECT * FROM PERSONEL where  maas in (1500,3000,3700,4000) 

--SORU 2:Personel tablosundan ya�� 20  ile 30(20 ve 30 dahil) aras�nda erkeklerin isim 
--soyisi ve ya� bilgilerini getiren sorguyu getiriniz.
Select isim,soyisim,yas from personel where (yas>=20 and yas>=30 ) and cinsiyet='E'

--SORU 3:Personel tablosunu kullanarak �lkesi T�rkiye olan ve ismi 'A' ya da 'F' ile 
--ba�layan maa�� 1500 TL'den b�y�k olan kay�tlar� soy isimleri alfabetik s�ral� olacak �ekilde 
--getiren sorguyu yaz�n�z.
Select * from personel where (ULKE='T�rkiye' and (ISIM like'A%' or ISIM like'F%'))and maas>1500 order by SOYISIM asc

--SORU 4:�smi A ile ba�layan veya S ile biten erkekeleri ismine g�re alfabetik olarak s�ralayan sorguyu yaz�n�z.
Select * from personel where (ISIM like 'A%' or ISIM like '%S') and CINSIYET ='E' order by isim asc

--SORU 5:�smi 5 harfli olan personeli maa��na g�re b�y�kten k����e s�ralay�n�z.
Select *from personel where ISIM like'_____' order by MAAS asc
Select *from personel where len(isim)=5 order by MAAS asc

--SORU 6:Personel tablosunda �lkesi T�rkiye olmayan , maa�� 2000'den b�y�k olan isminde 'a,e,f' harflerini bulunduran
--isim, soyisim, ya� bilgilerini soyisimleri ters s�zl�k s�ral� �ekilde yazd�ran sorguyu yazd�r�n�z.
Select ISIM, SOYISIM,YAS from personel where ULKE!='T�rkiye' and maas>2000 and isim like'%[a,e,f]%' order by SOYISIM desc

--SORU 7:Personel tablosundan �lkesi Almanya olmayan soyismi 3 harften uzun olan veya y ile ba�layan ismi 4 harften 
--uzun olan ya�� 35'te k���k personeli yazd�ran sorguyu yaz�n�z.
Select * from personel where ULKE!='Almanya' and (len(SOYISIM)>3 or SOYISIM like'y%' )and len(ISIM)>4 and YAS<35 

--SORU 8:Personel tablosundan maa�� ya��n�n 100 kat�ndan fazla olan personelin isim, ya� ve %10 zaml� maa��n� maa�a g�re 
--s�ral� olarak g�steren sorguyu yaz�n�z.
Select isim, yas, maas*1.1 zaml�_maas from personel where MAAS>(yas*100) order by maas desc