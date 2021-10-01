create table pembeli (kode_pembeli varchar(6) primary key,nama_pembeli varchar(25),alamat varchar(20),no_telp varchar(20));

insert into pembeli (kode_pembeli,nama_pembeli,alamat,no_telp) values ('CUS001','AMIRUL HIDAYAT','JAKARTA','0809889999888');
insert into pembeli (kode_pembeli,nama_pembeli,alamat,no_telp) values ('CUS002','BETSY SEPTIANI','TANGGERANG','0809889999881');
insert into pembeli (kode_pembeli,nama_pembeli,alamat,no_telp) values ('CUS003','CAKRA VANIA','MAKASAR','0809889999882');
insert into pembeli (kode_pembeli,nama_pembeli,alamat,no_telp) values ('CUS004','DWI KRISNA','BANDUNG','0809889999883');
insert into pembeli (kode_pembeli,nama_pembeli,alamat,no_telp) values ('CUS005','EDWIN JOSUA','SOLO','0809889999884');


create table barang (kode_barang varchar(6) primary key,nama_barang varchar(20),stok number,harga number);
insert into barang (kode_barang,nama_barang,stok,harga) values ('BRG001','flashdisk',199,100000);
insert into barang (kode_barang,nama_barang,stok,harga) values ('BRG002','UBS OTG',50,50000);
insert into barang (kode_barang,nama_barang,stok,harga) values ('BRG003','CD-RW',500,6000);
insert into barang (kode_barang,nama_barang,stok,harga) values ('BRG004','Card Reader',500,25000);
insert into barang (kode_barang,nama_barang,stok,harga) values ('BRG005','Mouse Pad',100,8000);


create table pegawai(kode_pegawai varchar(6) primary key,nama_pegawai varchar(25),alamat varchar(20),no_telp varchar(20));

insert into pegawai (kode_pegawai,nama_pegawai,alamat,no_telp) values ('PGW001','HAFIZH','BUAHBATU','081234567890');
insert into pegawai (kode_pegawai,nama_pegawai,alamat,no_telp) values ('PGW002','INTAN','DAYEUH KOLOT','081234887890');
insert into pegawai (kode_pegawai,nama_pegawai,alamat,no_telp) values ('PGW003','JOKO','CIKONENG','081234437890');
insert into pegawai (kode_pegawai,nama_pegawai,alamat,no_telp) values ('PGW004','KUSMORO','BUAHBATU','081234757890');
insert into pegawai (kode_pegawai,nama_pegawai,alamat,no_telp) values ('PGW005','LUSIANA','CIGANITRI','081234757890');

create table transaksi(kode_transaksi varchar(6) primary key ,tgl_transaksi date,jumlah number,kode_pembeli varchar(6),kode_barang varchar(6)
,kode_pegawai varchar(6),total_harga number,
constraint fk_transaksi foreign key(kode_pembeli) references pembeli on delete cascade,
constraint fk_transaksi2 foreign key(kode_barang) references barang on delete cascade,
constraint fk_transaksi3 foreign key(kode_pegawai) references pegawai on delete cascade);
 
insert into transaksi (kode_transaksi,tgl_transaksi,jumlah,kode_pembeli,kode_barang,kode_pegawai,total_harga)
values ('TRX001','26-NOV-16','10','CUS001','BRG001','PGW001',1000000);
insert into transaksi (kode_transaksi,tgl_transaksi,jumlah,kode_pembeli,kode_barang,kode_pegawai,total_harga)
values ('TRX002','11-DEC-16','25','CUS002','BRG004','PGW001',625000); 
insert into transaksi (kode_transaksi,tgl_transaksi,jumlah,kode_pembeli,kode_barang,kode_pegawai,total_harga)
values ('TRX003','04-JAN-17','5','CUS005','BRG003','PGW004',30000);
insert into transaksi (kode_transaksi,tgl_transaksi,jumlah,kode_pembeli,kode_barang,kode_pegawai,total_harga)
values ('TRX004','29-JAN-17','50','CUS003','BRG001','PGW003',5000000);