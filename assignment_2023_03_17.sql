-- using MYSQL database


-- table creation

CREATE TABLE jobs(
    job_id INT NOT NULL ,
    PRIMARY KEY (job_id) , 
    job_title VARCHAR(255) NOT NULL,
    min_salary INT NOT NULL,
    CHECK(min_salary>1000), 
    max_salary INT(50)
);

CREATE TABLE regions(
    region_id int PRIMARY KEY NOT NULL,
    region_name VARCHAR(255)
);

CREATE TABLE countries(
    country_id int PRIMARY KEY,
    country_name VARCHAR(255),
    region_id INT ,
    FOREIGN KEY (region_id) REFERENCES regions(region_id)
);


CREATE TABLE locations(
    location_id INT PRIMARY KEY ,
    street_address VARCHAR(255),
    postal_code VARCHAR(10), 
    city VARCHAR(255),
    state_province VARCHAR(255),
    country_id INT,
    FOREIGN KEY (country_id) REFERENCES countries(country_id)
);

CREATE TABLE departments(
    department_id int NOT NULL PRIMARY KEY,
    department_name VARCHAR(255),
    location_id INT ,
    FOREIGN KEY (location_id) REFERENCES locations(location_id)
);

CREATE TABLE employee(
    employee_id INT NOT NULL PRIMARY KEY , 
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    email VARCHAR(255) ,
    phone_number VARCHAR(255) NOT NULL,
    hire_date date,
    job_id INT NOT NULL,
    salary int ,
    manager_id int,
    department_id int ,
    FOREIGN KEY (job_id) REFERENCES jobs(job_id),
    FOREIGN KEY (department_id) REFERENCES departments(department_id)
);



CREATE TABLE dependents(
    dependent_id INT NOT NULL PRIMARY KEY,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    relationship VARCHAR(255) ,
    employee_id INT NOT NULL,
    FOREIGN KEY (employee_id) REFERENCES employee(employee_id) 
);

-- inserting values

INSERT INTO jobs(job_id,job_title,min_salary,max_salary) VALUES 
(1,'enigineer',20000,30000),(4,'uidesigner',12000,20000),(9, 'hr',50000,200000),(10,'lead',30000,100000),
(8, 'devops',38000,90000);

INSERT INTO regions(region_id, region_name) VALUES 
(2, 'kolkata'),(4 , 'delhi'),(10, 'newyork'),(11, 'dhaka'),(12, 'poland');

INSERT INTO countries(country_id,country_name,region_id) VALUES 
(1, 'india',4),(2, 'india',4),(3, 'usa',10),(5, 'bangladesh',11),(10, 'ukrain',12);

INSERT INTO locations(location_id, street_address,postal_code,city,state_province,country_id) VALUES
(1 , 'road abc','50000','acc','24pgn',1),(2 , 'road 123','90001','dhaka','seoul',10),(3,'a12 road','700110','kuala lampur','khardah',12),
(4,'road oop','700000','saltlake','l12',4),(5,'road 100','121321','pcc','delhi',10);

INSERT INTO department(department_id, department_name,location_id) VALUES 
(1, 'finance',2),(2,'quant',2),(4,'hr',5),(6,'supplychain',4),(3,'analyst',1);

INSERT INTO employees(employee_id, first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) VALUES
(1,'abc','def','abc@gmail.com','7990999010','2022-10-19',1,20000,null,2),
(2,'sad','gss','sad@gmial.com','7990999010','2020-04-26',1,69000,null,4),
(3,'dsasd','PANDIT','dsas@gmail.com','7990922010','2021-05-23',4,30000,null,3),
(4,'qqw','SAH','asda@gmail.com','8990999210','2020-08-04',9,50000,3,2),
(5,'asdasd','asdas','paa@gmail.com','5990999010','2022-04-19',8,120000,3,6),
(6,'hghg','asd','adsd@gmail.com','9794643673','2022-04-19',10,89000,null,1),
(7,'sfa','add','rssda@gmail.com','2990999010','2012-12-12',9,55000,6,4),
(9,'asdsad','pkdsa','dsda@gmial.com','7990999010','2002-07-24',10,70000,6,3),
(10,'khan','mdk','asdsad@gmail.com','7990999010','2020-09-13',1,50000,null,6),
(12, 'paa','dsds','maaas@gmail.com','7990999010','2002-09-04',4,78000,10,4);

INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) VALUES 
(1,'asdsd','cas','brother',6),(3,'oass','sdasd','father',2),(4,'sdall','pqooq','son',1),(6,'asdazs','asdasq','mother',4),(10,'dsadc','asda','daughter',9);


--In departments table, add a new field 'manager_name' of type VARCHAR
--REMOVE field max_salary from jobs.
--In the locations table, rename postal_code column to pincode.

-- Questions

-- [a]
ALTER TABLE departments 
ADD manager_name varchar(255);

-- [b]
ALTER TABLE jobs
DROP COLUMN max_salary;

-- [c]
ALTER TABLE locations 
rename COLUMN postal_code TO pincode;
