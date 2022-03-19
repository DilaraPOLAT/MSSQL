--Hafta 11 Ders
--STORED PROCEDURE TANIMLAMA
--Performans ve guvenlik icin kullan�l�r
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
--PARAMETREL� STORED PROCEDURE

select *from TblMusteriler

create procedure upMusteriGetir_CinsveYas
@cins int,
@yas int
as
begin
select*from TblMusteriler
where yas=@yas and cinsiyetid=@cins
end

upMusteriGetir_CinsveYas 2,32--32 yas�nda cinsiyetid 2 olan� parametre ile getirdik
exec upMusteriGetir_CinsveYas 1,28--telincence ozelli�i geliyor yani otomotik tan�mlay�c� yukar�daki ile tek fark�

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
where id=3 or 1=1-- id 3 olan� isterken sonuna ekledigi ifade ile tum veri taban�ndan bilgileri alabilir

---------------------------------------------------------------------------
sp_helptext upMusteriGetir_CinsveYas
sp_helptext sp_alterdiagram --yukar�daki ile fark� storedprocedure yazd�g�m�zda erisebiliyoruz
-------------------------------------------------------------------------------
drop procedure upMusteriGetir_CinsveYas

create procedure upMusteriGetir_CinsveYas
@cins int,
@yas int
with encryption --procedure un kaynak kodlar�na erisimi engellendi
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
@calisanSayisi int output--bunun bir c�kt� oldugunu belirtmemiz gerekiyor
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
--stored procedure avantajlar�na bak