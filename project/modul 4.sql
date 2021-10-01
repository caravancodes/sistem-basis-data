create user modul4 identified by modul4;
grant connect, resource to modul4;
grant all privilege to modul4;
conn modul4/modul4;

create table tp4_12 (
baca_modul varchar2(80) );
insert into tp4_12 values ('aku sayang kamu tapi aku lebih sayang sistem basis data');
select translate ('aku sayang kamu tapi aku lebih sayang sistem data','atbis','4+6i5') baca_modul from tp4_12;


/* nomer 13 */
create table student (
nim varchar2(12) constraint pk_student primary key,
nama varchar2(20),
fakultas varchar2(30),
angkatan varchar2(2),
umur number );

create table faculty (
fid varchar2(12) constraint pk_faculty primary key,
namaf varchar2(20),
deptid number );

create table kelas (
namakls varchar2(35) constraint pk_kelas primary key,
meetat varchar2(20),
ruangan varchar2(10),
fid varchar2(12),
constraint fk_faculty foreign key(fid) references faculty on delete cascade );

create table enrolled (
nim varchar2(25),
namakls varchar2(35),
constraint fk_student foreign key(nim) references student on delete cascade,
constraint fk_kelas foreign key(namakls) references kelas on delete cascade );

/* nomer 14 */

select nim, fakultas, umur, 
CASE angkatan
when 'FR' then 'Freshman'
when 'SO' then 'Sophomore'
when 'JR' then 'Junior'
when 'SR' then 'Senior'
else 'zonk'
end
from student;

/* nomer 15 */
select nama, namakls
from student
cross join kelas
where namakls = 'Operating System Design'
order by nama asc;