ALTER SESSION SET NLS_DATE_FORMAT=”DD-MON-YYYY”;
SET SERVEROUTPUT ON;

drop table detail_transaksi;
drop table transaksi;
drop table barang;
drop table customer;

CREATE TABLE barang(
	kode_barang varchar(10),
	nama_barang varchar(50),
	harga_barang number,
	stok_barang number,
	constraint pk_barang primary key (kode_barang)
);

CREATE TABLE customer(
	id_customer varchar(10),
	nama_customer varchar(50),
	constraint pk_customer primary key (id_customer)
);

CREATE TABLE transaksi(
	id_transaksi varchar(10),
	tanggal_transaksi date,
	id_customer varchar(10),
	constraint pk_transaksi primary key(id_transaksi),
	constraint fk_transaksi foreign key (id_customer) references customer on delete cascade
);

CREATE TABLE detail_transaksi(
	id_transaksi varchar(10),
	kode_barang varchar(10),
	jumlah number,
	total_harga number,
	constraint pk_detail_transaksi primary key(id_transaksi, kode_barang),
	constraint fk_detail_transaksi1 foreign key (id_transaksi) references transaksi on delete cascade,
	constraint fk_detail_transaksi2 foreign key (kode_barang) references barang on delete cascade
);

INSERT INTO barang values('BRG001','iPhone 7',12000000,12);
INSERT INTO barang values('BRG002','Galaxy S7',9000000,6);
INSERT INTO barang values('BRG003','Xiaomi Mi5',3400000,12);
INSERT INTO barang values('BRG004','Oppo F1 Plus',5500000,10);
INSERT INTO barang values('BRG005','LG G5 SE',8000000,7);
INSERT INTO barang values('BRG006','Sony Xperia',10500000,4);
INSERT INTO barang values('BRG007','Zenfone 3',4500000,12);
INSERT INTO barang values('BRG008','Huawei P9',9000000,15);
INSERT INTO barang values('BRG009','iPhone 6S',10000000,20);
INSERT INTO barang values('BRG010','OnePlus 3',4000000,40);

INSERT INTO customer values('CUS001','Icih Caroline');
INSERT INTO customer values('CUS002','Christopher Tugimin');
INSERT INTO customer values('CUS003','Charles Cecep');
INSERT INTO customer values('CUS004','Nicholas Supardi');
INSERT INTO customer values('CUS005','Angelina Markonah');
INSERT INTO customer values('CUS006','Alexander Purwoto');
INSERT INTO customer values('CUS007','Wahyudi Atkinson');
INSERT INTO customer values('CUS008','Sebastian Asep');

INSERT INTO transaksi values('TRA001','10-Nov-2016','CUS002');
INSERT INTO transaksi values('TRA002','11-Nov-2016','CUS003');
INSERT INTO transaksi values('TRA003','11-Nov-2016','CUS001');
INSERT INTO transaksi values('TRA004','12-Nov-2016','CUS008');

INSERT INTO detail_transaksi values('TRA001','BRG002',1,9000000);
INSERT INTO detail_transaksi values('TRA001','BRG003',3,10200000);
INSERT INTO detail_transaksi values('TRA001','BRG006',1,10500000);
INSERT INTO detail_transaksi values('TRA002','BRG004',1,5500000);
INSERT INTO detail_transaksi values('TRA002','BRG001',2,24000000);
INSERT INTO detail_transaksi values('TRA002','BRG005',3,24000000);
INSERT INTO detail_transaksi values('TRA003','BRG007',1,4500000);
INSERT INTO detail_transaksi values('TRA003','BRG008',2,18000000);
INSERT INTO detail_transaksi values('TRA004','BRG009',1,12000000);
INSERT INTO detail_transaksi values('TRA004','BRG010',3,30000000);
INSERT INTO detail_transaksi values('TRA004','BRG001',1,12000000);
INSERT INTO detail_transaksi values('TRA004','BRG003',1,3400000);

commit;

CREATE OR REPLACE PACKAGE pg_faktur IS
	procedure cek_transaksi(id transaksi.id_transaksi%type);
	function total_harga(id transaksi.id_transaksi%type) return number;
end pg_faktur;
/

CREATE OR REPLACE PACKAGE BODY pg_faktur IS
	procedure cek_transaksi(id transaksi.id_transaksi%type) IS
		cursor c is select nama_barang, jumlah, total_harga from detail_transaksi dt, barang b where dt.kode_barang = b.kode_barang and id_transaksi = id;
		tgl date;
		nama customer.nama_customer%type;
		begin
			select tanggal_transaksi, nama_customer into tgl, nama from transaksi t, customer c where t.id_customer = c.id_customer and t.id_transaksi=id;
			DBMS_OUTPUT.PUT_LINE('ID Transaksi  : '||id);
			DBMS_OUTPUT.PUT_LINE('Tgl Transaksi : '||tgl);
			DBMS_OUTPUT.PUT_LINE('Nama Pembeli  : '||nama);
			DBMS_OUTPUT.PUT_LINE('		------    Detail Penjualan    ------');
			DBMS_OUTPUT.PUT_LINE('No.'||chr(9)||'Nama Barang'||chr(9)||'Jumlah'||chr(9)||'Harga');
			for data in c loop
				DBMS_OUTPUT.PUT_LINE(c%ROWCOUNT||'.'||chr(9)||data.nama_barang||chr(9)||data.jumlah||chr(9)||'Rp. '||data.total_harga);
			end loop;
			DBMS_OUTPUT.PUT_LINE('Total Harga : '||total_harga(id));
		exception
			WHEN NO_DATA_FOUND THEN
				DBMS_OUTPUT.PUT_LINE('Transaksi dengan ID : '||id||' tidak ditemukan!');
		end;
	function total_harga(id transaksi.id_transaksi%type) return number IS
		total number;
		begin
			select sum(total_harga) into total from detail_transaksi where id_transaksi = id;
			return total;
		end;
end pg_faktur;
/

exec pg_faktur.cek_transaksi('TRA001');
exec pg_faktur.cek_transaksi('TRA2');

/*no 2*/
CREATE OR REPLACE PACKAGE pg_brg IS
	procedure tampil;
	procedure tampil(kriteria varchar);
end pg_brg;
/

CREATE OR REPLACE PACKAGE BODY pg_brg IS
	procedure tampil IS
		cursor c is select * from barang;
		begin
			DBMS_OUTPUT.PUT_LINE('Nama Barang'||chr(9)||'Harga'||chr(9)||chr(9)||'Stok');
			for data in c loop
				DBMS_OUTPUT.PUT_LINE(data.nama_barang||chr(9)||'Rp. '||data.harga_barang||chr(9)||data.stok_barang);
			end loop;
		end;
	procedure tampil(kriteria varchar) IS
		begin
			DBMS_OUTPUT.PUT_LINE('Nama Barang'||chr(9)||'Harga'||chr(9)||chr(9)||'Stok');
			if kriteria = 'termahal' then
				for data in (select * from barang order by harga_barang desc) loop
					DBMS_OUTPUT.PUT_LINE(data.nama_barang||chr(9)||'Rp. '||data.harga_barang||chr(9)||data.stok_barang);
				end loop;
			elsif kriteria = 'termurah' then
				for data in (select * from barang order by harga_barang asc) loop
					DBMS_OUTPUT.PUT_LINE(data.nama_barang||chr(9)||'Rp. '||data.harga_barang||chr(9)||data.stok_barang);
				end loop;
			end if;
		end;
end pg_brg;
/
exec pg_brg.tampil;
exec pg_brg.tampil('termahal');
exec pg_brg.tampil('termurah');
