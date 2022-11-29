

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

