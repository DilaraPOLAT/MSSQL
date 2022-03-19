--Hafta 11 Ders
--STORED PROCEDURE TANIMLAMA
--Performans ve guvenlik icin kullanýlýr
use VT_ALISVERIS

select *from TblMusteriler

create procedure upMusteriGetir
as
begin
select *from TblMusteriler
end

upMusteriGetir
execute upMusteriGetir
exec upMusteriGetir

--------------------------------------------
--PARAMETRELÝ STORED PROCEDURE

select *from TblMusteriler

create procedure upMusteriGetir_CinsveYas
@cins int,
@yas int
as
begin
select*from TblMusteriler
where yas=@yas and cinsiyetid=@cins
end

upMusteriGetir_CinsveYas 2,32--32 yasýnda cinsiyetid 2 olaný parametre ile getirdik
exec upMusteriGetir_CinsveYas 1,28--telincence ozelliði geliyor yani otomotik tanýmlayýcý yukarýdaki ile tek farký

Alter procedure upMusteriGetir_CinsveYas
@cins int,
@yas int
as
begin
select*from TblMusteriler
where yas>=@yas and cinsiyetid=@cins
end

upMusteriGetir_CinsveYas 2,32

-----------------------------------------------------------------------
--SQL Injection
select *from TblMusteriler
where id=3 or 1=1-- id 3 olaný isterken sonuna ekledigi ifade ile tum veri tabanýndan bilgileri alabilir

---------------------------------------------------------------------------
sp_helptext upMusteriGetir_CinsveYas
sp_helptext sp_alterdiagram --yukarýdaki ile farký storedprocedure yazdýgýmýzda erisebiliyoruz
-------------------------------------------------------------------------------
drop procedure upMusteriGetir_CinsveYas

create procedure upMusteriGetir_CinsveYas
@cins int,
@yas int
with encryption --procedure un kaynak kodlarýna erisimi engellendi
as
begin 
select*from TblMusteriler
where yas=@yas and cinsiyetid=@cins
end

upMusteriGetir_CinsveYas 2,32
----------------------------------------------------------------------
--DEGER DONDUREN STORED PROCEDURE
create proc up_CinsiyetGoreCalisanSayisi
@cins int,
@calisanSayisi int output--bunun bir cýktý oldugunu belirtmemiz gerekiyor
as
begin
select @calisanSayisi=count(id)
from TblMusteriler
where cinsiyetid=@cins
end

declare @toplamCalisanSayisi int
exec up_CinsiyetGoreCalisanSayisi 1,@toplamCalisanSayisi output
--print @toplamCalisanSayisi
select @toplamCalisanSayisi
--stored procedure avantajlarýna bak