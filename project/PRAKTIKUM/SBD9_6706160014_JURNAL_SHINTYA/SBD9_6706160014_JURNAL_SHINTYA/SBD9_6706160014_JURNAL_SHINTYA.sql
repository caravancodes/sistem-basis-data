/*MUHAMMAD FAISAL AMIR - 6706160014 - D3IF-40-02*/

ALTER SESSION SET NLS_DATE_FORMAT="DD-MM-YYYY";

create table karyawan (
	ID_KARYAWAN varchar2(10),
	NAMA_KARYAWAN varchar2(25),
	NO_TELP varchar2(25),
	SHIFT varchar2(25),
	GAJI number,
	CONSTRAINT pk_Karyawan PRIMARY KEY (ID_KARYAWAN)
);

create table statuskaryawan (
	ID_STATUSKARYAWAN varchar2(10),
	JENIS_STATUS varchar2(25),
	LAMA_KONTRAK number,
	ID_KARYAWAN varchar2(6),
	CONSTRAINT pk_StatusKaryawan PRIMARY KEY (ID_STATUSKARYAWAN),
	CONSTRAINT fk_idkaryawan FOREIGN KEY (ID_KARYAWAN) REFERENCES KARYAWAN ON DELETE CASCADE
);

create table supplier(
	ID_SUPPLIER varchar2(10),
	NAMA_SUPPLIER varchar2(25),
	NO_HP varchar2(25),
	ALAMAT varchar2(25),
	CONSTRAINT pk_Supplier PRIMARY KEY (ID_SUPPLIER)
);

create table barang (
	ID_BARANG varchar2(10),
	NAMA_BARANG varchar2(25),
	JENIS_BARANG varchar2(25),
	HARGA_DIST number,
	HARGA_JUAL number,
	ID_SUPPLIER varchar(10),
	STOK_BARANG number,
	CONSTRAINT pk_Barang PRIMARY KEY (ID_BARANG),
	CONSTRAINT fk_idSupplier FOREIGN KEY (ID_SUPPLIER) REFERENCES SUPPLIER ON DELETE CASCADE
);

create table member (
	ID_MEMBER varchar2(6),
	JENIS_MEMBER varchar2(25),
	DISKON number,
	CONSTRAINT pk_Member PRIMARY KEY (ID_MEMBER)
);

create table customer (
	ID_CUSTOMER varchar2(10),
	NAMA_CUSTOMER varchar2(25),
	NO_KTP varchar2(25),
	NO_TELP varchar2(25),
	ID_MEMBER varchar2(10),
	CONSTRAINT pk_Customer PRIMARY KEY (ID_CUSTOMER),
	CONSTRAINT fk_idMember FOREIGN KEY (ID_MEMBER) REFERENCES MEMBER ON DELETE CASCADE
);

create table pembelian (
	ID_PEMBELIAN varchar2(10),
	TANGGAL_BELI date,
	HARGA_TOTAL number,
	JUMLAH number,
	ID_CUSTOMER varchar2(10),
	ID_BARANG varchar2(10),
	CONSTRAINT pk_Pembelian PRIMARY KEY (ID_PEMBELIAN),
	CONSTRAINT fk1_Customer FOREIGN KEY (ID_CUSTOMER) REFERENCES CUSTOMER (ID_CUSTOMER) ON DELETE CASCADE,
	CONSTRAINT fk2_Barang FOREIGN KEY (ID_BARANG) REFERENCES BARANG(ID_BARANG) ON DELETE CASCADE
);

insert into karyawan values ('KR_901','Ratna Galih', '085860057938', '14.30 – 22.30', 2500000);
insert into karyawan values ('KR_921','Cinta Laura', '085867908995', '07.30 – 14.30', 2450000);
insert into karyawan values ('KR_941','Cita Citata', '084490331111', '07.30 – 14.30', 3000000);
insert into karyawan values ('KR_931','Isyana', '081809830098', '07.30 – 14.30', 3500000);
insert into karyawan values ('KR_911','Raisa', '089900119910', '14.30 – 22.30', 1900000);

insert into statuskaryawan values ('IA','Manager Supplier', 3, 'KR_921');
insert into statuskaryawan values ('IIA','Cashier',	2.5,'KR_941');
insert into statuskaryawan values ('IIIA','Waiter',	2.5,'KR_921');
insert into statuskaryawan values ('IVA','Training', 1,	'KR_931');

insert into member values('M',	'Member',	'1');
insert into member values('NM',	'Non Member',	'0');

insert into supplier values('SPP_300',	'PT. UKM',	'022800900',	'Bandung');
insert into supplier values('SPP_301',	'PT. USM',	'021898908',	'Jakarta');
insert into supplier values('SPP_302',	'Garmenia',	'022564401',	'Bandung');
insert into supplier values('SPP_303',	'PT. KIM',	'02679012390',	'Karawang');

insert into barang values ('BRG_001','Dress Sofia','Dress', 95000, 150000,'SPP_300',10);
insert into barang values ('BRG_002','Boy Jeans', 'Pants',	100000,170000,'SPP_301',18);
insert into barang values ('BRG_003','Parka','Jacket',	120000,180000,'SPP_302',20);
insert into barang values ('BRG_004','Batwing Cardi','Jacket',45000,100000,'SPP_302',50);
insert into barang values ('BRG_005','Peplum Dress','Dress',65000,120000,'SPP_300',30);
insert into barang values ('BRG_006','Jegging','Pants',40000,90000,'SPP_301',33);
insert into barang values ('BRG_007','Klok Skirt','Skirt',70000,110000	,'SPP_303',55);
insert into barang values ('BRG_008','Mini Pants','Pants',90000,130000	,'SPP_301',30);
insert into barang values ('BRG_009','Legging','Pants',45000,95000	,'SPP_301',10);
insert into barang values ('BRG_010','Tunik Dress','Dress',90000,130000,'SPP_300',45);

insert into customer values('IC_1001',	'Heni Wulandari',	'12345678911',	'089988334040',	'M');
insert into customer values('IC_1002',	'Yuliani',	'13457009911', '086755643978',	'NM');
insert into customer values('IC_1003',	'Geraldin',	'14562087576',	'087465528701',	'M');
insert into customer values('IC_1004',	'Piter',	'12979463386',	'085681037891',	'NM');

insert into pembelian values('PBX_780',	'21-09-2015',330000,3,'IC_1001','BRG_007');
insert into pembelian values('PBX_781',	'01-10-2015',260000,2,'IC_1004','BRG_008');
insert into pembelian values('PBX_782',	'22-09-2015',120000,1,'IC_1002','BRG_005');
insert into pembelian values('PBX_783',	'25-09-2015',450000,6,'IC_1001','BRG_006');
insert into pembelian values('PBX_784',	'27-09-2015',275000,15,'IC_1003','BRG_009');
insert into pembelian values('PBX_787',	'28-09-2015',275000,5,'IC_1003','BRG_009');
insert into pembelian values('PBX_788',	'28-12-2015',275000,10,'IC_1003','BRG_008');
insert into pembelian values('PBX_785',	'29-09-2015',450000,3,'IC_1004','BRG_001');

commit;

/*NOMER 1*/
create or replace trigger before_insert_barang before insert on barang for each row declare v_num number;
begin
select count(*) into v_num from barang where id_supplier =:new.id_supplier;
if v_num > 2 then raise_application_error(-20001, 'Jumlah maksimal barang terpenuhi. Anda tidak boleh menambah barang lagi');
end if;
exception when no_data_found then raise_application_error(-20002, 'data supplier tidak ada');
end;
/
insert into barang values ('BRG_017','Parka aj','Jacket',	120000,180000,'SPP_302',20);

/*NOMER 2*/
create or replace trigger cek_jumlah_stok 
before insert on pembelian 
for each row 
declare tmp_jmllah number;
begin
select stok_barang into tmp_jmllah from barang where id_barang = :new.id_barang;
if :new.jumlah > tmp_jmllah then raise_application_error(-20001, 'Jumlah Stok Barang Tidak Mencukupi');
end if;
exception
when no_data_found then raise_application_error(-20002, 'barang tidak ada');
end;
/
insert into pembelian values('PBX_790',	'28-09-2015',275000,20,'IC_1003','BRG_009');


/*NOMER 3*/
create or replace trigger update_stok_barang
after insert on pembelian
for each row
declare
tmp_jml number;
begin
select stok_barang into tmp_jml from barang where id_barang = :new.id_barang;
if inserting then tmp_jml := tmp_jml - :new.jumlah;
update barang set stok_barang  = tmp_jml where id_barang = :new.id_barang;
end if;
end;
/

insert into pembelian values('PBX_793',	'29-09-2015',450000,15,'IC_1004','BRG_010');


/*NOMER 4*/
create or replace trigger before_inser_barang
before insert on barang
for each row
declare
v_pegawai number;
begin 
if :new.id_supplier not in ('SPP_303','SPP_302') then raise_application_error(-20001, 'Anda Tidak Ada Hak');
end if;
end;
/
insert into barang values ('BRG_015','Tunik Dress','Dress',90000,130000,'SPP_300',45);