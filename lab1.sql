DROP DATABASE students;
DROP DATABASE db_name;

SHOW DATABASES;
CREATE database if not exists college;

use college;
show tables;

create table category(
	catergory_id NUMERIC(2),
 category_name varchar(30)
);


create table sub_category_detail(
	sub_category_id NUMERIC(2),
	category_id NUMERIC(2),
	sub_category_name VARCHAR(30)
);

CREATE TABLE product_details (
  product_id NUMERIC(6),
  category_id NUMERIC(2),
  sub_category_id NUMERIC(2),
  product_name VARCHAR(30)
);

ALTER TABLE category ADD PRIMARY KEY (catergory_id);
alter table sub_category_detail add constraint pk_sub_category_id primary key (sub_category_id); 

ALTER TABLE sub_category_detail ADD CONSTRAINT fk_sub_category FOREIGN KEY (category_id)
REFERENCES category(catergory_id);

ALTER TABLE Product_details
ADD price NUMERIC(2);

ALTER TABLE product_details
MODIFY COLUMN price NUMERIC(6,2);

INSERT INTO category (catergory_id, category_name) VALUES (1, 'Electronics');
INSERT INTO category (catergory_id, category_name) VALUES (2, 'Clothing');

INSERT INTO sub_category_detail (sub_category_id, category_id, sub_category_name) VALUES (1, 1, 'Mobiles');
INSERT INTO sub_category_detail (sub_category_id, category_id, sub_category_name) VALUES (2, 1, 'Laptops');
INSERT INTO sub_category_detail (sub_category_id, category_id, sub_category_name) VALUES (3, 2, 'Men');
INSERT INTO sub_category_detail (sub_category_id, category_id, sub_category_name) VALUES (4, 2, 'Women');

INSERT INTO product_details (product_id, category_id, sub_category_id, product_name, price) VALUES (100001, 1, 1, 'iPhone', 99.99);
INSERT INTO product_details (product_id, category_id, sub_category_id, product_name, price) VALUES (100002, 1, 2, 'Dell Laptop', 89.99);
INSERT INTO product_details (product_id, category_id, sub_category_id, product_name, price) VALUES (100003, 2, 3, 'Men Shirt', 49.99);
INSERT INTO product_details (product_id, category_id, sub_category_id, product_name, price) VALUES (100004, 2, 4, 'Women Dress', 59.99);


select * from category;
select * from sub_category_detail;
select * from product_details;

ALTER TABLE Product_details
DROP COLUMN price;

SHOW tables;
