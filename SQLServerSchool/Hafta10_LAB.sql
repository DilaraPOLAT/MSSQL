use LAB
--select *from kitap
--select*from yazar

--from kitap
--kitap.yazarid=yazar.yazarid
select *from kitapyazar
insert into kitapyazar values(9,'Kumarbaz','Dostoyevski')

select kitapad,yazar,sayfa from kitap where renk='Sarý'
create view sarikitap as
select kitapad,sayfa,renk from kitap where renk='sarý'

select *from sarikitap
insert into sarikitap values('Budala',500,'sarý')
select *from kitap
select *from yazar
 create view sarikitap2
as
select kitapad,sayfa,renk from kitap where renk='sarý'
insert into sarikitap values(10,'Budala',500,'sarý')

select *from kitap

drop view sarikitap 
create view kitaprenkleri
as
select renk,count(*) kitapsayisi from kitap group by renk

insert into kitaprenkleri values('turuncu',1)

select*from kitap
insert into kitap values(9,'Insancýklar',1,500,'sari')

select*from sarikitap2  --yeni ekledigimiz kayýtta geldi

select*from kitap
select *from yazar

select kitapid,kitapad, yazarad,kitapsayisi 
from kitap left join yazar on kitap.yazarid=yazar.yazarid

create view kitapgoster
as
select kitapid,kitapad, yazarad,kitapsayisi 
from kitap left join yazar on kitap.yazarid=yazar.yazarid

select *from kitapgoster

--view
--stored procedure
--create procedure <procedure_name> ya da create proc <procedure_name>

create procedure kitapgetir
as
begin
select *from kitap
end

--kitapgetir ya da ececute kitapgetir ya da exec kitapgetir

create procedure rengegorekitapgetir @kitaprengi varchar(10)
as
begin 
select *from kitap where renk=@kitaprengi
end

exec rengegorekitapgetir 'sari'

execute rengegorekitapgetir 'beyaz'

create procedure kitapsayirenk @kitaprengi varchar(10),@sayi int output
as
begin
select count(*) from kitap where renk=@kitaprengi
end

create procedure kitapsayirenk @kitaprengi varchar(10),@sayi int output
as
begin
select @sayi=count(*) from kitap where renk=@kitaprengi
end

declare @kitapsayisi int;
exec kitapsayirenk 'sayi',kitapsayisi output
select @kitapsayisi

create procedure topla @sayi1 int,@sayi2 int, @sonuc int output
as
begin
set @sonuc=@sayi1+@sayi2
end

declare @toplam int
exec topla 4,7,@toplam output
select @toplam

--oyle bir procedure yazalýmki sayfa sayýsý buyuk olanlarý getirsin
create procedure sayikitapgetir (@sayfasayisi int)
as
begin
select *from kitap where sayfa>sayfasayisi
end

exec sayikitapgetir 400

--sayabasi maliyeti 2 olan procedure yazalým
create procedure kitapmaliyet(@sayfabasimaliyet int)
as
begin
select kitapid,kitapad,yazarid,sayfa,renk,sayfa*@sayfabasimaliyet maliyet from kitap
end

execute kitapmaliyet 2


create procedure  toplammaliyet @kitaprengi varchar(10),@sayfabasimaliyet int,@toplammaliyet int output
as
begin
select @toplammaliyet=sum(sayfa*@sayfabasimaliyet)from kitap where renk=@kitaprengi
--ya da select @sayi=(select count(*) frm kitap where...)
end

declare @toplammaliyeta int--declare etmedigimiz bir degiskenin icine deger atamýyoruz
exec tolammaliyet 'sari',3,@toplammaliyeta output
select @toplammaliyet

select  sum(maliyet*2) from kitap where renk='beyaz'

--declare @a int=3,@b int=5 yazýlabilir yukarýdaki sorgudan bagýmsýz


