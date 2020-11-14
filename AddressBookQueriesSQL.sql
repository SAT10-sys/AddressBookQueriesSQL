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



/* IMPLEMENTATION OF ER DIAGRAM */
/* ADDRESS BOOK TABLE*/
--CREATE TABLE
create table AddressBook
(
BookId varchar(5) primary key,
BookName varchar(20) not null,
Type varchar(10) not null,
)
--INSERT VALUES
insert into AddressBook values
('B01','Book1','Family'),
('B02','Book2','Friends'),
('B03','Book3','Job');
select * from AddressBook


/* CONTACT TABLE */
--CREATE TABLE
create table Contact
(
CId int identity(1,1) primary key,
FirstName varchar(30) not null,
LastName varchar(30) not null,
ZipCode varchar(6) not null foreign key references Zip(ZipCode),
PhoneNumber varchar(10) not null,
EmailID varchar(50) not null
)
--INSERT VALUES
insert into Contact values
('James','Hetfield','123456','1111111111','jher@yahoo.com'),
('Lars','Ulrich','123457','2222222222','lrt6@yahoo.com'),
('Kirk','Hammet','123458','3333333333','khnt5@gmail.com'),
('Cliff','Burton','234565','4444444444','cbgt6@gmail.com'),
('Mike','Shinoda','234569','5555555555','msdr45@yahoo.com'),
('Rajat','Ghosh','345678','6666666666','rgty6@gmail.com'),
('Satantra','Tewari','713204','7777777777','iamsatantra@gmail.com'),
('Sachin','Tendulkar','654321','8888888888','srt200@yahoo.com'),
('Rohit','Sharma','134567','9999999999','rt264@yahoo.com');


/* ADDRESSBOOKCONTACT TABLE */
--CREATE TABLE
create table AddressBookContact
(
BookId varchar(5) not null foreign key references AddressBook(BookId),
CId int not null foreign key references Contact(CId)
);
--INSERT VALUES
insert into AddressBookContact values
('B01',1),
('B01',2),
('B01',3),
('B02',4),
('B02',5),
('B02',6),
('B03',7),
('B03',8),
('B03',9);

/* ZIP TABLE */
--CREATE TABLE
create table Zip
(
ZipCode varchar(6) primary key,
Address varchar(100) not null,
City varchar(30) not null,
State varchar(30) not null
)
--INSERT VALUES
insert into Zip values
('123456','DownTown','San Francisco','California'),
('123457','San Jose','San Francisco','California'),
('123458','DownTown','San Francisco','California'),
('234565','Manhattan','New York City','New York'),
('234569','Queens','New York City','New York'),
('345678','Rajarhat','Kolkata','West Bengal'),
('713204','Steel Township','Durgapur','West Bengal'),
('654321','Bandra','Mumbai','Maharashtra'),
('134567','Andheri','Mumbai','Maharashtra');


Select FirstName,LastName,PhoneNumber,EmailID from Contact INNER JOIN Zip ON Contact.ZipCode = Zip.ZipCode where city = 'Mumbai'
Select FirstName,LastName,PhoneNumber,EmailID from Contact INNER JOIN Zip ON Contact.ZipCode = Zip.ZipCode where city = 'Durgapur'
Select FirstName,LastName,PhoneNumber,EmailID from Contact INNER JOIN Zip ON Contact.ZipCode = Zip.ZipCode where city = 'Kolkata'
Select FirstName,LastName,PhoneNumber,EmailID from Contact INNER JOIN Zip ON Contact.ZipCode = Zip.ZipCode where city = 'New York City'
Select FirstName,LastName,PhoneNumber,EmailID from Contact INNER JOIN Zip ON Contact.ZipCode = Zip.ZipCode where city = 'San Francisco'
--UC6 run

Select state,city,Count(CId) from Contact Inner Join Zip ON Contact.ZipCode = Zip.ZipCode group by city,state
--UC7 Run

Select FirstName,LastName from Contact Inner Join Zip ON Contact.ZipCode = Zip.ZipCode where city = 'Mumbai' order by City
Select FirstName,LastName from Contact Inner Join Zip ON Contact.ZipCode = Zip.ZipCode where city = 'San Francisco' order by City
Select FirstName,LastName from Contact Inner Join Zip ON Contact.ZipCode = Zip.ZipCode where city = 'New York City' order by City
--UC8 Run

Select Type,Count(Contact.CId) from Contact Inner Join AddressBookContact ON Contact.CId = AddressBookContact.CId
Inner Join AddressBook ON AddressBook.BookId = AddressBookContact.BookId group by Type;

