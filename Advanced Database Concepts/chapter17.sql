USE MyGuitarShop
CREATE ROLE OrderEntry
GRANT UPDATE
ON Orders
TO OrderEntry
GRANT INSERT,UPDATE
ON OrderItems
TO OrderEntry

USE MASTER
GO
CREATE LOGIN RobertHalliday with PASSWORD='HelloBob', DEFAULT_DATABASE=MyGuitarShop,DEFAULT_LANGUAGE=US_ENGLISH
GO
ALTER LOGIN RobertHalliday ENABLE
GO
USE MyGuitarShop
GO
CREATE USER RobertHalliday FOR LOGIN RobertHalliday WITH DEFAULT_SCHEMA=[DBO]
EXEC sp_addrolemember 'OrderEntry', 'RobertHalliday'

EXEC sp_DropRoleMember OrderEntry, RBrautigan
DROP ROLE OrderEntry

create schema Admin;
create table Admin.Addresses as select * from dbo.Addresses;
 alter user RobertHalliday with DEFAULT_SCHEMA = Admin;
 Grant CREATE,DELETE,EXECUT,INSERT,SELECT,TAKE OWNERSHIP,UPDATE,VIEW CHANGE TRACKING,VIEW DEFINITION on schema :: Admin to RobertHalliday;
