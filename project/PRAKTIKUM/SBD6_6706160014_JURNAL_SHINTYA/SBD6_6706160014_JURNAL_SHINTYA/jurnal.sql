--nomer1--
declare
lulus exception;
kuis number := '&kuis';
tugas number := '&tugas';
assestment1 number := '&assestment1';
assestment2 number := '&assestment2';
nilai number;
begin
nilai := ((kuis * 0.2) + (tugas * 0.15) + (assestment1 * 0.3) + (assestment2 * 0.35));
dbms_output.put_line('Nilai Anda : ' || nilai);
if (nilai >= 80) then raise lulus;
elsif (nilai >= 70 and nilai <80) then
dbms_output.put_line('INDEX B'); 
dbms_output.put_line('Anda Lulus');
elsif (nilai >= 60 and nilai <70) then
dbms_output.put_line('INDEX C'); 
dbms_output.put_line('Anda Lulus');
elsif (nilai >= 50 and nilai <60) then
dbms_output.put_line('INDEX D'); 
dbms_output.put_line('Anda Lulus');
else
dbms_output.put_line('INDEX E'); 
dbms_output.put_line('Anda Tidak Lulus');
end if;
exception
when lulus then
dbms_output.put_line('INDEX A');
dbms_output.put_line('Anda Lulus');
end;
/

--nomer2--
declare
n number := '&n';
i number := '1';
j number := '1';
begin
for i in 1..(n+1)
loop
dbms_output.put('=');
end loop;
dbms_output.new_line();
for i in reverse 1..(n)
loop
for j in reverse 1..(i)
loop
dbms_output.put('*');
end loop;
dbms_output.new_line();
end loop;
for i in 1..(n+1)
loop
dbms_output.put('=');
end loop;
dbms_output.new_line();
end;
/


--nomer3--
declare
n number := '&n';
i number := '2';
j number := '2';
begin
dbms_output.put_line('Bilangan Genap 1 sampai ' || n || ' adalah : ');
for i in 1..n
loop
if (mod(i,j) like 0) then
dbms_output.put_line(i);
end if;
end loop;
end;
/

--nomer4--
declare
nomor siswa.NIS%TYPE := '&nis';
nama siswa.NAMA_SISWA%TYPE;
lahir siswa.TEMPAT_LAHIR_SISWA%TYPE;
tempat siswa.TANGGAL_LAHIR_SISWA%TYPE;
begin
select NAMA_SISWA, TEMPAT_LAHIR_SISWA, TANGGAL_LAHIR_SISWA into nama, lahir, tempat from siswa where nis='nomor';
dbms_output.put_line('==============================');
dbms_output.put_line('Nama	: ' || nama);
dbms_output.put_line('Kelas	: ');
dbms_output.put_line('TTL	: ' || tempat || lahir);
dbms_output.put_line('==============================');
end;
/


