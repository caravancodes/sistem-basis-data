// nomer 2 --a-- (done) || Contoh 1
set serveroutput on;
begin
dbms_output.put_line('HELLO DZAKY');
end;
/


// nomer 2 --b-- (done) || Contoh 4
declare
v_jml_beri NUMBER NOT NULL := 12;
v_nama_depan varchar(15) := 'Dzaky';
v_nim char(10) := '6706160131';
today date := sysdate;
phi constant number := 3.14286;
begin
dbms_output.put_line(to_char(v_jml_beri));
dbms_output.put_line(to_char(v_nama_depan));
dbms_output.put_line(v_nim);
dbms_output.put_line(to_char(today));
dbms_output.put_line(to_char(phi));
end;
/

// nomer 2 --c-- (done) || Contoh 10
declare
TYPE nomor IS
TABLE OF NUMBER
INDEX BY BINARY_INTEGER;
A nomor;
begin 
A(1) := 10;
A(2) := 20;
A(3) := 30;
dbms_output.put_line('Nilai elemen ke-1' || ' = ' ||to_char(A(1)));
dbms_output.put_line('Nilai elemen ke-2' || ' = ' ||to_char(A(2)));
dbms_output.put_line('Nilai elemen ke-3' || ' = ' ||to_char(A(3)));
end;
/

// nomer 2 --d-- (done) || Contoh 11
declare
equal Exception;
v_nilai1 number := '&inputan_1';
v_nilai2 number := '&inputan_2';
begin
if v_nilai1 = v_nilai2 then
raise equal;
elsif v_nilai1 < v_nilai2 then
dbms_output.put_line(v_nilai1 || ' lebih kecil dari ' || v_nilai2);
else
dbms_output.put_line(v_nilai1 || ' lebih besar dari ' || v_nilai2);
end if;
Exception
when equal then
dbms_output.put_line('nilainya sama');
end;
/

//nomer 2 --e-- (done) || Contoh 12
declare
v_counter number := 1;
begin
loop
dbms_output.put_line(v_counter);
v_counter := v_counter + 1;
if v_counter > 10 then 
exit;
end if;
end loop;
end;
/

//nomer 2 --f-- (done) || Contoh 14
declare
TYPE tabel is table of varchar2(10) INDEX BY BINARY_INTEGER;
Data tabel;
vNoUrut number := 1;
begin
while vNoUrut <= 10 loop
Data(vNoUrut) := 'data ke-' || to_char(vNoUrut);
dbms_output.put_line(Data(vNoUrut));
vNoUrut := vNoUrut + 1;
end loop;
end;
/

//nomer 2 --g-- (done) || Contoh 15
declare
TYPE tabel is table of varchar2(10) INDEX BY BINARY_INTEGER;
Data tabel;
vNoUrut number;
begin
for vNoUrut in 1..10
loop
Data(vNoUrut) := 'data ke-' || to_char(vNoUrut);
dbms_output.put_line(Data(vNoUrut));
end loop;
end;
/

//nomer 2 --h-- (done) || Contoh 16
begin
goto second_output;
dbms_output.put_line('This line will never execute.');
<<second_output>>
dbms_output.put_line('We Are Here!');
end;
/

//nomer 2 --i-- (done) || Contoh 21
create table pemesanan (
    id_pemesan varchar2(10) constraint pk_pemesan primary key,
    nama varchar2(20)
);

declare
Ada_kosong exception;
pragma exception_INIT(Ada_kosong, -01400);
begin
insert into pemesanan(id_pemesan,nama) values('MRT-024','Dzaky');
exception
when Ada_kosong then
dbms_output.put_line('kolom NOT NULL tidak boleh kosong');
end;
/


//nomer 3 
DECLARE
kata1 varchar2(20) := '&kalimat_1';
kata2 varchar2(20) := '&kalimat_2';
kata3 varchar2(20) := '&kalimat_3';
jargon varchar2(100):= 'Take it out from the box, Think out of the box';
i number := 1;
Begin
for i in 1..5
loop
dbms_output.put_line(to_char(kata1) || ' ' || to_char(kata2) || ' ' || to_char(kata3));
dbms_output.put_line(to_char(jargon));
end loop;
end;
/