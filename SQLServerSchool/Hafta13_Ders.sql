--30.12.2021
--Trigger ->Tetikleyiciler bir tabloda belirli olaylar geldi�inde veya meydana gelmeden once 
--otomotik calisan �zel bir stored procedures turudur veri butunlugu saglamak icin kullan�l�r

/*SQL server da 3 cesit trigger vard�r:
1.DML triggerlar(Insert,Update,Select)
 1.1.After trigger(for trigger olarark da bilirnir.
 1.2.�nstead of tetikleyiciler
2.DDL trigger
3.Logon trigger*/
use VT_ALISVERIS2
select*from TblUrunler
select*from TblUrunKatagori

CREATE TRIGGER trg_TblUrunler_forInsert
on TblUrunler
for insert
as
begin
   select *from inserted--inserted gercekte var olmayan triggerin gormesi icin var
end

insert into TblUrunler values('Dondurma',5.25,111,3)
--bunu ca�st�rd�g�m anda affected ifadesi gelirken simdi sorgu geldi bunun nedeni trigger gerceklesen islemi goruntuluyor

--Audit: denetim denetleme anlam�na gelir
Create table TblUrunlerAudit(
id int PRIMARY KEY IDENTITY(1,1),
AuditData nvarchar(100)
)

CREATE TRIGGER trg_TblUrunler_forInsert2
on TblUrunler
for insert
as
begin
   Declare @id int
   Select @id=id from inserted--inserted tablosunda yer alan tbl urunler ekeled�g�m�z id veriyor

   Insert into TblUrunlerAudit
   values(@id +'id degerine sahip yeni bir urun'+GETDATE() +'tarihinde eklendi')--getdate=bugunun tarihini verir
end

insert into TblUrunler values('Pasta',37.95,112,5)--bizim triggerimiz int string birlestirme sql de yetmiyor buna 
--izin vermiyor cast kullan�r�z




Alter TRIGGER trg_TblUrunler_forInsert2
on TblUrunler
for insert
as
begin
   Declare @id int
   Select @id=id from inserted--inserted tablosunda yer alan tbl urunler ekeled�g�m�z id veriyor

   Insert into TblUrunlerAudit
   values(CAST(@id as nvarchar(3)) +'id degerine sahip yeni bir urun'+CAST(GETDATE() as nvarchar(25))+'tarihinde eklendi')--getdate=bugunun tarihini verir
end

insert into TblUrunler values('Pasta',37.95,112,5)--bizim triggerimiz int string birlestirme sql de yetmiyor buna 
--izin vermiyor cast kullan�r�z

CREATE TRIGGER trg_TblUrunler_forDelete
on TblUrunler
for Delete
as
begin
   Declare @id int
   Select @id=id from deleted--deleted:gercekte var olmayan triggerin govdesinde yer alan ozellesm�s sanallasm�s bir tablodur

   Insert into TblUrunlerAudit
   values(CAST(@id as nvarchar(3)) +'id degerine sahip  bir urun'+CAST(GETDATE() as nvarchar(25))+'tarihinde silindi')--getdate=bugunun tarihini verir
end

Delete from TblUrunler where id=6--deterjanda 1 -n iliski oldugu icin silinemiyor
Delete from TblUrunler where id=7--hem tblurunler tablosunda 18 id'li dondurmay� sildi hem de
--tblurunleraudit yeni bir sey eklendi dondurma silinme islemi


--Transaction SQL(T-SQL)
--ORACLE(PL-SQL) veri taban�nda programlarda kullan�lan donguler kullan�lm�yor daha sonraki y�llarda kullan�lmaya baslam�s
--T-SQL, PL-SQL duydugunuzda dongu ifadeleri vb kullan�labiliyor

select *from TblUrunler
DECLARE @sayi int
select @sayi=count(*) from TblUrunler
--select @sayi

if @sayi>1
   BEGIN
     PRINT 'Tabloda kay�t vard�r'
   END

else
   BEGIN
     PRINT 'Tabloda kay�t bulunmamaktad�r'
   END

select *from TblUrunler
DECLARE @sayi int
select @sayi=count(*) from TblUrunler
--select @sayi

while @sayi>=1
BEGIN
  print @sayi
  set @sayi=@sayi-1
END

IF MONTH(GETDATE()) IN (9)--9.aydam�y�z
  BEGIN
     print 'Eylul ayindayiz'
  END
ELSE
  BEGIN
     print 'Eylul ayinda DEG�L�Z'
  END

--w3schools.com
--javatpoint.com
--sqlserveregitimleri
--btkakademi ucretsiz
--udemy



