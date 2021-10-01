---perintah drop table---
drop table nama_table cascade constraint;


/*silahkan betulkan codingan dibawah ini jika ada kesalahan,
tidak perlu di beri alasan*/

create table karyawan (
	ID_KARYAWAN varchar2(6),
	NAMA varchar2(25),
	NO_TELP varchar2(25),
	SHIFT varchar2(25),
	GAJI number(10),
	CONSTRAINT pk_karyawan PRIMARY KEY (ID_KARYAWAN)
);

create table member (
	ID_MEMBER varchar2(6),
	JENIS_MEMBER varchar2(25),
	DISKON number,
	CONSTRAINT pk_member PRIMARY KEY (ID_MEMBER)
);

create table supplier(
	ID_SUPPLIER varchar2(10),
	NAMA_SUPPLIER varchar2(25),
	NO_HP varchar2(25),
	ALAMAT varchar2(25),
	CONSTRAINT pk_supplier PRIMARY KEY (ID_SUPPLIER)
);

create table customer (
	ID_CUSTOMER varchar2(10),
	NAMA_CUSTOMER varchar2(25),
	NO_KTP varchar2(25),
	NO_TELP varchar2(25),
	ID_MEMBER varchar2(10),
	CONSTRAINT pk_customer PRIMARY KEY (ID_CUSTOMER),
	CONSTRAINT fk_idMember FOREIGN KEY (ID_MEMBER) REFERENCES member ON DELETE CASCADE
);

create table statuskaryawan (
	ID_STATUSKARYAWAN varchar2(10),
	JENIS_STATUS varchar2(25),
	LAMA_KONTRAK number,
	ID_KARYAWAN varchar2(6),
	CONSTRAINT pk_statuskaryawan PRIMARY KEY (ID_STATUSKARYAWAN),
	CONSTRAINT fk_statuskaryawan FOREIGN KEY (ID_KARYAWAN) REFERENCES karyawan ON DELETE CASCADE
);



create table barang (
	ID_BARANG varchar2(10),
	NAMA_BARANG varchar2(25),
	JENIS_BARANG varchar2(25),
	HARGA_DISTRIBUTOR number,
	HARGA_JUAL number(30),
	ID_SUPPLIER varchar(10),
	STOK_BARANG number(15),
	CONSTRAINT pk_barang PRIMARY KEY (ID_BARANG),
	CONSTRAINT fk_idSupplier FOREIGN KEY (ID_SUPPLIER) REFERENCES SUPPLIER ON DELETE CASCADE
);

create table pembelian (
	ID_PEMBELIAN varchar2(10),
	TANGGAL_BELI varchar2(30),
	HARGA_TOTAL number,
	JUMLAH number,
	ID_CUSTOMER varchar2(10),
	ID_BARANG varchar2(10),
	CONSTRAINT pk_pembelian PRIMARY KEY (ID_PEMBELIAN),
	CONSTRAINT fk1_customer FOREIGN KEY (ID_CUSTOMER) REFERENCES customer ON DELETE CASCADE,
	CONSTRAINT fk2_barang FOREIGN KEY (ID_BARANG) REFERENCES barang ON DELETE CASCADE
);



insert into karyawan values ('KR_001','Selena', 085645329756, '07.30 – 14.30', 2500000);
insert into karyawan values ('KR_002','Darwin', 081209800097, '07.30 – 14.30', 3000000);
insert into karyawan values ('KR_003','Agnes', 082345128970, '14.30 – 22.30', 2000000);
insert into karyawan values ('KR_004','Messy', 085668453210, '07.30 – 14.30', 3500000); 

insert into member values('M',	'Member',		10);
insert into member values('NM',	'Non Member',	0);

insert into supplier values('SPP_300',	'PT. UKM',	'022800900',	'Bandung');
insert into supplier values('SPP_301',	'PT. AYO',	'021898908',	'Jakarta');
insert into supplier values('SPP_302',	'PT.LEE',	'022564401',	'Bandung');
insert into supplier values('SPP_303',	'PT. KIM',	'022901239',	'Jakarta');

insert into customer values('IC_1001',	'Wardah',	'12345678911',	'082254374568',	'M');
insert into customer values('IC_1002',	'Sariayu',	'13457009911',  '085290764563',	'NM');
insert into customer values('IC_1003',	'MAC',		'14562087576',	'087712321100',	'M');
insert into customer values('IC_1004',	'Sephora',	'12979463386',	'085690764532',	'NM');

insert into statuskaryawan values ('IA','Manager Supplier', 	3, 		'KR_003');
insert into statuskaryawan values ('IIA','Cashier',				2.5,	'KR_002');
insert into statuskaryawan values ('IIIA','Waiter',				2.5,	'KR_001');
insert into statuskaryawan values ('IVA','Training', 			1,		'KR_004');

insert into barang values ('BRG_001','Rinso','Alat Cuci', 25000, 30000,'SPP_300',20);
insert into barang values ('BRG_002','Molto', 'Alat Cuci',	15000,20000,'SPP_301',18);
insert into barang values ('BRG_003','Sampo','Alat Mandi',	18000,22000,'SPP_302',25);
insert into barang values ('BRG_004','Biskuit Roma','Makanan',5000,8000,'SPP_302',50);
insert into barang values ('BRG_005','Coca-cola','Minuman',12500,15000,'SPP_300',20);
insert into barang values ('BRG_006','Facial Wash','Alat Mandi',12000,15000,'SPP_301',10);
insert into barang values ('BRG_007','Oreo','Makanan',6000,9000	,'SPP_303',50);
insert into barang values ('BRG_008','Chitato','Makanan',9000,13000	,'SPP_303',30);
insert into barang values ('BRG_009','AQUA','Minuman',3000,5000	,'SPP_301',10); 
insert into barang values ('BRG_010','Teh Celup','Minuman',7000,10000,'SPP_300',45);

insert into pembelian values('TRX_780',	'10-01-2017',60000,4,'IC_1001','BRG_006');
insert into pembelian values('TRX_781',	'11-01-2017',240000,8,'IC_1004','BRG_001');
insert into pembelian values('TRX_782',	'21-01-2017',16000,2,'IC_1002','BRG_004');
insert into pembelian values('TRX_783',	'29-01-2017',45000,9,'IC_1001','BRG_009');
insert into pembelian values('TRX_784',	'06-02-2017',135000,15,'IC_1003','BRG_007');
insert into pembelian values('TRX_785',	'07-02-2017',66000,3,'IC_1004','BRG_003');

/*nomer 1 */
select * from customer order by id_customer asc;

/*nomer2 */
select id_customer, NAMA_CUSTOMER, NO_KTP,NO_TELP,ID_MEMBER,
case ID_MEMBER 
when 'M' then 'Member' 
when 'NM' then 'NonMember'
else 'SALAH ISI'  
end 
from customer;

/*nomer 3*/
select count (id_karyawan) from karyawan;

/*nomer 4*/
select sum (stok_barang) from barang;

/*nomer 5*/
select nama, gaji
from karyawan, statuskaryawan
where (lama_kontrak>1);

/*nomer 6*/
select id_supplier, nama_supplier, stok_barang
from barang , supplier;

/*select 7*/
select count (id_member) from member;
select count (id_member) from customer;

/*select 8*/
select avg (harga_distributor),
avg (harga_jual) 
from barang;

/*nomer 9*/
select max (gaji)gaji_tertinggi,
min (gaji)gaji_terendah
from karyawan;

/*nomer 10*/
select nama_barang, harga_jual
from barang
where (harga_jual > 7000 and stok_barang > 15)
and (id_supplier = 'SPP_300' or id_supplier = 'SPP_301');


/*-----------------------NOMER KELUARGA-------------------------------*/
create table keluarga (
nama varchar2(20) constraint pk_keluarga primary key,
status varchar2(20),
umur number(4),
pekerjaan varchar2(20)
);

insert into keluarga values('Amir','Anak',20,'Mahasiswa');
insert into keluarga values('Hakim','Anak',12,'Siswa');
insert into keluarga values('Fira','Anak',17,'Siswa');
insert into keluarga values('Dinda','Anak',13,'Siswa');
insert into keluarga values('Zuhro','Ibu',43,'Wiraswata');
insert into keluarga values('Hj. Julaika','Nenek',68,'null');


/*nomer a*/
select * from keluarga order by nama asc;
/*nomer b*/
select nama from keluarga where (umur < 20);
/*nomer c*/
select nama from keluarga where (status = 'Ibu' or status = 'Nenek');
/*nomer d*/
select avg(umur) rata_rata from keluarga;
/*nomer e*/
select count(nama) keluarga from keluarga;