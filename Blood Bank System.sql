create database bloodbank4;
use bloodbank4;
show databases
create table patient(
p_id numeric primary key,
p_name varchar(20) not null,
p_age numeric not null,
p_address varchar(20) not null,
p_gender varchar(10) not null,
p_phone numeric(10) not null,
p_blood_type varchar(3) not null,
p_reason varchar(10) not null,
p_qty float not null,
p_date date not null);

create table donor(
d_id numeric primary key,
d_name varchar(20) not null,
d_blood_type varchar(10) not null,
d_age numeric not null,
d_gender varchar(10) not null,
d_address varchar(20) not null,
d_phone numeric(10) not null,
d_qty varchar(5) not null,
d_date date not null);

create table blood(
b_id numeric primary key,
b_type varchar(3) not null,
b_qty  varchar(5) not null,
b_cost numeric not null);

create table ngo(
n_id numeric primary key,
n_name varchar(30) not null,
n_location varchar(10) not null,
d_id numeric not null,
p_id numeric not null,
constraint fk_p_id foreign key(p_id) references patient(p_id),
constraint fk_d_id foreign key(d_id) references donor(d_id));
alter table ngo add n_phone numeric(10);


create table hospital(
h_id numeric primary key,
h_name varchar(30) not null,
h_location varchar(20) not null,
d_id numeric not null,
p_id numeric not null,
n_id numeric not null,
b_id numeric not null,
b_qty float not null,
constraint fk_h_pid foreign key(p_id) references patient(p_id),
constraint fk_h_did foreign key(d_id) references donor(d_id),
constraint fk_n_id foreign key(n_id) references ngo(n_id),
constraint fk_b_id foreign key(b_id) references blood(b_id));

create table doctor(
doc_id numeric primary key,
doc_name varchar(20) not null,
doc_joining_date date not null,
doc_phone numeric(10) not null,
doc_address varchar(20) not null,
h_id numeric not null,
constraint fk_doc_hid foreign key(h_id) references hospital(h_id));


create table payment(
pay_id numeric primary key,
pay_date date not null,
pay_qty float not null,
pay_amount numeric not null,
p_id numeric not null,
b_id numeric not null,
constraint fk_pay_pid foreign key(p_id) references patient(p_id),
constraint fk_pay_bid foreign key(b_id) references blood(b_id));



INSERT INTO patient VALUES (1,'Vedant',20,'Mumbai','Male',123456,'O+','Accident',2,'2022-05-28');
INSERT INTO patient VALUES (2,'Harsh',18,'Mumbai','Male',234422,'A+','Anemia',1.5,'2022-02-20');
INSERT INTO patient VALUES (3,'Kushagra',23,'Kota','Male',504321,'B+','Accident',1.2,'2022-03-11');
INSERT INTO patient VALUES (4,'Rishi',22,'Bangalore','Male',988655,'O+','Hemophilia',3,'2022-05-30');
INSERT INTO patient VALUES (5,'Krish',14,'Mumbai','Male',234432,'AB+','Cancer',2,'2022-06-30');
INSERT INTO patient VALUES (6,'Samiksha',35,'Chennai','Female',987456,'B-','Accident',2.4,'2022-12-30');
INSERT INTO patient VALUES (7,'Gayathri',32,'Kota','Female',345621,'O-','Accident',2.2,'2022-04-10');
INSERT INTO patient VALUES (8,'Rushil',22,'Mumbai','Male',927382,'AB+','Surgery',3,'2023-01-29');
INSERT INTO patient VALUES (9,'Akhil',21,'Karnataka','Male',812543,'O+','Ulcer',2.3,'2022-03-07');
INSERT INTO patient VALUES (10,'Mahvish',36,'Punjab','Female',820098,'B-','Surgery',1,'2023-01-17');



INSERT INTO donor VALUES (1,'Vaibhav','AB+',25,'Male','Mumbai',765322,0.5,'2022-04-9-');
INSERT INTO donor VALUES (2,'Mahvish','B+',19,'Female','Mumbai',231231,2.2,'2022-12-12');
INSERT INTO donor VALUES (3,'Rushil','A+',19,'Male','Kota',954621,1.2,'2022-01-05');
INSERT INTO donor VALUES (4,'Vedanti','AB-',21,'Female','Baroda',431652,2.5,'2021-11-10');
INSERT INTO donor VALUES (5,'Sid','B-',19,'Male','Bangalore',564732,2,'2022-08-03');
INSERT INTO donor VALUES (6,'Arya','O+',23,'Male','Delhi',435275,0.5,'2021-04-30');
INSERT INTO donor VALUES (7,'Laksh','O-',19,'Male','Mumbai',657389,1.5,'2023-02-01');
INSERT INTO donor VALUES (8,'Aditi','O+',20,'Female','Mumbai',926381,1.3,'2022-01-12');
INSERT INTO donor VALUES (9,'Sumit','AB+',19,'Male','Mumbai',250394,1,'2023-01-21');
INSERT INTO donor VALUES (10,'Pranav','B+',20,'Male','Mumbai',905683,1.4,'2022-09-26');


INSERT INTO blood VALUES (1,'AB+','1-3 ',2530);
INSERT INTO blood VALUES (2,'AB-','1-3 ',1200);
INSERT INTO blood VALUES (3,'A+','1-5 ',1231);
INSERT INTO blood VALUES (4,'A-','1-2 ',2500);
INSERT INTO blood VALUES (5,'B+','1-4 ',3030);
INSERT INTO blood VALUES (6,'B-','1-2.5 ',1230);
INSERT INTO blood VALUES (7,'O+','1-4 ',5230);
INSERT INTO blood VALUES (8,'O-','1-1.5 ',2503);

INSERT INTO hospital VALUES (001, 'City Hospital', 'Dadar', 1, 1, 123,1,16.3);
INSERT INTO hospital VALUES (002, 'Lifeline Hospital', 'Goregaon', 2, 2, 223,2,12.5);
INSERT INTO hospital VALUES (003, 'Cooper Hospital', 'Vile Parle', 3, 3, 231,3,23);
INSERT INTO hospital VALUES (004, 'Fortis', 'Matunga', 4, 4, 132,4,15.5);
INSERT INTO hospital VALUES (005, 'Sajeevani Hospital', 'Malad', 5, 5, 245,5,12.6);
INSERT INTO hospital VALUES (006, 'Kokilaben Hospital', 'Andheri', 6, 6, 543,6,26);
INSERT INTO hospital VALUES (007, 'Hinduja Hopsital', 'Mahim', 7, 7, 632,7,18.5);
INSERT INTO hospital VALUES (008, 'Balaji Hopsital', 'Malad', 2, 4, 231,3,25);
INSERT INTO hospital VALUES (009, 'Bhakti Vedanta', 'Mira Road', 6, 7, 632,5,22);
INSERT INTO hospital VALUES (010, 'Nanavati Hospital', 'Vile Parle', 5, 2, 123,4,31);
INSERT INTO hospital VALUES (011, 'Leelavati Hospital', 'Bandra', 1, 6, 132,6,28);
INSERT INTO hospital VALUES (012, 'Pragati Hospital', 'Dahisar', 3, 5, 223,2,19.3);


INSERT INTO ngo VALUES (123,'Smile Foundation', 'Goreagon', 1, 7,9345214837);
INSERT INTO ngo VALUES (223,'Goonj Foundation', 'Mira Road', 2, 6,8273874612);
INSERT INTO ngo VALUES (231,'Helpage Foundation', 'Bandra', 3, 5,8537263726);
INSERT INTO ngo VALUES (132,'Samman Foundation', 'Churchgate', 4, 4,9087436827);
INSERT INTO ngo VALUES (245,'Sightsavers Foundation', 'Grant Road', 5, 3,9963426889);
INSERT INTO ngo VALUES (543,'Pratham Foundation', 'Powai', 6, 2,9572947631);
INSERT INTO ngo VALUES (632,'Give India Foundation', 'Dadar', 7, 1,8063478237);
INSERT INTO ngo VALUES (325,'Help India Foundation', 'Wadala', 8, 7,7892138490);
INSERT INTO ngo VALUES (521,'Swastikam Foundation', 'Mira Road', 9, 8,9372904819);
INSERT INTO ngo VALUES (730,'Mitra Foundation', 'Goregaon', 10, 9,9738201938);
INSERT INTO ngo VALUES (830,'Seva Sansthan', 'Andheri', 8, 10,9736208873);

INSERT INTO doctor VALUES (782,'Dr.Abhinav','2000-01-30',9480010936,'dadar',001);
INSERT INTO doctor VALUES (665,'Dr.Madhukar','2000-05-07',9125467203,'Malad',002);
INSERT INTO doctor VALUES (536,'Dr.Sunita','2001-02-16',9874567394,'Andheri',003);
INSERT INTO doctor VALUES (244,'Dr.Mohit','2003-05-19',9967335117,'Goregaon',004);
INSERT INTO doctor VALUES (811,'Dr.Anand','2002-10-23',9806749360,'Mahim',005);
INSERT INTO doctor VALUES (302,'Dr.Yogesh','2005-12-13',9235470097,'Borivali',006);
INSERT INTO doctor VALUES (582,'Dr.Patkar','2004-07-18',9112659263,'Bandra',007);
INSERT INTO doctor VALUES (147,'Dr.Sujata','2003-03-22',8819141242,'Goregaon',003);
INSERT INTO doctor VALUES (821,'Dr.Vedant','2003-05-11',8263749844,'Mira Road',001);
INSERT INTO doctor VALUES (634,'Dr.Dheeraj','2001-07-23',9283290479,'Grant Road',009);
INSERT INTO doctor VALUES (712,'Dr.Divya','2000-03-03',8090236198,'Dadar',010);
INSERT INTO doctor VALUES (273,'Dr.Anagha','2002-12-15',7394718330,'Bandra',011);
INSERT INTO doctor VALUES (368,'Dr.Neel','2001-05-19',8152329371,'Marine Lines',012);

INSERT INTO payment VALUES (2431, '2022-05-30', 0.7, 2530, 1, 7);
INSERT INTO payment VALUES (2532, '2022-02-25', 1.2, 1200, 2, 6);
INSERT INTO payment VALUES (6234, '2022-06-08', 4.2, 1231, 3, 5);
INSERT INTO payment VALUES (2736, '2022-03-16', 3.1, 3030, 4, 4);
INSERT INTO payment VALUES (8726, '2022-04-12', 2.3, 1230, 5, 3);
INSERT INTO payment VALUES (7510, '2022-06-30', 2.0, 2500, 6, 2);
INSERT INTO payment VALUES (8334, '2022-12-31', 1.0, 2503, 7, 1);
show tables;



select * from hospital;
select * from blood;
select * from donor;
select * from patient;
select * from ngo;
select * from doctor;
select * from payment;

#basic
select h_name, b_type
from hospital, blood
where hospital.b_id = blood.b_id;

#basic
select h_name, b_type
from hospital, blood
where hospital.b_id = blood.b_id and blood.b_type= 'B+';

#basic
select doc_name, h_name
from doctor, hospital
where hospital.h_id = doctor.h_id and doc_name='Dr.Mohit';

#total blood donated according to blood type (window function)
select distinct(d_blood_type),
sum(d_qty) over(partition by d_blood_type) as total_wrt_b_type
from donor

# donors who have donated from ngo (nested basic)
select d_name, d_blood_type
from donor 
where d_id in ( select d_id  from ngo)

# available and needed blood 
select h_name, d_blood_type, b_qty as available, d_qty as needed
from hospital natural join donor 
where hospital.d_id = donor.d_id

# top 3 doctors who have been working the longest
select doc_name, h_name, doc_joining_date
from doctor, hospital
where doctor.h_id = hospital.h_id
order by doc_joining_date
limit 3

# people not cleared payment (nested)
select p_name, p_blood_type, p_qty, p_id
from patient
where p_id not in ( select p_id from payment)

#people needing blood due to accident (basic)
select p_name, h_name, p_qty, p_blood_type
from patient, hospital
where patient.p_id = hospital.h_id and p_reason= 'Accident'

#donors who have donated through ngo but not through hospital
(select d_id  from ngo)
except
(select d_id from hospital)

