create database SetupDb
use SetupDb
CREATE TABLE Customers (
    CustomerId INT PRIMARY KEY,
    FirstName NVARCHAR(50),
    LastName NVARCHAR(50)
)
insert into Customers values (1,'venkatesh','n')

CREATE TABLE Orders (
    OrderId INT PRIMARY KEY,
    CustomerId INT FOREIGN KEY REFERENCES Customers(CustomerId),
    OrderDate DATETIME,
    TotalAmount DECIMAL(18, 2)
)
insert into Orders values(1,1,'12/12/2022',98000.98)
select * from Orders


create proc PlaceOrder
@customerId int,
@totalAmount float
as 
begin
declare @orderId int
insert into Orders (CustomerId, OrderDate, TotalAmount)
values (@customerId, GETDATE(), @totalAmount)
set @orderId = SCOPE_IDENTITY()
select @orderId as OrderId
end

exec PlaceOrder
@customerId = 4,
@totalAmount = 10000.50

select * from Orders