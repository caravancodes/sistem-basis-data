//nomer 8
declare
i number(2);
hasil number (4);
begin
i:=1;
while i <= 6
loop
hasil := i*2;
dbms_output.put_line(i || ' kali 2 = ' || hasil);
i := i+1;
end loop;
end;
/

//nomer 9
DECLARE
vid pasien.ID_PASIEN%TYPE := '&ID_PASIEN';
vnama pasien.NAMA_PASIEN%TYPE;
cursor c_nama (vid pasien.ID_PASIEN%TYPE) IS 
select NAMA_PASIEN from pasien
where ID_PASIEN = vid;
begin 
OPEN c_nama(vid);
dbms_output.put('NAMA PASIEN DENGAN ID PASIEN ' || vid || ' ADALAH ');
loop
fetch c_nama into vnama;
exit when c_nama%NOTFOUND;
dbms_output.put_line(vnama);
end loop;
close c_nama;
end;
/


//nomer 10
DECLARE
cursor c_dok IS select * from dokter;
vdok dokter%ROWTYPE;
begin 
OPEN c_dok;
dbms_output.put_line('DAFTAR NAMA DOKTER : ');
loop
fetch c_dok into vdok;
exit when c_dok%NOTFOUND;
dbms_output.put_line(c_dok%ROWCOUNT || '. ' || vdok.NAMA_DOKTER || ' dengan nomor id : ' || vdok.ID_DOKTER);
end loop;
close c_dok;
end;
/
