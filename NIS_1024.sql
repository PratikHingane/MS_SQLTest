

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

	SELECT MfName FROM Manufacturer_NIS1024
	   WHERE CITY LIKE 'SOUTH DAKOTA';

  -- 2. Calculate the average weight of the computers in use
      SELECT AVG(Weight) AS [Average Weight]
	   FROM Computer_NIS1024
	   WHERE EmployeeID IS NOT NULL;

 -- 3. List the employee names for employees whose area_code starts with 2
     
     SELECT * FROM Employee_NIS1024
	   WHERE AreaCode LIKE '2%';

 --4. List the serial numbers for computers that have a weight below average.
    SELECT SerialNumber FROM Computer_NIS1024 
	  WHERE Weight < (SELECT AVG(WEIGHT) FROM Computer_NIS1024);

 --5.List the manufacturer names of companies that do not have any computers in use. Use a subquery.

   SELECT * FROM Manufacturer_NIS1024
      WHERE MfName LIKE (SELECT MfName FROM Computer_NIS1024 WHERE EmployeeID IS NULL)

 --6. Create a VIEW with the list of employee name, their computer serial
 --   number, and the city that they were manufactured in. Use a join.
  CREATE VIEW vw_abc
  AS
    SELECT a.EmpName,b.SerialNumber,c.City
	FROM Employee_NIS1024 a
	INNER JOIN Computer_NIS1024 b
	ON a.EmployeeID=b.EmployeeID
	INNER JOIN Manufacturer_NIS1024 c
	ON b.MfName=c.MfName;

 SELECT * FROM vw_abc;

 --7. Write a Stored Procedure to accept EmployeeId as parameter and
 --   List the serial number, manufacturer name, model, and weight of
 --   computer that belong to the specified Employeeid.
 CREATE PROCEDURE sp_emp_cmp_NIS1024
AS
BEGIN
    SELECT e.EmployeeID, c.SerialNumber, m.MfName, c.Model, c.Weight
    FROM Employee_NIS1024 e
        INNER JOIN Computer_NIS1024 c
        ON e.EmployeeID = c.EmployeeID
        INNER JOIN Manufacturer_NIS1024 m
        ON c.MfName = m.MfName
END
  
  EXEC sp_emp_cmp_NIS1024;