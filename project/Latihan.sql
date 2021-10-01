create table buku (
bid varchar2(10) constraint pk_buku primary key,
judul varchar2(30),
kategori varchar2(20) );

insert into buku values('D001','PLSQL FUNDAMENTAL','Database');
insert into buku values('D002','SQL DASADR','Database');
insert into buku values('D003','PHP PROGRAMMING','Programming');

DECLARE
vid buku.bid%TYPE := '&ID_buku';
vjudul buku.judul%TYPE;
cursor c_buku (vid buku.bid%TYPE) IS 
select judul from buku
where bid = vid;
begin 
OPEN c_buku(vid);
dbms_output.put('JUDUL BUKU DENGAN KODE ' || vid || ' ADALAH ');
loop
fetch c_buku into vjudul;
exit when c_buku%NOTFOUND;
dbms_output.put_line(vjudul);
end loop;
close c_buku;
end;
/


DECLARE
banding number := '&banding';
vbuku buku%rowtype;
cursor c_buku IS
select * from buku;
begin
open c_buku(banding);
loop
fetch c_buku into vbuku;
exit when c_buku%NOTFOUND;
if (select count(vbuku.kategori) from buku where = banding) then
dbms_output.put_line(vbuku.BID || ' - ' || vbuku.judul);
end loop;
close c_buku;
end;
/