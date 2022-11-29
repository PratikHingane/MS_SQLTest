

-----------Machine Test-------------

--Create table Employee_NIS1024
CREATE TABLE Employee_NIS1024(
 EmployeeID INT PRIMARY KEY IDENTITY,
 EmpName VARCHAR(20),
 Phone VARCHAR(20),
 Email VARCHAR(30)
 );

 --Create table Manufacturer_NIS1024
 CREATE TABLE Manufacturer_NIS1024(
  MfName VARCHAR(20) PRIMARY KEY,
  City VARCHAR(10),
  State VARCHAR(15)
  );




  --Create table Computer_NIS1024

CREATE TABLE Computer_NIS1024(
  SerialNumber INT PRIMARY KEY IDENTITY,
  MfName VARCHAR(20)
  CONSTRAINT fk_Manuf
  FOREIGN KEY (MfName)
  REFERENCES Manufacturer_NIS1024(MfName),
  Model VARCHAR(20),
  Weight INT,
  EmployeeID INT
  CONSTRAINT fk_Employee
  FOREIGN KEY (EmployeeID)
  REFERENCES Employee_NIS1024(EmployeeID)
  );

  --Adding AREACODE column in Employee_NIS1024
  ALTER TABLE Employee_NIS1024 
    ADD AreaCode INT;

	ALTER TABLE Manufacturer_NIS1024
	 ALTER Column City VARCHAR(20);
	--Insertion of data
	INSERT INTO Employee_NIS1024 VALUES ('Pratik','8149916992','pratik@gmail.com',444606),
	                                    ('Prajot','8149916993','prajot@gmail.com',444607),
										('Anand','8149916994','anand@gmail.com',444601);

		SELECT * FROM Employee_NIS1024;

	Insert into Manufacturer_Nis1024 VALUES('Dell','Pune','Maharashtra'),
                                        ('HP','Delhi','Delhi'),
                                        ('Asus','South Dakota','Karnataka');



	SELECT * FROM Manufacturer_NIS1024;

	INSERT INTO Computer_Nis1024 VALUES('HP','Pavillion',2,1),
                                    ('Dell','Gamers',4,3),
                                    ('ASUS','Ideapad',3,null);

   SELECT * FROM Employee_NIS1024;
   SELECT * FROM Manufacturer_NIS1024;
   SELECT * FROM Computer_NIS1024;

	--1. List the manufacturers’ names that are located in South Dakota.