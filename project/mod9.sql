CREATE TABLE cabang_pertandingan (
    kode_cabang varchar2(6) CONSTRAINTS pk_cabang PRIMARY KEY,
    nama_cabang varchar2(13),
    durasi_pertandingan number,
    jml_team number
);

CREATE TABLE team (
    kode_team varchar2(8) CONSTRAINTS pk_team PRIMARY KEY,
    nama_team varchar2(12),
    jml_anggota number,
    kode_cabang varchar2(6),
    CONSTRAINT fk_team FOREIGN KEY (kode_cabang) REFERENCES cabang_pertandingan (kode_cabang) ON DELETE CASCADE
);

INSERT INTO cabang_pertandingan VALUES('cab001',	'Basket_3on3',	30,	0);
INSERT INTO cabang_pertandingan VALUES('cab002',	'Volly',	45,	0);
INSERT INTO cabang_pertandingan VALUES('cab003',	'Futsal',	45,	0);

/*Nambahin Jumlah Team Di tabel cabang setelah insert di tabel team*/
CREATE OR REPLACE TRIGGER tambah_team
AFTER INSERT ON team
FOR EACH ROW
DECLARE
temp_jml number;
BEGIN
select jml_team INTO temp_jml
FROM cabang_pertandingan WHERE kode_cabang = :new.kode_cabang;
IF INSERTING THEN
temp_jml := temp_jml + 1;
UPDATE cabang_pertandingan SET jml_team = temp_jml WHERE kode_cabang = :new.kode_cabang;
END IF;
END;
/

INSERT INTO team VALUES('team001','IF30-02_1',0,'cab001');
INSERT INTO team VALUES('team002','TI30-02_2',0,'cab003');
INSERT INTO team VALUES('team003','IF30-01_1',0,'cab001');
INSERT INTO team VALUES('team004','IF30-03_1',0,'cab002');
INSERT INTO team VALUES('team005','TE30-01_1',0,'cab002');
INSERT INTO team VALUES('team006','IF30-01_2',0,'cab003');

/*Ngurangin Jumlah Team Di tabel cabang setelah insert di tabel team*/
CREATE OR REPLACE TRIGGER kurangi_team
AFTER DELETE ON team
FOR EACH ROW
DECLARE
temp_jml number;
BEGIN
select jml_team INTO temp_jml
FROM cabang_pertandingan WHERE kode_cabang = :old.kode_cabang;
IF DELETING THEN
temp_jml := temp_jml - 1;
UPDATE cabang_pertandingan SET jml_team = temp_jml WHERE kode_cabang = :old.kode_cabang;
END IF;
END;
/

DELETE FROM team WHERE kode_team='team006';

CREATE TABLE peserta (
    nim varchar2(12) CONSTRAINTS pk_peserta PRIMARY KEY,
    nama varchar2(30),
    jns_kelamin varchar2(11),
    tgl_lahir date,
    alamat varchar2(32),
    jurusan varchar2(10),
    angkatan varchar2(5),
    email varchar2(50),
    kode_team varchar2(8),
    CONSTRAINT fk_peserta FOREIGN KEY (kode_team) REFERENCES team (kode_team) ON DELETE CASCADE
);

/*Mengecek data yang akan dindert sudah sesuai kondisi yang diinginkan apa tidak.
Pengecekan dilakukan sebelum proses insert dilakukan.*/
CREATE OR REPLACE TRIGGER cek_peserta
BEFORE INSERT ON peserta
FOR EACH ROW
DECLARE
nm_cabang cabang_pertandingan.nama_cabang%type;
BEGIN
SELECT nama_cabang into nm_cabang
FROM cabang_pertandingan cb, team t
WHERE cb.kode_cabang = t.kode_cabang and t.kode_team = :new.kode_team;
IF (nm_cabang = 'Futsal' AND (:new.jns_kelamin = 'P' or :new.jns_kelamin = 'p')) THEN
raise_application_error(-20103,'Maaf, untuk futsal belum tersedia untuk pemain perempuan');
END IF;
END;
/

INSERT INTO peserta VALUES ('113060212','Arum','P','21-JAN-1989','Jl.Setiabudi A09 Bandung','IF','2006','arum@gmail.com','team002');

/*Contoh pengecekan sebelum insert lainnya*/
CREATE OR REPLACE TRIGGER cek_kuota
BEFORE INSERT ON peserta
FOR EACH ROW
DECLARE
nm_cabang cabang_pertandingan.nama_cabang%type;
temp_jml team.jml_anggota%type;
BEGIN
SELECT nama_cabang, t.jml_anggota into nm_cabang, temp_jml
FROM cabang_pertandingan cb, team t
WHERE cb.kode_cabang = t.kode_cabang and t.kode_team = :new.kode_team;
IF nm_cabang = 'Basket_3on3' AND temp_jml = 6 THEN
RAISE_APPLICATION_ERROR(-20103,'Maaf, jumlah pemain team basket ini sudah penuh');
END IF;
END;
/

/*Nambahin Jumlah Anggota Di tabel team setelah insert di tabel peserta*/
CREATE OR REPLACE TRIGGER tambah_anggota
AFTER INSERT ON peserta
FOR EACH ROW
DECLARE
temp_jml number;
BEGIN
select jml_anggota INTO temp_jml
FROM team WHERE kode_team = :new.kode_team;
IF INSERTING THEN
temp_jml := temp_jml + 1;
UPDATE team SET jml_anggota = temp_jml WHERE kode_team = :new.kode_team;
END IF;
END;
/

/*Ngurangin Jumlah Team Di tabel team setelah insert di tabel peserta*/
CREATE OR REPLACE TRIGGER kurangi_anggota
AFTER DELETE ON peserta
FOR EACH ROW
DECLARE
temp_jml number;
BEGIN
select jml_anggota INTO temp_jml
FROM team WHERE kode_team = :old.kode_team;
IF DELETING THEN
temp_jml := temp_jml - 1;
UPDATE team SET jml_anggota = temp_jml WHERE kode_team = :old.kode_team;
END IF;
END;
/

INSERT INTO peserta VALUES ('6706160014','Amir','L','20-MAY-1998','Probouga','D3IF','2016','f.amir@gmail.com','team001');
INSERT INTO peserta VALUES ('6706160313','Rivkal','L','21-JUN-1998','Karawang','D3IF','2016','rivkal@gmail.com','team001');
INSERT INTO peserta VALUES ('6706164002','Seto','L','24-MAR-1998','Klaten','D3IF','2016','priority@gmail.com','team001');
INSERT INTO peserta VALUES ('6706169863','Bryan','L','01-DEC-1998','Karawang','D3IF','2016','mintafilm@gmail.com','team001');

SELECT * FROM team;

SELECT * FROM cabang_pertandingan;

INSERT INTO peserta VALUES ('6706160131','Dzaky','L','27-FEB-1998','Melong Asih','D3IF','2016','broridzaky@gmail.com','team001');

SELECT * FROM team;

INSERT INTO peserta VALUES ('6706160003','Fris','L','12-APR-1998','Makassar','D3IF','2016','frisnadi@gmail.com','team001');

SELECT * FROM team;

INSERT INTO peserta VALUES ('6706160004','Pram','L','16-APR-1998','Makassar','D3IF','2016','pramana@gmail.com','team001');



