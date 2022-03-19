-- STRING FONKSIYONLAR (Hazir fonk.)
use VTDERS21EKIM
select 'Merhaba' as string --sütun adi verdim.

select ascii('A') as ASCII_DEGER

select char(65) as CHAR_DEGER

-- T-SQL (Transaction SQL)

-- A'dan Z'ye Tüm Karakterleri Yazma      **** Döngü halinde yazdýrdýk ****
declare @start int
set @start = 65
while (@start<=90)
begin
    print(char(@start))
	set @start += 1
end

----------------------------------
--a'dan z'ye
declare @start int
set @start = 97
while(@start<=122)
begin
    print(char(@start))
	set @start += @start
end


-- LTRIM(Sol boþluðu siler) ve RTRIM(Sað boþluðu siler) FONKSIYONLARI

select 'Merhaba'
select '                Merhaba'
select ltrim('                Merhaba') --Boþluðu yazmaz böylece bellekte boþa yer kaplamaz.

select ad, soyad from Kisiler
select ltrim(ad), ltrim(soyad) from Kisiler
select ad + soyad as ISIM_SOYISIM from Kisiler

select ltrim(ad) +' ' + ltrim(soyad) as IsimSoyisim from Kisiler


select rtrim(ltrim(ad)) +' ' + rtrim(ltrim(soyad)) as IsimSoyisim from Kisiler

-- LOWER ve UPPER FONKSIYONU
select 'Merhaba'
select UPPER('Merhaba') -- Tüm karakterler büyük
select LOWER('Merhaba') -- Tüm karakterler küçük

select lower(rtrim(ltrim(ad))) +' ' + lower(rtrim(ltrim(soyad))) as IsimSoyisim from Kisiler

-- LEN FONKSIYONU
select len('Merhaba')
select len('Merhaba     ') -- boþluk karakterini saymýyor! sondaki
select len('         Merhaba') --Baþlangýçtaki boþluklarý alýyor.

-----------------------------------------------

-- LEFT ve RIGT FONKSIYONLARI
select left('NECMETTIN ERBAKAN UNIVERSITESI', 5) -- soldan baþlar ve ilk 5 karakteri getirir.
select right('NECMETTIN ERBAKAN UNIVERSITESI', 8) -- saðdan baþlar ve 8 karakteri alýr.
-----------------------------------------------

-- CHARINDEX FONKSIYONU
select charindex('a','alikaya@gmail.com') -- hangi ifadenin içinde hangi karakteri aradýðýmýzý belirtiyoruz ve indexini veriyor. Yoksa 0


-- SUBSTRING FONK.
select substring('alikaya@gmail.com', 3, 4) -- 3. indisten baþla 4.karakteri getir.

select * from Kisiler


-- Örnek : Tüm kayýtlarýn domain-name bilgilerini getir. Mail için yaptý hoca. ben de veritabanýnda mail yok.
-- a harfinden sonrasýný buldu ve yazdý a dan baþladý adres uzunluðu kadar gitti
select substring(adres, charindex('a', adres), len(adres)) from Kisiler

-------------------------------------------
-- Hangi domain name in kaç defa tekrar ettiðini getiren sorguyu yazýn.
select  substring(mail, charindex('@', mail)+1, len(mail)), count(*) as ToplamSayi from Kisiler -- veya count(mail)
group by substring(mail, charindex('@', mail)+1, len(mail))


-- Kaç farklý domanin-name olduðunu getiren sorgu
select count(distinct(substring(mail, charindex('@', mail)+1, len(mail)))) from Kisiler