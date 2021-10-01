create table karyawan (
	ID_KARYAWAN varchar2(7),
	NAMA_KARYAWAN varchar2(15),
	NO_TELP varchar2(14),
	SHIFT varchar2(25),
	GAJI number,
	CONSTRAINT pk_karyawan PRIMARY KEY (ID_KARYAWAN)
);

create table supplier(
	ID_SUPPLIER varchar2(7),
	NAMA_SUPPLIER varchar2(9),
	NO_HP varchar2(14),
	ALAMAT varchar2(10),
	CONSTRAINT pk_supplier PRIMARY KEY (ID_SUPPLIER)
);

create table member (
	ID_MEMBER varchar2(4),
	JENIS_MEMBER varchar2(10),
	DISKON varchar2(5),
	CONSTRAINT pk_member PRIMARY KEY (ID_MEMBER)
);

create table statuskaryawan (
	ID_STATUSKARYAWAN varchar2(7),
	JENIS_STATUS varchar2(17),
	LAMA_KONTRAK number,
	ID_KARYAWAN varchar2(7),
	CONSTRAINT pk_statuskaryawan PRIMARY KEY (ID_STATUSKARYAWAN),
	CONSTRAINT fk_idkaryawan FOREIGN KEY (ID_KARYAWAN) REFERENCES karyawan ON DELETE CASCADE
);



create table barang (
	ID_BARANG varchar2(7),
	NAMA_BARANG varchar2(15),
	JENIS_BARANG varchar2(8),
	HARGA_DIST number,
	HARGA_JUAL number,
	ID_SUPPLIER varchar2(7),
	STOK_BARANG number,
	CONSTRAINT pk_barang PRIMARY KEY (ID_BARANG),
	CONSTRAINT fk_idsupplier FOREIGN KEY (ID_SUPPLIER) REFERENCES SUPPLIER ON DELETE CASCADE
);



create table customer (
	ID_CUSTOMER varchar2(7),
	NAMA_CUSTOMER varchar2(15),
	NO_KTP varchar2(13),
	NO_TELP varchar2(14),
	ID_MEMBER varchar2(7),
	CONSTRAINT pk_customer PRIMARY KEY (ID_CUSTOMER),
	CONSTRAINT fk_idMember FOREIGN KEY (ID_MEMBER) REFERENCES MEMBER ON DELETE CASCADE
);

create table pembelian (
	ID_PEMBELIAN varchar2(7),
	TANGGAL_BELI varchar2(10),
	HARGA_TOTAL number,
	JUMLAH number,
	ID_CUSTOMER varchar2(7),
	ID_BARANG varchar2(7),
	CONSTRAINT pk_pembelian PRIMARY KEY (ID_PEMBELIAN),
	CONSTRAINT fk1_Customer FOREIGN KEY (ID_CUSTOMER) REFERENCES CUSTOMER ON DELETE CASCADE,
	CONSTRAINT fk2_Barang FOREIGN KEY (ID_BARANG) REFERENCES BARANG ON DELETE CASCADE
);

insert into karyawan values ('KR_901','Ratna Galih', 	'085860057938', '14.30 – 22.30', 2500000);
insert into karyawan values ('KR_921','Cinta Laura', 	'085867908995', '07.30 – 14.30', 2450000);
insert into karyawan values ('KR_941','Cita Citata', 	'084490331111', '07.30 – 14.30', 3000000);
insert into karyawan values ('KR_931','Isyana', 	'081809830098', '07.30 – 14.30', 3500000);
insert into karyawan values ('KR_911','Raisa', 		'089900119910', '14.30 – 22.30', 1900000);

insert into statuskaryawan values ('IA','Manager Supplier', 	3, 'KR_921');
insert into statuskaryawan values ('IIA','Cashier',		2.5,'KR_941');
insert into statuskaryawan values ('IIIA','Waiter',		2.5,'KR_921');
insert into statuskaryawan values ('IVA','Training',		1, 'KR_931');

insert into member values('M',	'Member',	'10%');
insert into member values('NM',	'Non Member',	'0 %');

insert into supplier values('SPP_300',	'PT. UKM',	'022800900',	'Bandung');
insert into supplier values('SPP_301',	'PT. USM',	'021898908',	'Jakarta');
insert into supplier values('SPP_302',	'Garmenia',	'022564401',	'Bandung');
insert into supplier values('SPP_303',	'PT. KIM',	'02679012390',	'Karawang');

insert into barang values ('BRG_001','Dress Sofia',	'Dress', 95000, 150000,	'SPP_300',10);
insert into barang values ('BRG_002','Boy Jeans', 	'Pants',100000,170000,	'SPP_301',18);
insert into barang values ('BRG_003','Parka',		'Jacket',120000,180000,	'SPP_302',20);
insert into barang values ('BRG_004','Batwing Cardi',	'Jacket',45000,100000,	'SPP_302',50);
insert into barang values ('BRG_005','Peplum Dress',	'Dress',65000,120000,	'SPP_300',30);
insert into barang values ('BRG_006','Jegging',		'Pants',40000,90000,	'SPP_301',33);
insert into barang values ('BRG_007','Klok Skirt',	'Skirt',70000,110000,	'SPP_303',55);
insert into barang values ('BRG_008','Mini Pants',	'Pants',90000,130000,	'SPP_301',30);
insert into barang values ('BRG_009','Legging',		'Pants',45000,95000,	'SPP_301',10);
insert into barang values ('BRG_010','Tunik Dress',	'Dress',90000,130000,	'SPP_300',45);

insert into customer values('IC_1001',	'Heni Wulandari',	'12345678911',	'089988334040',	'M');
insert into customer values('IC_1002',	'Yuliani',		'13457009911',  '086755643978',	'NM');
insert into customer values('IC_1003',	'Geraldin',		'14562087576',	'087465528701',	'M');
insert into customer values('IC_1004',	'Piter',		'12979463386',	'085681037891',	'NM');

insert into pembelian values('PBX_780',	'21-09-2015',330000,3,'IC_1001','BRG_007');
insert into pembelian values('PBX_781',	'01-10-2015',260000,2,'IC_1004','BRG_008');
insert into pembelian values('PBX_782',	'22-09-2015',120000,1,'IC_1002','BRG_005');
insert into pembelian values('PBX_783',	'25-09-2015',450000,6,'IC_1001','BRG_006');
insert into pembelian values('PBX_784',	'27-09-2015',275000,3,'IC_1003','BRG_009');
insert into pembelian values('PBX_785',	'29-09-2015',450000,3,'IC_1004','BRG_001');


/*nomer4*/
create table pembeli (
	ID_CUSTOMER varchar2(7),
	NAMA_PEMBELI varchar2(15),
	NO_KTP varchar2(13),
	NO_TELP varchar2(14),
	ID_MEMBER varchar2(7),
	CONSTRAINT fk_customer FOREIGN KEY (ID_CUSTOMER) REFERENCES CUSTOMER ON DELETE CASCADE,
	CONSTRAINT fk2_idMember FOREIGN KEY (ID_MEMBER) REFERENCES MEMBER ON DELETE CASCADE
);

insert into pembeli values('IC_1001',	'Heni Wulandari',	'12345678911',	'089988334040',	'M');
insert into pembeli values('IC_1002',	'Yuliani',		'13457009911',  '086755643978',	'NM');
insert into pembeli values('IC_1003',	'Geraldin',		'14562087576',	'087465528701',	'M');
insert into pembeli values('IC_1004',	'Piter',		'12979463386',	'085681037891',	'NM');

/*NOMER 5a*/
select nama_barang, stok_barang from barang
where stok_barang =
(select min(stok_barang)
from barang);

/*NOMER 5b*/
select nama_karyawan, gaji
from karyawan
where gaji < all
(select avg(gaji) from karyawan);

/*NOMER 5c*/
select id_customer, harga_total from pembelian
where harga_total =
(select max(harga_total) from pembelian);



select nama_karyawan, gaji
from karyawan
where gaji =
((select min(gaji) from karyawan) < gaji < (select max(gaji) from karyawan));


SELECT nama_karyawan, gaji from karyawan 
where gaji != (SELECT max(gaji) from karyawan) and gaji != (SELECT min(gaji) from karyawan) ;

SELECT  nama_barang,stok_barang from barang b 
where b.nama_barang in ( SELECT nama_barang  From barang 
where substr(nama_barang,0,1) !='P' ) and b.stok_barang < (SELECT avg(stok_barang)  From barang) ;


SELECT  
sum(HARGA_JUAL*STOK_BARANG)-sum(HARGA_DIST * STOK_BARANG) LABA 
  from barang where STOK_BARANG in (SELECT STOK_BARANG from barang where
  STOK_BARANG !=0 );



create user modul5 identified by modul5;

grant connect, resource, dba, all privilege to modul5;