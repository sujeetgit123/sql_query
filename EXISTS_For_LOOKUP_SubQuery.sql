create table customers ( customer_id int, customer_name varchar(100), customer_email varchar(200), primary key (customer_id) );

insert into customers values(1,'Shashank','abc@gmail.com');
insert into customers values(2,'Rahul','aaa@gmail.com');
insert into customers values(3,'Ajay','klm@gmail.com');
insert into customers values(4,'Nitin','poc@gmail.com');
insert into customers values(5,'Naveen','mnc@gmail.com');

create table orders ( order_id int, customer_id int, amount float, status varchar(50), primary key (order_id) );

insert into orders values(101,1,550,'Delivered');
insert into orders values(102,2,350,'Delivered');
insert into orders values(103,1,220,'Cancelled');
insert into orders values(104,3,660,'Delivered');
insert into orders values(105,3,300,'Delivered');

-- lookup query for sql
SELECT customers.* from customers WHERE EXISTS(select orders.order_id FROM orders WHERE orders.customer_id = customers.customer_id and customers.customer_name = 'Shashank');