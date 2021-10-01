CREATE TABLE kelas (
	KD_KELAS VARCHAR2(10),
	NAMA_KELAS VARCHAR2(10),
	CONSTRAINT pk_kelas PRIMARY KEY(KD_KELAS)
);
CREATE TABLE siswa (
	NIS VARCHAR2(10),
	NAMA_SISWA VARCHAR2(30),
	TEMPAT_LAHIR_SISWA VARCHAR2(20),
	TANGGAL_LAHIR_SISWA DATE,
	JK_SISWA CHAR(1),
	AGAMA_SISWA VARCHAR2(10),
	ANAK_KE NUMBER, 
	ALAMAT_SISWA VARCHAR2(60),
	TELP_SISWA VARCHAR(13),
	SEKOLAH_ASAL VARCHAR(30),
	NAMA_AYAH VARCHAR(30),
	NAMA_IBU VARCHAR(30),
	PEKERJAAN_AYAH VARCHAR2(20),
	PEKERJAAN_IBU VARCHAR2(20),
	ALAMAT_ORTU VARCHAR2(60),
	NAMA_WALI VARCHAR(30),
	PEKERJAAN_WALI VARCHAR2(20),
	ALAMAT_WALI VARCHAR2(60),
	SAKIT NUMBER,
	IZIN NUMBER,
	ALFA NUMBER,
	JURUSAN VARCHAR2(30),
	KD_KELAS VARCHAR2(10),
	CONSTRAINT pk_siswa PRIMARY KEY(NIS),
	CONSTRAINT fk_siswa FOREIGN KEY(KD_KELAS) REFERENCES kelas ON DELETE CASCADE
);

INSERT INTO kelas VALUES('KIPA01','XII-IPA-1');
INSERT INTO kelas VALUES('KIPA02','XII-IPA-2');
INSERT INTO kelas VALUES('KIPA03','XII-IPA-3');
INSERT INTO kelas VALUES('KIPA04','XII-IPA-4');
INSERT INTO kelas VALUES('KIPA05','XII-IPA-5');
INSERT INTO kelas VALUES('KIPS01','XII-IPS-1');
INSERT INTO kelas VALUES('KIPS02','XII-IPS-2');
INSERT INTO kelas VALUES('KIPS03','XII-IPS-3');
INSERT INTO kelas VALUES('KIPS04','XII-IPS-4');
INSERT INTO kelas VALUES('KIPS05','XII-IPS-5');

INSERT INTO siswa VALUES('10001','Otang Kuroky','Bandung','27-NOV-1996','L','Islam',1,'Banjaran','082218392248','SMPN 1 Banjaran','Asep','Lia','PNS','Guru','Banjaran','','','',5,3,4,'IPA','KIPA01');
INSERT INTO siswa VALUES('10002','Egy Saputra.','Bandung','15-JUN-1997','L','Islam',1,'Kopo','082643254678','SMPN 1 Katapang','Endang','Eka','Wiraswasta','IRT','Kopo','','','',3,3,3,'IPA','KIPA02');
INSERT INTO siswa VALUES('10003','Dasep Nuryana','Bandung','04-JAN-1997','L','Islam',1,'Cileunyi','082221454698','SMPN 1 Cileunyi','Didin','Imas','Pegawai','IRT','Cileunyi','','','',0,0,0,'IPA','KIPA03');

INSERT INTO siswa VALUES('10004','Dadang Masdar','Bandung','01-DEC-1997','L','Islam',1,'Banjaran','082696375316','SMPN 1 Banjaran','Mimin','Ika','PNS','IRT','Banjaran','','','',0,0,0,'IPA','KIPA04');
INSERT INTO siswa VALUES('10005','Ongki Ariya','Bandung','17-FEB-1997','L','Islam',1,'Soreang','082674965678','SMPN 1 Soreang','Saad','Eti','Wiraswasta','IRT','Soreang','','','',0,0,0,'IPA','KIPA05');
INSERT INTO siswa VALUES('10006','Arie Wijayanto','Bandung','11-JUL-1997','L','Islam',1,'Ciherang','082643361478','SMPN 1 Banjaran','Supri','Maisaroh','Pegawai','IRT','Ciherang','','','',0,0,0,'IPS','KIPS01');
INSERT INTO siswa VALUES('10007','Ardhiyan Putra','Bandung','16-AUG-1997','L','Islam',1,'Kamasan','082614754678','SMPN 1 Banjaran','Junaedi','Aminah','Wiraswasta','IRT','Kamasan','','','',0,0,0,'IPS','KIPS02');
INSERT INTO siswa VALUES('10008','Tommy Suhardi','Bandung','22-NOV-1997','L','Islam',1,'Pangalengan','082222254678','SMPN 1 Pangalengan','Jajang','Sukaeti','Pegawai','IRT','Pangalengan','','','',0,0,0,'IPS','KIPS03');
INSERT INTO siswa VALUES('10009','Suseno Wibowo Hardianto','Bandung','27-JUL-1997','L','Baleendah',1,'Banjaran','082946217671','SMPN 1 Banjaran','Yayat','Icih','PNS','IRT','Baleendah','','','',0,0,0,'IPS','KIPS04');
INSERT INTO siswa VALUES('10010','Galang Nurfatwa Maulana','Bandung','21-MAY-1997','L','Katapang',1,'Banjaran','082642224622','SMPN 1 Katapang','Aceng ','Rominah','Pegawai','IRT','Katapang','','','',0,0,0,'IPS','KIPS05');
