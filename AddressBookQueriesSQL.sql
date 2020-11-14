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

insert into AddressBookTable values
('James','Hetfield','DownTown','San Francisco','California','123456','1111111111','jher@yahoo.com'),
('Lars','Ulrich','San Jose','San Francisco','California','123456','2222222222','lrt6@yahoo.com'),
('Kirk','Hammet','DownTown','San Francisco','California','123456','3333333333','khnt5@gmail.com'),
('Cliff','Burton','Manhattan','New York City','New York','234567','4444444444','cbgt6@gmail.com'),
('Mike','Shinoda','Queens','New York City','New York','234567','5555555555','msdr45@yahoo.com'),
('Rajat','Ghosh','Rajarhat','Kolkata','West Bengal','345678','6666666666','rgty6@gmail.com'),
('Satantra','Tewari','Steel Township','Durgapur','West Bengal','713204','7777777777','iamsatantra@gmail.com'),
('Sachin','Tendulkar','Bandra','Mumbai','Maharashtra','654321','8888888888','srt200@yahoo.com'),
('Rohit','Sharma','Andheri','Mumbai','Maharashtra','134567','9999999999','rt264@yahoo.com');
select * from AddressBookTable
--UC3_ValuesInsertedInTable

update AddressBookTable set phoneNumber='1234567890' where firstName='James' and lastName='Hetfield';
update AddressBookTable set address='Worli' where firstName='Sachin' or firstName='Rohit';
select * from AddressBookTable
--UC4_TableUpdatedBasedOnName

delete from AddressBookTable where firstName='Lars';
select * from AddressBookTable
--UC5_DeletedContactUsingName

select * from AddressBookTable where city='New York City';
select * from AddressBookTable where state='West Bengal';
--UC6_RetrievedContactUsingCityOrState

select state,COUNT(firstName) as count from AddressBookTable group by state;
select city,COUNT(firstName) as count from AddressBookTable group by city;
--UC7_GotCountOfContactsByCityAndState

select * from AddressBookTable where city='New York City' order by firstName;
select * from AddressBookTable where city='Mumbai' order by firstName;
select * from AddressBookTable where city='San Francisco' order by firstName;
--UC8_SortedAlphabeticallyNamesForEachCity

alter table AddressBookTable add addressBookName varchar(20);
alter table AddressBookTable add addressBookType varchar(20);
update AddressBookTable set addressBookName='Book1', addressBookType='Family' where firstName='Sachin' or firstName='Rajat' or firstName='Satantra';
update AddressBookTable set addressBookName='Book2', addressBookType='Friends' where firstName='James' or firstName='Kirk' or firstName='Mike';
update AddressBookTable set addressBookName='Book3', addressBookType='Job' where firstName='Rohit' or firstName='Cliff';
select * from AddressBookTable
--UC9_AddedNameAndTypeOfAddressBookAndAssignedContacts

select addressBookType,COUNT(firstName) as count from AddressBookTable group by addressBookType;
--UC10_GotCountByType


insert into AddressBookTable values
('James','Hetfield','DownTown','San Francisco','California','123456','1234567890','jher@yahoo.com','Book1','Family')
select * from AddressBookTable
--UC11_AddedAsFamilyAndFriend

