ALTER SESSION SET NLS_DATE_FORMAT=”DD-MON-YYYY”;



create table pegawai( /* ganti dalam kurung biasa */
	id_pegawai char(6), /* harus pake koma */
	nama_pegawai varchar2(30), /* harus pake koma */
	alamat varchar2(30), /* harus pake koma */			
	no_telp number(13), /* harus pake koma */
	constraint pk_pegawai primary key (id_pegawai) /* PK harusnya id_pegawai */ /* ganti dalam kurung biasa */
); 

create table customer( /* ganti nama table customer */
	id_customer char(6), /* ganti koma */
	nama_customer varchar2(20), /* inisiasi sendiri */
	alamat varchar2(30), /* tipe data salah */					
	no_telp varchar2(13), /* ganti koma */
	constraint pk_customer primary key(id_customer)  /* inisiasi primary key salah */ /*kelebihan tutup kurung*/ 
); 

create table barang( /* ganti table */
	id_barang char(6),
	nama_barang varchar2(20),
	jumlah_stok number(3), /* tipe data salah */
	harga varchar2(20), /* inisiasi tipe data salah */
	constraint pk_barang primary key(id_barang)  /* inisiasi primary key salah */			
);

create table transaksi( /* ganti dalam kurung biasa */
	id_transaksi char(11),
	tgl_transaksi date, /* + koma, salah nama kurang _ */
	total_bayar varchar2(20), /* tipe data salah + tidak ada koma */
	id_customer char(6), /* belum di inisiasi */
	id_pegawai char(6), /* belum di inisiasi */
	constraint pk_transaksi primary key (id_transaksi), /* inisiasi primary key salah */
	constraint fk_transaksi_customer foreign key (id_customer) references customer on delete cascade, /* belum di inisiasi */	
	constraint fk_transaksi_pegawai foreign key (id_pegawai) references pegawai on delete cascade	/* belum di inisiasi */ /* ganti dalam kurung biasa */
); 

create table detail_pembelian( /* nama table salah */
	id_transaksi char(11), /* tipe data salah */
	id_barang char(6), /* belum di inisiasi */
	jumlah number(3), /*inisiasi tipe data kurang*/
	constraint fk_detail_transaksi foreign key (id_transaksi) references transaksi on delete cascade, /* inisiasi foreign key salah */
	constraint fk_detail_barang foreign key (id_barang) references barang on delete cascade /* inisiasi foreign
	key salah */ /* titik koma */
); 

nomer 2 :
insert into pegawai values('PGW001','Wahyu','Buahbatu',081234567890);
insert into pegawai values('PGW002','Budi','Sukapura',081345678912);
insert into pegawai values('PGW003','Chaca','Ciganitri',081567890123);
insert into pegawai values('PGW004','Yoga','Sukabirus',081890123456);
insert into pegawai values('PGW005','Andi','Dayeuhkolot',085678901234);

insert into customer values('CUS001','Roby','Jakarta','080988999988');
insert into customer values('CUS002','Asep','Bandung','080977888877');
insert into customer values('CUS003','Purwo','Semarang','080966777766');
insert into customer values('CUS004','Berta','Medan','080955666655');
insert into customer values('CUS005','Arie','Ambon','080944555544');
insert into customer values('CUS006','Udin','Banjarmasin','080933444433');
insert into customer values('CUS007','Tuti','Yogyakarta','080922333322');

insert into barang values('BRG001','Flashdisk 64GB',9,'Rp 200.000,-');
insert into barang values('BRG002','Motherboard',21,'Rp 700.000,-');
insert into barang values('BRG003','RJ-45',53,'Rp 500,-');
insert into barang values('BRG004','Fan',3,'Rp 50.000,-');
insert into barang values('BRG005','Kabel Belden 1m',107,'Rp 2.000,-');
insert into barang values('BRG006','DVD Eksternal',86,'Rp 350.000,-');
insert into barang values('BRG007','Flashdisk 8GB',29,'Rp 100.000,-');
insert into barang values('BRG008','USB Gamepad',19,'Rp 55.000,-');
insert into barang values('BRG009','Keyboard',64,'Rp 80.000,-');
insert into barang values('BRG010','Mouse Logitech',31,'Rp 250.000,-');
insert into barang values('BRG011','USB Dongle',2,'Rp 25.000,-');
insert into barang values('BRG012','HDD Eksternal 8TB',92,'Rp 5.000.000,-');
insert into barang values('BRG013','HDD Eksternal 750GB',19,'Rp 800.000,-');
insert into barang values('BRG014','HDD Eksternal 1TB',77,'Rp 1.000.000,-');
insert into barang values('BRG015','Mousepad',212,'Rp 15.000,-');

insert into transaksi values('TRX0313-006','20-MAR-17','Rp 320.000,-','CUS001','PGW004');
insert into transaksi values('TRX0413-013','11-APR-17','Rp 350.000,-','CUS002','PGW003');
insert into transaksi values('TRX0613-021','30-APR-17','Rp.1.890.000,-','CUS007','PGW002');
insert into transaksi values('TRX0713-211','27-JUN-17','Rp 180.000,-','CUS003','PGW005');

insert into detail_pembelian values('TRX0313-006','BRG004,'3);
insert into detail_pembelian values('TRX0313-006','BRG010',1);
insert into detail_pembelian values('TRX0413-013','BRG010',2);
insert into detail_pembelian values('TRX0613-021','BRG013',1);
insert into detail_pembelian values('TRX0613-021','BRG014',1);
insert into detail_pembelian values('TRX0613-021','BRG015',1);
insert into detail_pembelian values('TRX0713-211','BRG001',1);

nomer 3 :
a. 
insert into customer values('CUS008','Ronald','Soreang','085624008888');
insert into transaksi values('TRX0813-221','08-JUL-2017','Rp 170.000,-','CUS008','PGW002');
insert into detail_pembelian values ('TRX0813-221','BRG015',10);
insert into detail_pembelian values ('TRX0813-221','BRG005',10);

b.
update barang set harga='Rp 150.000,-' where id_barang='BRG010';

c.
select nama_barang, harga from barang where harga < Rp 800.000;

d.
select * from barang where nama_barang not like '%hdd%' and jumlah_stok between 50 and 100 order by jumlah_stok asc;

e.
select * from transaksi where tgl_transaksi like '%APR%';

f.
select * from detail_pembelian where id_transaksi not like '%TRX0613-021%';


nomer 4 :
select jumlah_stok from barang order by jumlah_stok asc;
select count (id_transaksi) from detail_pembelian where id_transaksi='TRX0613-021';