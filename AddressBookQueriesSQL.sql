create database AddressBookServiceSQL
select * from sys.databases where name='AddressBookServiceSQL';
use AddressBookServiceSQL
--UC1_DatabaseCreated

create table AddressBookTable
(
firstName varchar(30),
lastName varchar(30),
address varchar(100),
city varchar(30),
state varchar(30),
zipCode varchar(6),
phoneNumber varchar(10),
emailId varchar(50)
)
select * from AddressBookTable
--UC2_TableCreated