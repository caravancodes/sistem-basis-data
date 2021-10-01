create table pembeli (
kode_pembeli char(20) constraint pk_pembeli primary key,
nama_pembeli varchar2(25),
alamat varchar2(10),
no_telp number(20) );

create table barang (
kode_barang char(20) constraint pk_barang primary key,
nama_barang varchar2(25),
stok number(10),
harga number(30) );

create table pegawai (
kode_pegawai char(20) constraint pk_pegawai primary key,
nama_pegawai varchar2(25),
alamat_pegawai varchar2(30),
no_telp_pegawai number(14) );

create table transaksi (
kode_transaksi char(6) constraint pk_transaksi primary key,
tgl_transaksi date,
jumlah_transaksi number(10),
kode_pembeli char(20),
kode_barang char(20),
kode_pegawai char(20),
total_harga varchar2(30),
constraint fk_pegawai foreign key(kode_pegawai) references pegawai on delete cascade,
constraint fk_barang foreign key(kode_barang) references barang on delete cascade,
constraint fk_pembeli foreign key(kode_pembeli) references pembeli on delete cascade );

insert into pembeli values ('CUS001','Amirul Hidayat','Jakarta', 080988999988);
insert into pembeli values ('CUS002','Betsy Septiani','Tangerang', 080988999981);
insert into pembeli values ('CUS003','Cakra Vania','Makassar', 080988999982);
insert into pembeli values ('CUS004','Dwi Krisna','Bandung', 080988999983);
insert into pembeli values ('CUS005','Edwin Josua','Solo', 080988999984);

insert into barang values ('BRG001','Flashdisk',199,100000);
insert into barang values ('BRG002','USB OTG',50,50000);
insert into barang values ('BRG003','CD-RW',500,6000);
insert into barang values ('BRG004','Card Reader',30,25000);
insert into barang values ('BRG005','Mouse Pad',100,8500);

insert into pegawai values ('PGW001','Hafizh','Buahbatu',081234567890);
insert into pegawai values ('PGW002','Intan','Dayeuhkolot',081234567890);
insert into pegawai values ('PGW003','Joko','Cikoneng',081234567890);
insert into pegawai values ('PGW004','Kusmuro','Buahbatu',081234567890);
insert into pegawai values ('PGW005','Lusiana','Ciganitri',081234567890);

insert into transaksi values ('TRX001','20-NOV-16',10,'CUS001','BRG001','PGW001','Rp. 1.000.000');
insert into transaksi values ('TRX002','11-DES-16',25,'CUS002','BRG004','PGW001','Rp. 625.000');
insert into transaksi values ('TRX003','04-JAN-17',5,'CUS005','BRG003','PGW004','Rp.30.000');
insert into transaksi values ('TRX004','29-JAN-16',50,'CUS003','BRG001','PGW003','Rp. 5.000.000');