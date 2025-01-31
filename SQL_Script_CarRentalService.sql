/* FINAL PROJECT MIS:
- Team 3 */

--CREATING TABLES:

--Customer table:

CREATE TABLE Customer (
    CustomerID INT PRIMARY KEY NOT NULL,
    Name VARCHAR2(100),
    DOB DATE,
    Address VARCHAR2(255),
    PhoneNumber VARCHAR2(15),
    Email VARCHAR2(100),
    DriverLicense VARCHAR2(50),
    EmergencyContact VARCHAR2(100)
);

--Vehicle table:

CREATE TABLE Vehicle (
    LicensePlate VARCHAR2(15) PRIMARY KEY NOT NULL,
    Make VARCHAR2(50),
    Model VARCHAR2(50),
    VehicleType VARCHAR2(50),
    EngineType VARCHAR2(30),
    Year INT,
    Status VARCHAR2(50)
);

--Insurance table:

CREATE TABLE Insurance (
    InsuranceID INT PRIMARY KEY NOT NULL,
    InsuranceProvider VARCHAR2(100),
    InsuranceType VARCHAR2(50),
    InsuranceCost DECIMAL(10, 2)
);

--Rental table:

CREATE TABLE Rental (
    RentalID INT PRIMARY KEY NOT NULL,
    StartDate DATE,
    EndDate DATE,
    Price DECIMAL(10, 2),
    City VARCHAR2(50),
    Rating INT,
    InsuranceID INT,
    CustomerID INT,
    LicensePlate VARCHAR2(15),
    CONSTRAINT fk_rental_insurance FOREIGN KEY (InsuranceID) REFERENCES Insurance(InsuranceID),
    CONSTRAINT fk_rental_customer FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID),
    CONSTRAINT fk_rental_vehicle FOREIGN KEY (LicensePlate) REFERENCES Vehicle(LicensePlate)
);

--Maintenance table:

CREATE TABLE Maintenance (
    MaintenanceID INT PRIMARY KEY NOT NULL,
    MaintenanceDate DATE,
    MaintenanceType VARCHAR2(50),
    MaintenanceCost DECIMAL(10, 2),
    LicensePlate VARCHAR2(15),
    CONSTRAINT fk_maintenance_vehicle FOREIGN KEY (LicensePlate) REFERENCES Vehicle(LicensePlate)
);

--Payment table:

CREATE TABLE Payment (
    PaymentID INT PRIMARY KEY NOT NULL,
    Amount DECIMAL(10, 2),
    PaymentDate DATE,
    Method VARCHAR2(50),
    RentalID INT,
    CONSTRAINT fk_payment_rental FOREIGN KEY (RentalID) REFERENCES Rental(RentalID)
);

--INSERTING DATA:

--Inserting data for CUSTOMER table:

INSERT INTO Customer (CustomerID,Name,DOB,Address,PhoneNumber,Email,DriverLicense,EmergencyContact) VALUES ('1', 'Shraddha', TO_DATE('1975-02-20', 'YYYY-MM-DD') , '1234 Ocean Avenue San Diego, CA 92109', '6587164482', 'Shraddha@gmail.com', '735914628','4680278951');
INSERT INTO Customer (CustomerID,Name,DOB,Address,PhoneNumber,Email,DriverLicense,EmergencyContact) VALUES ('2', 'Thu', TO_DATE('1997-07-14', 'YYYY-MM-DD') , '789 Elm St NW, D.C',  '9834709318', 'Thu@gmail.com', '735914628','0983267153');
INSERT INTO Customer (CustomerID,Name,DOB,Address,PhoneNumber,Email,DriverLicense,EmergencyContact) VALUES ('3', 'Ananya', TO_DATE('1998-12-01', 'YYYY-MM-DD') , '2323 Spruce Boulevard, San Francisco, CA 94101',  '7683608462', 'Ananya@gmail.com', '209348567','8764398721');
INSERT INTO Customer (CustomerID,Name,DOB,Address,PhoneNumber,Email,DriverLicense,EmergencyContact) VALUES ('4', 'Latika', TO_DATE('2001-04-24', 'YYYY-MM-DD') , '1313 Cedar Lane, New York, NY 10001',  '7179610436', 'Latika@gmail.com', '512738964','6489362185');
INSERT INTO Customer (CustomerID,Name,DOB,Address,PhoneNumber,Email,DriverLicense,EmergencyContact) VALUES ('5', 'Chris', TO_DATE('1997-12-08', 'YYYY-MM-DD') , '143 Pace Avenue, New York, NY 10001',  '7583916753', 'Chris.Peter@gmail.com', '98427942','8745263871');
INSERT INTO Customer (CustomerID,Name,DOB,Address,PhoneNumber,Email,DriverLicense,EmergencyContact) VALUES ('6','Bob', TO_DATE('1999-09-29', 'YYYY-MM-DD') , '1874 Harold Street, Chicago, IL 10864',  '7629184628', 'Bob.Patrick@gmail.com', '983610473','1093627842');
INSERT INTO Customer (CustomerID,Name,DOB,Address,PhoneNumber,Email,DriverLicense,EmergencyContact) VALUES ('7', 'Olivia', TO_DATE('1974-05-28', 'YYYY-MM-DD') , '1856 Cornelia Street Street, Greenwich, IL 10864',  '8256174635', 'OliviaJ@gmail.com', '017546826','8765178938');
INSERT INTO Customer (CustomerID,Name,DOB,Address,PhoneNumber,Email,DriverLicense,EmergencyContact) VALUES ('8', 'Samantha', TO_DATE('1990-07-13', 'YYYY-MM-DD') , '456 Maple Avenue, Seattle, WA 98101',  '4539876543','"SamanthaGray@gmail.com', '87421593687','9616574837');
INSERT INTO Customer (CustomerID,Name,DOB,Address,PhoneNumber,Email,DriverLicense,EmergencyContact) VALUES ('9' ,'John ', TO_DATE('1990-04-15', 'YYYY-MM-DD'), '1234 Elm St, Smalltown, ST 12345', '555-1234', 'john@gmail.com', '123445567', '5559876324');
INSERT INTO Customer (CustomerID,Name,DOB,Address,PhoneNumber,Email,DriverLicense,EmergencyContact) VALUES ('10', 'Gianna ', TO_DATE('1963-06-13', 'YYYY-MM-DD'), '1537 George St, ST 12345', '5557531234', 'GiannaG@gmail.com', '674893671', '7653819742');


--Inserting data for VEHICLE table:

INSERT INTO Vehicle (LicensePlate, Make, Model, VehicleType, EngineType, Year, Status) 
VALUES ('XYZ123', 'Toyota', 'Corolla', 'Sedan', 'Gas', 2020, 'Available');

INSERT INTO Vehicle (LicensePlate, Make, Model, VehicleType, EngineType, Year, Status)
VALUES ('ABC123', 'BMW', 'Corolla', 'Sedan', 'Gas', 2020, 'Not Available');
 
INSERT INTO Vehicle (LicensePlate, Make, Model, VehicleType, EngineType, Year, Status)
VALUES ('XYZ456', 'Honda', 'Civic', 'Sedan', 'Gasoline', '2019', 'Available');
 
INSERT INTO Vehicle (LicensePlate, Make, Model, VehicleType, EngineType, Year, Status)
VALUES ('DEF789', 'Ford', 'F-150', 'Truck', 'Diesel', '2018', 'Available');
 
INSERT INTO Vehicle (LicensePlate, Make, Model, VehicleType, EngineType, Year, Status)
VALUES ('GHI012', 'Chevrolet', 'Tahoe', 'SUV', 'Gasoline', '2017', 'Not Available');
 
INSERT INTO Vehicle (LicensePlate, Make, Model, VehicleType, EngineType, Year, Status)
VALUES ('JKL345', 'Toyota', 'RAV4', 'SUV', 'Hybrid', '2021', 'Available');
 
INSERT INTO Vehicle (LicensePlate, Make, Model, VehicleType, EngineType, Year, Status)
VALUES ('MNO678', 'BMW', 'X5', 'SUV', 'Gasoline', '2019', 'Available');
 
INSERT INTO Vehicle (LicensePlate, Make, Model, VehicleType, EngineType, Year, Status)
VALUES ('PQR901', 'Mercedes-Benz', 'E-Class', 'Sedan', 'Hybrid', '2020', 'Not Available');
 
INSERT INTO Vehicle (LicensePlate, Make, Model, VehicleType, EngineType, Year, Status)
VALUES ('STU234', 'Audi', 'A4', 'Sedan', 'Gasoline', '2018', 'Available');
 
INSERT INTO Vehicle (LicensePlate, Make, Model, VehicleType, EngineType, Year, Status)
VALUES ( 'VWX567', 'Nissan', 'Altima', 'Sedan', 'Hybrid', '2022', 'Available');


--Inserting data for the INSURANCE table:

INSERT INTO Insurance (InsuranceID, InsuranceProvider, InsuranceType, InsuranceCost) 
VALUES ('43718294','GoodCover Insurance', 'Comprehensive', 150.00);

INSERT INTO Insurance (InsuranceID, InsuranceProvider, InsuranceType, InsuranceCost)
VALUES ('84927531', 'AutoSecure', 'Liability', 100.00);

INSERT INTO Insurance (InsuranceID, InsuranceProvider, InsuranceType, InsuranceCost) 
VALUES ('12349876', 'TrustyCar Insurance', 'Theft Protection', 80.00);

INSERT INTO Insurance (InsuranceID, InsuranceProvider, InsuranceType, InsuranceCost) 
VALUES ('78651234','InsurePlus', 'Gap Insurance', 75.00);

INSERT INTO Insurance (InsuranceID, InsuranceProvider, InsuranceType, InsuranceCost) 
VALUES ('90817263','MotorSafe Ltd.', 'Towing and Labor', 50.00);

INSERT INTO Insurance (InsuranceID, InsuranceProvider, InsuranceType, InsuranceCost) 
VALUES ('56473829','AutoSecure', 'Fire and Theft', 125.00);

INSERT INTO Insurance (InsuranceID, InsuranceProvider, InsuranceType, InsuranceCost) 
VALUES ('23456789','InsurePlus', 'Rental Car Coverage', 65.00);

INSERT INTO Insurance (InsuranceID, InsuranceProvider, InsuranceType, InsuranceCost) 
VALUES ('87654321','GoodCover Insurance', 'Natural Disasters', 140.00);

INSERT INTO Insurance (InsuranceID, InsuranceProvider, InsuranceType, InsuranceCost) 
VALUES ('34567123','FullCover Providers', 'Comprehensive Coverage', 220.00);

INSERT INTO Insurance (InsuranceID, InsuranceProvider, InsuranceType, InsuranceCost) 
VALUES ('98765432','TrustyCar Insurance', 'Comprehensive Coverage', 210.00);


--Inserting data into the RENTAL table:

INSERT INTO Rental (RentalID, StartDate, EndDate, Price, City, Rating, InsuranceID, CustomerID, LicensePlate)
VALUES (1001, TO_DATE('2021-05-01', 'YYYY-MM-DD'), TO_DATE('2021-05-03', 'YYYY-MM-DD'), 150, 'New York', 4, 84927531, 3, 'JKL345');
 
INSERT INTO Rental (RentalID, StartDate, EndDate, Price, City, Rating, InsuranceID, CustomerID, LicensePlate)
VALUES (2035, TO_DATE('2022-01-15', 'YYYY-MM-DD'), TO_DATE('2022-01-20', 'YYYY-MM-DD'), 200, 'Los Angeles', 5, 87654321, 2, 'STU234');
 
INSERT INTO Rental (RentalID, StartDate, EndDate, Price, City, Rating, InsuranceID, CustomerID, LicensePlate)
VALUES (3076, TO_DATE('2023-07-10','YYYY-MM-DD'), TO_DATE('2023-07-15', 'YYYY-MM-DD'), 180, 'Chicago', 4, 56473829, 1, 'MNO678');
 
INSERT INTO Rental (RentalID, StartDate, EndDate, Price, City, Rating, InsuranceID, CustomerID, LicensePlate)
VALUES (4512, TO_DATE('2023-02-05','YYYY-MM-DD'), TO_DATE('2023-02-08', 'YYYY-MM-DD'), 120, 'Houston', 3, 98765432, 4, 'VWX567');
 
INSERT INTO Rental (RentalID, StartDate, EndDate, Price, City, Rating, InsuranceID, CustomerID, LicensePlate)
VALUES (5983, TO_DATE('2021-06-12','YYYY-MM-DD'), TO_DATE('2021-06-14','YYYY-MM-DD'), 160, 'Phoenix', 5, 43718294, 7, 'ABC123');
 
INSERT INTO Rental (RentalID, StartDate, EndDate, Price, City, Rating, InsuranceID, CustomerID, LicensePlate)
VALUES (6341, TO_DATE('2022-09-02','YYYY-MM-DD'), TO_DATE('2022-09-07','YYYY-MM-DD'), 190, 'Philadelphia', 4, 12349876, 6, 'XYZ456');
 
INSERT INTO Rental (RentalID, StartDate, EndDate, Price, City, Rating, InsuranceID, CustomerID, LicensePlate)
VALUES (7145, TO_DATE('2022-04-20','YYYY-MM-DD'), TO_DATE('2022-04-25','YYYY-MM-DD'), 170, 'San Antonio', 3, 78651234, 5, 'PQR901');
 
INSERT INTO Rental (RentalID, StartDate, EndDate, Price, City, Rating, InsuranceID, CustomerID, LicensePlate)
VALUES (8903, TO_DATE('2021-10-08','YYYY-MM-DD'), TO_DATE('2021-10-12','YYYY-MM-DD'), 140, 'San Diego', 4, 34567123, 10, 'XYZ123');
 
INSERT INTO Rental (RentalID, StartDate, EndDate, Price, City, Rating, InsuranceID, CustomerID, LicensePlate)
VALUES (9006, TO_DATE('2023-11-03','YYYY-MM-DD'), TO_DATE('2023-11-06','YYYY-MM-DD'), 130, 'Dallas', 5, 90817263, 9, 'GHI012');
 
INSERT INTO Rental (RentalID, StartDate, EndDate, Price, City, Rating, InsuranceID, CustomerID, LicensePlate)
VALUES (1557, TO_DATE('2022-12-17','YYYY-MM-DD'), TO_DATE('2022-12-20','YYYY-MM-DD'), 220, 'San Jose', 4, 23456789, 8, 'DEF789');


--Inserting data into the Maintenance table:

INSERT INTO Maintenance (MaintenanceID, MaintenanceDate, MaintenanceType, MaintenanceCost, LicensePlate)
VALUES (10001, TO_DATE('2021-06-05', 'YYYY-MM-DD'), 'Oil Change', 50, 'JKL345');

 INSERT INTO Maintenance (MaintenanceID, MaintenanceDate, MaintenanceType, MaintenanceCost, LicensePlate)
VALUES (10002, TO_DATE('2022-03-12', 'YYYY-MM-DD'), 'Tire Rotation', 30, 'ABC123');
 
INSERT INTO Maintenance (MaintenanceID, MaintenanceDate, MaintenanceType, MaintenanceCost, LicensePlate)
VALUES (10003, TO_DATE('2022-10-22', 'YYYY-MM-DD'), 'Brake Replacement', 150, 'STU234');
 
INSERT INTO Maintenance (MaintenanceID, MaintenanceDate, MaintenanceType, MaintenanceCost, LicensePlate)
VALUES (10004, TO_DATE('2022-08-01', 'YYYY-MM-DD'), 'Engine Tune-Up', 200, 'MNO678');
 
INSERT INTO Maintenance (MaintenanceID, MaintenanceDate, MaintenanceType, MaintenanceCost, LicensePlate)
VALUES (10005, TO_DATE('2022-08-15', 'YYYY-MM-DD'), 'Wheel Alignment', 80, 'VWX567');
 
INSERT INTO Maintenance (MaintenanceID, MaintenanceDate, MaintenanceType, MaintenanceCost, LicensePlate)
VALUES (10006, TO_DATE('2022-05-27', 'YYYY-MM-DD'), 'Transmission Flush', 120, 'XYZ456');
 
INSERT INTO Maintenance (MaintenanceID, MaintenanceDate, MaintenanceType, MaintenanceCost, LicensePlate)
VALUES (10007, TO_DATE('2022-12-10', 'YYYY-MM-DD'), 'Battery Replacement', 100, 'PQR901');
 
INSERT INTO Maintenance (MaintenanceID, MaintenanceDate, MaintenanceType, MaintenanceCost, LicensePlate)
VALUES (10008, TO_DATE('2022-01-14', 'YYYY-MM-DD'), 'Coolant Flush', 70, 'XYZ123');
 
INSERT INTO Maintenance (MaintenanceID, MaintenanceDate, MaintenanceType, MaintenanceCost, LicensePlate)
VALUES (10009, TO_DATE('2022-02-18', 'YYYY-MM-DD'), 'Spark Plug Replacement', 60, 'GHI012');
 
INSERT INTO Maintenance (MaintenanceID, MaintenanceDate, MaintenanceType, MaintenanceCost, LicensePlate)
VALUES (10010, TO_DATE('2022-09-05', 'YYYY-MM-DD'), 'Air Filter Replacement', 40, 'DEF789');


--Inserting data into the Payment table:

INSERT INTO Payment (PaymentID,Amount,PaymentDate,Method,RentalID) VALUES ( '101', '152', TO_DATE('2022-09-05', 'YYYY-MM-DD'),'DebitCard', '1001');
INSERT INTO Payment (PaymentID,Amount,PaymentDate,Method,RentalID) VALUES ( '102', '205', TO_DATE('2022-01-20', 'YYYY-MM-DD'), 'CreditCard', '2035');
INSERT INTO Payment (PaymentID,Amount,PaymentDate,Method,RentalID) VALUES ( '103', '185', TO_DATE('2022-07-15', 'YYYY-MM-DD'), 'Cash', '3076');
INSERT INTO Payment (PaymentID,Amount,PaymentDate,Method,RentalID) VALUES ( '104', '126', TO_DATE('2022-08-25', 'YYYY-MM-DD'), 'CreditCard', '4512');
INSERT INTO Payment (PaymentID,Amount,PaymentDate,Method,RentalID) VALUES ( '105', '165',  TO_DATE('2022-06-14', 'YYYY-MM-DD'), 'DebitCard', '5983');
INSERT INTO Payment (PaymentID,Amount,PaymentDate,Method,RentalID) VALUES ( '106', '192',  TO_DATE('2022-09-07', 'YYYY-MM-DD'), 'Cash', '6341');
INSERT INTO Payment (PaymentID,Amount,PaymentDate,Method,RentalID) VALUES ( '107', '174',  TO_DATE('2022-04-25', 'YYYY-MM-DD'), 'CreditCard', '7145');
INSERT INTO Payment (PaymentID,Amount,PaymentDate,Method,RentalID) VALUES ( '108', '142',  TO_DATE('2022-10-12', 'YYYY-MM-DD'), 'DebitCard', '8903');
INSERT INTO Payment (PaymentID,Amount,PaymentDate,Method,RentalID) VALUES ( '109', '135',  TO_DATE('2022-11-06', 'YYYY-MM-DD'), 'Cash', '9006');
INSERT INTO Payment (PaymentID,Amount,PaymentDate,Method,RentalID) VALUES ( '110', '224',  TO_DATE('2022-12-20', 'YYYY-MM-DD'), 'CreditCard', '1557');

--Updating Rental Table to add Location field:
ALTER TABLE RENTAL ADD Location VARCHAR2(255);

--Updating Rental Table to insert Location details corresponding to existing cities:

UPDATE RENTAL
SET Location = '40-42 Street & 625 8th Avenue'
WHERE CITY = 'New York';

UPDATE RENTAL
SET Location = '801 N Vignes Street'
WHERE CITY = 'Los Angeles';

UPDATE RENTAL
SET Location = '121 North LaSalle Street'
WHERE CITY = 'Chicago';

UPDATE RENTAL
SET Location = '5910 Hirsch Road'
WHERE CITY = 'Houston';

UPDATE RENTAL
SET Location = '302 N. 1st Avenue Suite 120'
WHERE CITY = 'Phoenix';

UPDATE RENTAL
SET Location = '100 Spring Garden St'
WHERE CITY = 'Philadelphia';

UPDATE RENTAL
SET Location = '123 N. Medina St.'
WHERE CITY = 'San Antonio';

UPDATE RENTAL
SET Location = '4005 Taylor St'
WHERE CITY = 'San Diego';

UPDATE RENTAL
SET Location = '205 S Lamar St'
WHERE CITY = 'Dallas';

UPDATE RENTAL
SET Location = '100 W San Carlos St '
WHERE CITY = 'San Jose';

--Renaming the Location column:
ALTER TABLE RENTAL
RENAME COLUMN Location TO "PickUp&DropOff Location";
