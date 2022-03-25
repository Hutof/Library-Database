CREATE TABLE MEMBER (
ID INT NOT NULL PRIMARY KEY ,
F_NAME VARCHAR(20) NOT NULL ,
M_NAME VARCHAR(20) ,
L_NAME VARCHAR(20) ,
M_TYPE VARCHAR(20) NOT NULL ,
dateofjoin date ,
dateEnd date ,
Pno int
);
CREATE TABLE MemberEmail(
ID INT NOT NULL PRIMARY KEY ,
email VARCHAR(50) ,
foreign key (ID) references MEMBER(ID) on delete cascade
);
create table libraryResource(
R_number int primary key ,
availability varchar(20) not null
);
CREATE TABLE LOAN (
L_Number INT PRIMARY KEY NOT NULL,
Library_Address VARCHAR(20) ,
DueDate date ,
L_state VARCHAR(20) NOT NULL ,
Date_loaned VARCHAR(20) ,
Rno int not null ,
M_ID int not null,
foreign key (M_ID) references MEMBER(ID) on delete cascade,
foreign key (Rno) references libraryResource(R_number) on delete cascade
);
CREATE TABLE Borrow(
L_Number INT NOT NULL ,
M_ID INT NOT NULL,
CONSTRAINT bro PRIMARY key (L_Number,M_ID) ,
foreign key (L_Number) references LOAN(L_Number) on delete cascade ,
foreign key (M_ID) references MEMBER(ID) on delete cascade
);
CREATE TABLE PRIVILEGE (
P_Number INT NOT NULL PRIMARY KEY,
P_NAME VARCHAR(30) NOT NULL ,
loanperiod VARCHAR(30) NOT NULL,
Maxrenewal INT ,
Maxitem INT,
Rno int not null ,
M_ID int not null,
foreign key (M_ID) references MEMBER(ID) on delete cascade ,
foreign key (Rno) references libraryResource(R_number) on delete cascade
);
CREATE TABLE FINEs (
f_number INT NOT NULL ,
AMOUNT INT NOT NULL ,
STATUS VARCHAR(30) ,
F_description VARCHAR(20) ,
Rno int not null ,
foreign key (Rno) references libraryResource(R_number) on delete cascade
);
CREATE TABLE BOOK (
ISBN INT NOT NULL PRIMARY KEY ,
B_NAME VARCHAR(50) NOT NULL ,
B_State VARCHAR(20) NOT NULL ,
B_Publisher VARCHAR(20) ,
B_Author VARCHAR(20) NOT NULL ,
Rno int not null ,
foreign key (Rno) references libraryResource(R_number) on delete cascade
);
CREATE TABLE ROOM (
R_NUMBER INT NOT NULL PRIMARY KEY ,
R_TYPE VARCHAR(50) NOT NULL ,
LOCATION_R VARCHAR(50) ,
timeEntry VARCHAR(20) ,
TimeExit VARCHAR(20) ,
STATUS VARCHAR(20) NOT NULL ,
Rno int not null ,
foreign key (Rno) references libraryResource(R_number) on delete cascade
);
CREATE TABLE RECORDING (
rec_num INT NOT NULL PRIMARY KEY,
rec_loc VARCHAR(50) NOT NULL ,
ISA VARCHAR(20) ,
Rno int not null ,
foreign key (Rno) references libraryResource(R_number) on delete cascade
);
CREATE TABLE THESIS (
T_Number INT NOT NULL PRIMARY KEY,
T_Title VARCHAR(50) NOT NULL ,
T_AUTHOR VARCHAR(30) NOT NULL ,
T_Description VARCHAR(50) NOT NULL,
T_Location VARCHAR(50) NOT NULL,
Rno int not null ,
foreign key (Rno) references libraryResource(R_number) on delete cascade
);
CREATE TABLE JOURNAL (
J_number INT NOT NULL PRIMARY KEY,
J_State VARCHAR(50) NOT NULL ,
J_Title VARCHAR(50) ,
J_Location VARCHAR(20) ,
Rno int not null ,
foreign key (Rno) references libraryResource(R_number) on delete cascade
);

CREATE view vbookstatus as
select ISBN,B_NAME,B_State,B_Publisher,B_Author
from BOOK

create user FIRST_USER
IDENTIFIED by 123456
default tablespace users
temporary tablespace temp
QUOTA 500K on users ;
grant connect to FIRST_USER ;
grant SELECT ON vbookstatus to FIRST_USER ;
