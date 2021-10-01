JURNAL 1
create table supplier (
id_supplier char(20) constraint pk_supplier primary key,
no_telp_supplier number(14),
nama_supplier varchar(30),
alamat_supplier varchar(30) 
);

create table petugas (
id_petugas char(20) constraint pk_petugas primary key,
no_telp_petugas number(14),
nama_petugas varchar(30),
alamat_petugas varchar(30) 
);

create table mahasiswa (
nim varchar(10) constraint pk_mahasiswa primary key,
nama_mahasiswa varchar(20),
telp_mahahasiswa varchar(14),
alamat_mahasiswa varchar(30),
jenis_kelamin varchar(8),
email_mahasiswa varchar(30),
ttl date 
);

create table lokasi (
id_lokasi char(20) constraint pk_lokasi primary key,
letak varchar(20)
);


create table kategori (
id_kategori char(20) constraint pk_kategori primary key,
id_lokasi char(20),
jenis_kategori varchar(20),
constraint fk_lokasi foreign key(id_lokasi) references lokasi ON DELETE CASCADE 
);

create table inventaris_perpus (
id_inventaris char(20) constraint pk_inventaris primary key,
nama_inventaris varchar(30),
kondisi_inventaris varchar(20),
tgl_beli_inventaris date,
id_petugas char(20),
constraint fk_inventaris_perpus FOREIGN KEY(id_petugas) references petugas ON DELETE CASCADE
);

create table buku (
kode_buku char(20) constraint pk_buku primary key,
tgl_pembelian_buku date,
harga_beli number(12),
pengarang_buku varchar(20),
judul_buku varchar(20),
penerbit_buku varchar(20),
tahun_buku number(4),
id_supplier char(20),
id_kategori char(20),
constraint fk_supplier foreign key(id_supplier) references supplier ON DELETE CASCADE,
constraint fk_kategori foreign key(id_kategori) references kategori ON DELETE CASCADE 
);

create table dipinjam (
id_pinjam char(20) constraint pk_dipinjam primary key,
kode_buku char(20),
nim varchar(10),
tgl_pinjam date,
tgl_kembali date,
constraint fk_buku foreign key(kode_buku) references buku ON DELETE CASCADE,
constraint fk_mahasiswa foreign key(nim) references mahasiswa ON DELETE CASCADE
);

create table rekap (
id_rekap char(20) constraint pk_rekap primary key,
id_petugas char(20),
tgl_rekap date,
constraint fk_petugas foreign key(id_petugas) references petugas ON DELETE CASCADE
);

JURNAL 2

 a. alter table mahasiswa add angkatan varchar2(20);
 b. alter table mahasiswa modify nama_mahasiswa varchar2(40);
 c. alter table buku drop column tahun_buku;

 JURNAL 3
 
 create synonym brg for buku;
 
JURNAL 4
 
 RENAME petugas to pegawai;




