create table siswa (
id_siswa varchar(10) constraint pk_siswa primary key,
password varchar(20),
nama varchar(20),
kelas varchar(10),
gender varchar(20),
no_telp varchar(16),
alamat varchar(50),
ttl varchar(50),
foto varchar(200)
);

create table mata_pelajaran (
kode_mapel varchar(3) constraint pk_mata_pelajaran primary key,
nama_mapel varchar(20),
nilai_min varchar(3)
);

create table admin (
kode_admin varchar(10) constraint pk_admin primary key,
password varchar(20),
nama_admin varchar(30)
);

create table guru (
id_guru varchar(10) constraint pk_guru primary key,
password varchar(20),
nama_guru varchar(20),
gender varchar(20),
no_telp varchar(16),
alamat varchar(50),
foto varchar(200),
kode_mapel varchar(3),
constraint fk_guru FOREIGN KEY(kode_mapel) references mata_pelajaran ON DELETE CASCADE
);

create table soal (
kode_soal varchar(10) constraint pk_soal primary key,
id_siswa varchar(10),
id_guru varchar(10),
kode_mapel varchar(3),
soal varchar(20),
constraint fk_soal1 FOREIGN KEY(id_siswa) references siswa ON DELETE CASCADE,
constraint fk_soal2 FOREIGN KEY(id_guru) references guru ON DELETE CASCADE,
constraint fk_soal3 FOREIGN KEY(kode_mapel) references mata_pelajaran ON DELETE CASCADE
);

create table remedi (
kode_remidi varchar(30) constraint pk_remedi primary key,
semester varchar(30),
id_siswa varchar(10),
kode_soal varchar(10),
kode_mapel varchar(30),
constraint fk_remedi1 FOREIGN KEY(id_siswa) references siswa ON DELETE CASCADE,
constraint fk_remedi2 FOREIGN KEY(kode_mapel) references mata_pelajaran ON DELETE CASCADE,
constraint fk_remedi3 FOREIGN KEY(kode_soal) references soal ON DELETE CASCADE
);

create table isi_data(
id_siswa varchar(10),
id_guru varchar(10),
kode_mapel varchar(3), 
constraint fk_isi_data1 FOREIGN KEY(id_siswa) references siswa ON DELETE CASCADE,
constraint fk_isi_data2 FOREIGN KEY(kode_mapel) references mata_pelajaran ON DELETE CASCADE,
constraint fk_isi_data3 FOREIGN KEY(id_guru) references guru ON DELETE CASCADE
);

create table nilai (
nilai varchar(3),
kode_remidi varchar(30),
constraint fk_nilai FOREIGN KEY(kode_remidi) references remedi ON DELETE CASCADE
);

SELECT * from siswa where id_siswa = '$username' and password = '$password';
SELECT * from guru where id_guru = '$username' and password = '$password';
SELECT * from admin where kode_admin = '$username' and password = '$password';

SELECT * from siswa where id_siswa='$cek';
SELECT * from guru where id_guru='$cek';
SELECT * from admin where kode_admin='$cek';

INSERT INTO siswa VALUES('$usr', '$pss', '$nama', '$kelas', '$gender', '$no_telp', '$alamat', '$ttl');
INSERT INTO mata_pelajaran VALUES('$kode', '$mapel', '$nilai');
INSERT INTO guru VALUES('$usr', '$pss', '$nama', '$gender', '$alamat', '$no_telp','$mapel')";