insert into Categories (CategoryName)
values ('Woodwinds');

update Categories
set CategoryName = 'Brass'
where CategoryID = 5;

delete from Categories
where CategoryID = 5;

insert into Products
	(CategoryID, ProductCode, ProductName, Description, ListPrice, DiscountPercent, DateAdded)
values
	(4, 'NE6D-73', 'Nord Electro 6D 73 73-key Keyboard', 'Long description to come.', 2599, 0, CURRENT_TIMESTAMP);

update Products
set DiscountPercent = 20
where ProductID = 11;

delete from Products
where CategoryID = 4;
delete from Categories
where CategoryID = 4;

insert into Customers
	(EmailAddress, Password, FirstName, LastName)
values
	('samantha@gmail.com', '', 'Samantha', 'Stevens');

update Customers
set Password = 'letmein'
where EmailAddress = 'samantha@gmail.com';

update Customers
set Password = 'newpasswordneeded';