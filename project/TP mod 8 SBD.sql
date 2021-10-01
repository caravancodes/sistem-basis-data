set serveroutput on
declare
procedure pola is
n number := &isi;
x number ;
y number ;
begin
	for x in 1..n
		loop
	for y in 1..n
	loop
		if (x<=((n+1)/2) and y>(x-1) and y<=(n-(x-1)))or
		(x>((n+1)/2) and y>(n-x) and y<=x) then
	dbms_output.put('X');
		else
	dbms_output.put('-');
	end if;
	end loop;
		dbms_output.put_line(' ');
	end loop;
		end pola;
	begin
	pola;
	end;
/

declare
procedure hitung is
angka number := '&inject';
jumlah number := 0;
begin
	for x in 1..angka
	loop
	if (mod(x,2) = 0) then
	jumlah := jumlah + x;
	end if;
	end loop;
	dbms_output.put_line('Hasil : '||jumlah);
	end hitung;
	begin
	hitung;
	end;
	/
	
declare
procedure hitung is
angka number := '&inject';
jumlah number := 0;
begin
	for x in 1..angka
	loop
	if (mod(x,2) = 1) then
	jumlah := jumlah + x;
	end if;
	end loop;
	dbms_output.put_line('Hasil : '||jumlah);
	end hitung;
	begin
	hitung;
	end;
	/