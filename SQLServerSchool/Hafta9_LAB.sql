CREATE DATABASE LAB
--VERİ TABANİ LAB HAFTA 9

--Constraint
--primary key >baska tablo ile baska bir tabloyu baglayabiliyorum foreign key ile
--unique >benzersiz olsun kullanici adı
--not null>bos bırakılamıyor eposta bos bırakılamaz gibi
--default>tarihsel degerlerde kullanılır
--foreign key >
--check >veri tabanina illk kayıt yapıldıgında ilk kotrol edilsin negatif bir d girilemez

create table ogretmen(id int primary key ,adsoyad varchar(40));
create table ders(dersid int primary key , ad varchar (30), ogrid int);

insert into ogretmen values
(1, 'Ahmet Ozkıs'),
(2,'Hasan Ali Akyürek'),
(3,'Mehmet Hacıbeyoglu'),
(4,'Atse merve acılar')

alter table ders add constraint fk_ders_ogretmen
foreign key(ogrid)references ogretmen(id)

insert into ders values
(11,'veritabani',2),
(12, 'web prog',2),
(13,'Bulanık mantık',4),
(14,'Bilgisayar grafikleri',4),
(15,'Bil.Muh. Giris',1),
(16,'mobil programlama',2);

update ogretmen set id=10 where id=3;
select *from ogretmen

--cascade
alter table ders drop constraint fk_ders_ogretmen;
alter table ders add constraint fk_ders_ogretmen foreign key(ogrid)
references ogretmen(id) on delete cascade on update cascade;

select*from ders;
select *from ogretmen;
update ogretmen set id=3 where id=2;
delete from ogretmen where id=3;

--set null

alter table ders add constraint fk_ders_ogretmen foreign key(ogrid)
references ogretmen(id) on delete set null on update cascade;

delete from ogretmen where id=1;
select*from ders;
select *from ogretmen;

insert into ogretmen values(1,'Ahmet Ozkıs');
update ogretmen set adsoyad ='Ayse Merve Acılar' where id=4
update ders set ogrid=1 where ogrid is null;

--set default
alter table ders add constraint df_ders default 10 for ogrid;
insert into ders(dersid,ad) values(17,'isletim sistemeleri')

alter table ders add constraint fk_ders_ogretmen foreign key(ogrid)
references ogretmen(id) on delete set default  on update set default;--update edildigi zaman default deger atar

delete from ogretmen where id=1;
select *from ogretmen;select *from ders;
update ogretmen set id=5 where id=4

--check
alter table ogretmen add constraint ch_ogretmen check(id>0)
insert into ogretmen values(-1,'Abdulkadir pektas')--check kısıtından dolayı hata verir.
alter table ogretmen drop constraint ch_ogretmen --kısıtı kaldırdık
select *from ogretmen

create table musteri(
musterid int primary key,
kullaniciadi varchar(20) not null ,
eposta varchar(20) unique,
kayit_tarihi date default getdate(),
constraint ch_musteri check(musterid>0 and musterid<100));
--FOREIGN KEY DELETE/UPDATE RULES
--on delete/on update
--no action/casade/set null/set default
create table siparis(siparisis int primary key, miktar int ,musid int,
constraint ch_siparis check (miktar>0));

alter table siparis add constraint fk_siparis_musteri foreign key (musid)
references musteri(musterid) on delete cascade on update cascade; --on delete no action->silme isleminde hıc bir islem yapılmasın
--on delete cascade->musteri tablosuna ait islemi sildiginde siparis tablosunda da baglı oldugu kısım silinir.
--on delete cascade on  update cascade

insert into siparis values
(1,200,1),
(2,100,2),
(3,50,2),
(4,20,1),
(5,500,1)

select *from musteri;
select *from siparis;
update musteri set musterid=10 where musterid=1 --2 tabloda da guncellenir
delete from musteri where musterid=10--iki tablodan da silinir


insert into musteri(musterid,kullaniciadi) values(4,'pesin');
alter table siparis add constraint df_siparis default 4 for musid;

select*from siparis;
alter table siparis drop constraint fk_siparis_musteri
alter table siparis add constraint fk_siparis_musteri foreign key (musid)
references musteri(musterid) on delete set default  on update cascade;
delete from musteri where musterid=2;
update musteri set musterid=1 where musterid=4
