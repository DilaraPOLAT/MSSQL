--5.01.2022 12LAB
if(1=1)
begin
print 'bir bire eþit'
end
else
begin 
print 'eþit deðil'
end

create procedure dersgoruntule(@deger int)
as
select *from ders where dersid>@deger

drop procedure dersgoruntule 500

create procedure toplama(@sayi int,@sayi2,@toplam int)
as
set @toplam=@sayi1+sayi2

declare @toplamsonuc int
exec toplama 3,5,@toplamsonuc output
print @toplamsonuc

select upper(kitapad)from kitapad

create function buyukharf(@gelenmetin varchar(30))
returns varchar(30)
as
begin
return upper(@gelenmetin)
end

select dbo.buyukharf(kitapad) from kitap;


create function rengegoresayi(@renk varchar(10))
returns int
as
begin
declare @sayi int
select sayi=count(*) from kitap where renk =@renk
return @sayi
end

select dbo.rengegoresayi('beyaz')


select *from kitap where yazarid=1
create function yazaragorekitap(@id int)
returns table
as
select*from kitap where yazarid=@id
--table yazdýgýmýzda begin end kullanmaya gerek yok

waitfor delay '00:00:10'--10 sn beklemeyi saglýyor
waitfor time '09:30:00'--bu saaate calýs
select *from yazaragorekitap(1)

declare @sayac int
set @sayac=0
while(@sayac<10)
begin 
print 'Sayac'+cast(@sayac as varchar(2))
waitfor delay '00:00:01'
set @sayac=@sayac+1
end

--distinct constraint
--alter update
--drop delete
--procedure function
--delete truncate

select distinct renk from KITAP
