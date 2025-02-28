CREATE DATABASE TechcrushEnergy
USE TechcrushEnergy

CREATE TABLE Vehicle (
      VehicleID INT PRIMARY KEY IDENTITY (1, 1),
	  Type VARCHAR (300) NOT NULL,
	  Model VARCHAR (300) NOT NULL,
	  Manufacturing_Date VARCHAR (300) NOT NULL,
	  Status VARCHAR (300) CHECK (Status IN ('Active', 'Inactive', 'Retired')) NOT NULL,
	  DriverID INT NOT NULL,
	  DepartmentID INT NOT NULL,
	  FOREIGN KEY (DriverID) REFERENCES Driver (DriverID),
	  FOREIGN KEY (DepartmentID) REFERENCES Department (DepartmentID),
	  )

ALTER TABLE Vehicle
	  ADD Retirement_Date DATE

CREATE TABLE Driver (
      DriverID INT PRIMARY KEY IDENTITY (1,1),
	  Full_Name VARCHAR (300) NOT NULL,
	  Contact_Information VARCHAR (300) NOT NULL,
	  Date_of_Birth DATE NOT NULL,
	  License_Number Varchar (300) UNIQUE,
	  )

CREATE TABLE Schedule (
      ScheduleID INT PRIMARY KEY IDENTITY (1, 1),
      VehicleID INT NOT NULL,
	  DriverID INT NOT NULL,
	  Date VARCHAR (300) NOT NULL,
	  Time VARCHAR (300) NOT NULL,
	  Task_Description TEXT,
	  Status VARCHAR (300) CHECK (Status IN ('Pending', 'Cancelled', 'Completed')) NOT NULL,
	  FOREIGN KEY (VehicleID) REFERENCES Vehicle (VehicleID),
	  FOREIGN KEY (DriverID) REFERENCES Driver (DriverID)
	  )
      
CREATE TABLE MaintenanceRecords (
      MaintenanceID INT PRIMARY KEY IDENTITY (1, 1),
      VehicleID INT NOT NULL,
	  Issues VARCHAR (300) NOT NULL,
	  Issues_Date DATE NOT NULL,
	  Maintenance_Date VARCHAR (300) NOT NULL,
	  Maintenance_Summary VARCHAR (MAX) NOT NULL,
	  FOREIGN KEY (VehicleID) REFERENCES Vehicle (VehicleID)
	  )

ALTER TABLE MaintenanceRecords
 ADD MaintenanceID INT PRIMARY KEY IDENTITY (1, 1)

ALTER TABLE MaintenanceRecords
 ADD Maintenance_Summary VARCHAR (MAX) NOT NULL

ALTER TABLE MaintenanceRecords
 DROP COLUMN PastInspections

CREATE TABLE Department (
      DepartmentId INT PRIMARY KEY IDENTITY (1, 1),
	  Department_Name VARCHAR (300) NOT NULL
	  )

INSERT INTO Vehicle (Type, Model, Manufacturing_Date, Status, DriverID, DepartmentID)
  VALUES 
       ('Truck', 'Model A', '2020-06-10', 'Active', 1, 1),
       ('Bus', 'Model B', '2019-03-20', 'Inactive', 2, 1),
       ('Solar Panel', 'SolarMax 3000', '2021-08-15', 'Active', 7, 3),
       ('Wind Turbine', 'WindGen X', '2018-11-30', 'Retired', 8, 3),
       ('Truck', 'Model C', '2022-01-05', 'Active', 3, 1),
       ('Excavator', 'Excavator Z', '2021-09-25', 'Active', 4, 2),
       ('Bus', 'Model D', '2020-05-18', 'Inactive', 5, 1),
       ('Solar Panel', 'SolarMax 5000', '2023-04-10', 'Active', 10, 3),
       ('Crane', 'CranePro 100', '2017-12-14', 'Retired', 9, 2),
       ('Truck', 'Model E', '2021-02-19', 'Active', 6, 1)

UPDATE Vehicle
SET Retirement_Date = NULL
WHERE VehicleID IN (1, 2, 3, 5, 6, 7, 8, 10)

UPDATE Vehicle
SET Retirement_Date = '2024-01-15'
WHERE VehicleID = 4

UPDATE Vehicle
SET Retirement_Date = '2023-06-30'
WHERE VehicleID = 9

INSERT INTO Driver (Full_Name, Contact_Information, Date_Of_Birth, License_Number)
  VALUES 
       ('John Doe', 'john@gmail.com, 08182838485', '1985-06-15', 'DL12345'),
       ('Jane Smith', 'smith@hotmail.com, 07028173645', '1990-07-22', 'DL67890'),
       ('Robert Brown', 'robertbrown@skype.com, 08182838485', '1980-02-10', 'DL11223'),
       ('Emily Davis', 'emilydavis34@gmail.com, 09194959394', '1995-03-15', 'DL44556'),
       ('Michael Wilson', 'michaewilson@gmail.com, 09192949699', '1988-01-05', 'DL77889'),
       ('Sarah Johnson', 'Johnson@gmail.com, 08183846789', '1992-09-12', 'DL99001'),
       ('David Clark', 'Dlark@skype.com, 09020347890', '1987-11-20', 'DL22334'),
	   ('Laura Miller', 'Miller@gmail.com, 07030788901', '1989-05-10', 'DL55677'),
       ('Peter Wright', 'Wright234@skpe.com, 09023459012', '1983-08-25', 'DL88990'),
       ('Sophia Lee', 'sophia.lee@Hotmail.com, 08156780123', '1994-12-30', 'DL11245')


INSERT INTO Schedule (VehicleID, DriverID, Date, Time, Task_Description, Status)
  VALUES 
        (1, 1, '2025-01-21', '08:00:00', 'Deliver goods to Warehouse A', 'Pending'),
        (2, 2, '2025-01-22', '10:00:00', 'Pick up passengers at Airport', 'Cancelled'),
        (3, 10, '2025-01-23', '09:00:00', 'Inspect solar panel efficiency', 'Pending'),
        (4, 8, '2025-01-24', '07:00:00', 'Wind turbine maintenance', 'Completed'),
        (5, 3, '2025-01-25', '11:00:00', 'Transport construction materials', 'Pending'),
        (6, 4, '2025-01-26', '14:00:00', 'Excavation task at Site X', 'Completed'),
        (7, 5, '2025-01-27', '12:00:00', 'School bus route B', 'Cancelled'),
        (8, 7, '2025-01-28', '08:30:00', 'Install new solar panels', 'Pending'),
        (9, 9, '2025-01-29', '13:00:00', 'Crane testing at Site Y', 'Completed'),
        (10, 6, '2025-01-30', '16:00:00', 'Truck delivery to Plant C', 'Pending')

INSERT INTO MaintenanceRecords (VehicleID, Issues, Issues_Date, Maintenance_Date, Maintenance_Summary)
  VALUES 
       (1, 'Oil leak detected', '2025-01-01', '2025-01-10', 'Oil leak fixed; filters replaced'),
       (2, 'Brake system failure', '2024-12-15', '2025-01-05', 'Brakes repaired; system tested'),
       (3, 'Panel efficiency below expected', '2025-01-03', '2025-01-08', 'Cleaned panels; restored connections'),
       (4, 'Gearbox issue', '2024-11-20', '2024-12-01', 'Gearbox replaced; turbine operational'),
       (5, 'Fuel pump issue', '2025-01-10', '2025-01-15', 'Fuel pump repaired; filters cleaned'),
       (6, 'Hydraulic fluid low', '2024-12-25', '2025-01-05', 'Fluid refilled; system inspected'),
       (7, 'Battery replacement needed', '2025-01-02', '2025-01-10', 'Battery replaced; system operational'),
       (8, 'Panel wiring loose', '2025-01-18', '2025-01-22', 'Wiring fixed; panels retested'),
       (9, 'Crane motor malfunction', '2024-10-15', '2024-11-05', 'Motor repaired; tested with load'),
       (10, 'Tire wear detected', '2025-01-15', '2025-01-20', 'Tires replaced; aligned wheels')

INSERT INTO Department (Department_Name) 
  VALUES 
      ('Logistics'),
      ('Operations'),
      ('Quality Assurance'),
      ('Maintenance'),
      ('Administration'),
      ('Customer Support'),
      ('IT Support'),
      ('Procurement'),
      ('Transportation'),
      ('Human Resource')

/* Part 2 
Create and test the following queries to validate the database: 
● Retrieve all details of active vehicles/equipment*/
   
   SELECT VehicleID, Type, Model, Manufacturing_Date, Status
   FROM Vehicle
   Where Status = 'Active'

--- Retrieve all drivers who are assigned to specific vehicles. 
   
   SELECT Driver.DriverID, Full_Name, Contact_Information, Type, Model, License_Number
   FROM Vehicle
    JOIN Driver
   ON Vehicle. VehicleID = Driver.DriverID

--- Display schedules along with assigned vehicles/equipment and drivers/operators. 
    
	SELECT ScheduleID, Full_Name, Task_Description, Type, Model, Date, Time, Schedule.Status
	FROM Schedule
	JOIN Vehicle 
	ON Schedule.ScheduleID = Vehicle.VehicleID
	JOIN Driver
	ON Schedule.ScheduleID = Driver.DriverID

 --- Show all maintenance records for a given vehicle, including its department name
 
     SELECT Department_Name,Type, Model, Issues, Issues_Date, Maintenance_Date, Maintenance_Summary
	 FROM MaintenanceRecords As Mr
	 JOIN Vehicle
	 ON Mr.MaintenanceID = Vehicle.VehicleID
    JOIN Department
	ON Mr. MaintenanceID = Department.DepartmentID

--- List vehicles that have pending maintenance schedules. 
     
	 SELECT Vehicle.VehicleId, Type, Model, Issues, Maintenance_date, Schedule.Status
	 FROM Vehicle
	 LEFT JOIN MaintenanceRecords 
	 ON Vehicle.VehicleID = MaintenanceRecords.VehicleID
	 LEFT JOIN Schedule
	 ON Vehicle.VehicleID = Schedule.VehicleID
	 Where Schedule.Status = 'Pending'

--- Count the number of vehicles/equipment in each department.
     
	 SELECT Department_Name, Count (VehicleID) Number_of_vehicles_in_each_Department
	 FROM Department
	 LEFT JOIN Vehicle
	 ON Department.DepartmentID = Vehicle.DepartmentID
	 GROUP BY Department_Name

--- Calculate the average age of all active vehicles/equipment. 
     
	 SELECT Type AS Active_Vehicle, Vehicle.Status, AVG (DATEDIFF(YEAR, Manufacturing_date, GETDATE ())) Average_Age
	 FROM Vehicle
	 WHERE Vehicle.Status = 'Active'
	 GROUP BY Vehicle.Status, TYPE

--- Update the status of a schedule to completed. 
   
   UPDATE Schedule
	SET Status = 'Completed'
	WHERE ScheduleID = 1
     
--- Record the retirement date for a vehicle/equipment.
    
	UPDATE Vehicle
    SET Retirement_Date = '2025-01-31'
    WHERE VehicleID = 4

--- Remove a schedule if it was cancelled
   DELETE FROM Schedule
   WHERE Status = 'Cancelled' AND ScheduleID = 2

SELECT * FROM Vehicle
SELECT * FROM Driver
SELECT * FROM Schedule
SELECT * FROM MaintenanceRecords
SELECT * FROM Department