create table pasien (
	ID_PASIEN varchar2(10),
	NAMA_PASIEN varchar2(50),
	TGL_LAHIR date,
	ALAMAT varchar2(20),
	CONSTRAINT pk_Pasien PRIMARY KEY (ID_PASIEN)
);

create table dokter (
	ID_DOKTER varchar2(10),
	NAMA_DOKTER varchar2(50),
	SPESIALISASI varchar2(15),
	TARIF number,
	CONSTRAINT pk_Dokter PRIMARY KEY (ID_DOKTER)
);

create table ruangan (
	ID_RUANG varchar2(10),
	NAMA_RUANG varchar2(50),
	BIAYA number,
	CONSTRAINT pk_Ruangan PRIMARY KEY (ID_RUANG)
);

create table ranap (
	TGL_MASUK date,
	TGL_KELUAR date,
	ID_PASIEN varchar2(10),
	ID_DOKTER varchar2(10),
	ID_RUANG varchar2(10),
	CONSTRAINT fk1_Pasien FOREIGN KEY (ID_PASIEN) REFERENCES PASIEN (ID_PASIEN) ON DELETE CASCADE ENABLE,
	CONSTRAINT fk2_Dokter FOREIGN KEY (ID_DOKTER) REFERENCES DOKTER (ID_DOKTER) ON DELETE CASCADE ENABLE,
	CONSTRAINT fk3_Ruangan FOREIGN KEY (ID_RUANG) REFERENCES RUANGAN (ID_RUANG) ON DELETE CASCADE ENABLE
);

insert into pasien values ('P01','SARAH CANDRA','16-06-1994','BANDUNG');
insert into pasien values ('P02','EKKY KARMILA','27-01-1995','BEKASI');
insert into pasien values ('P03','FRISKA MELINDA','04-05-1994','JAKARTA');
insert into pasien values ('P04','SYFA URWATUL','19-09-1994','BIMA');
insert into pasien values ('P05','FAUZIYAH','13-05-1994','ACEH');
insert into pasien values ('P06','NURUL HIDAYATI','10-05-1994','BOGOR');
insert into pasien values ('P07','NITA LESTARI','04-03-1994','KUNINGAN');
insert into pasien values ('P08','DIAH PUTRI','06-04-1994','YOGYAKARTA');
insert into pasien values ('P09','KARTIKA SETIA','27-08-1994','SOLO');
insert into pasien values ('P10','SUCIANTI','12-11-1994','SUKABUMI');


insert into dokter values ('D01','BAGUS IBRAHIM','UMUM',50000);
insert into dokter values ('D02','NAUFAL FIRDAUS','KULIT',100000);
insert into dokter values ('D03','LUTHFI ADI','JANTUNG',250000);
insert into dokter values ('D04','HASBBI HARBI','KANDUNGAN',200000);
insert into dokter values ('D05','PRIYANDANU','SARAF',300000);


insert into ruangan values ('KM01','GEMINI',150000);
insert into ruangan values ('KM02','TAURUS',125000);
insert into ruangan values ('KM03','ARIES',115000);
insert into ruangan values ('KM04','LEO',130000);
insert into ruangan values ('KM05','SAGITARIUS',180000);


insert into ranap values ('12-01-2015','24-01-2015','P01','D01','KM03');
insert into ranap values ('02-02-2015','10-02-2015','P02','D05','KM04');
insert into ranap values ('23-03-2015','30-03-2015','P03','D02','KM01');
insert into ranap values ('14-04-2015','21-04-2015','P04','D03','KM05');
insert into ranap values ('07-05-2015','17-05-2015','P05','D04','KM02');
insert into ranap values ('08-06-2015','24-06-2015','P06','D01','KM03');
insert into ranap values ('11-06-2015','22-06-2015','P07','D02','KM01');
insert into ranap values ('20-10-2015','28-10-2015','P08','D03','KM05');
insert into ranap values ('29-07-2015','06-08-2015','P09','D04','KM02');
insert into ranap values ('25-08-2015','13-09-2015','P10','D02','KM01');