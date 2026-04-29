-- XName is the name that you will be assigned to your Database.
CREATE DATABASE XName_Asset_Inventory;

-- (In case their are more databases open in MySQL Workbench)
-- MySQL Query to specify the Database from the list you'll be working on. 
USE XCompany_Asset_Inventory;


CREATE TABLE MacOS_Assets
(
    EmployeeID INT PRIMARY KEY,
    Employee_Location ENUM('Remote, USA', 'Remote LATAM', 'Remote EMEA', 'Headquarters') NOT NULL, 
    
    Asset_Hardware_Model ENUM(
        'MacBook "Core i7" 1.4 12" (Mid-2017)1.4 GHz Core i7 (I7-7Y75)', 
        'MacBook "Core i5" 1.3 12" (Mid-2017)1.3 GHz Core i5 (I5-7Y54)', 
        'MacBook "Core m3" 1.2 12" (Mid-2017)1.2 GHz Core m3 (M3-7Y32)', 
        'MacBook "Core m7" 1.3 12" (Early 2016)1.3 GHz Core m7 (M7-6Y75)', 
        'MacBook "Core m5" 1.2 12" (Early 2016)1.2 GHz Core m5 (M5-6Y54)', 
        'MacBook "Core m3" 1.1 12" (Early 2016)1.1 GHz Core m3 (M3-6Y30)',
        'MacBook "Core M" 1.3 12" (Early 2015)1.3 GHz Core M (M-5Y71)', 
        'MacBook "Core M" 1.2 12" (Early 2015)1.2 GHz Core M (M-5Y51)') NOT NULL,
    
    Asset_Virtual_Model ENUM('AWS EC2', 'Azure VDI') NOT NULL,
    Type_Of_Asset ENUM('New Asset', 'Replacement', 'Loaner') NOT NULL,
    
    -- Corrected Constraint: Using REGEXP to ensure only numbers are entered
    Serial_Number VARCHAR(20) NOT NULL,
    CONSTRAINT only_numbers CHECK (Serial_Number REGEXP '^[0-9]+$'),
    
    -- Required for the generated column below
    is_active TINYINT(1) DEFAULT 1,
    Asset_Condition VARCHAR(20) AS (CASE WHEN is_active = 1 THEN 'Good Condition' ELSE 'Fair Condition' END),
    
    Warranty_Information ENUM('Active', 'Expired') NOT NULL,
    
    -- Corrected: Standard DATE types
    Purchase_Date DATE NOT NULL,
    Asset_End_Date DATE NOT NULL,
    
    End_Of_Live_Value ENUM('$1,500 - $2,000', '$2,500 - $3,500', '$4,000 - $5,500', 'Special Purchase') NOT NULL,
    Notes VARCHAR(300) NOT NULL
);

CREATE TABLE Employee_Information
(
    EmployeeID INT PRIMARY KEY,
    First_Name VARCHAR(60) NOT NULL,
    Last_Name VARCHAR(60) NOT NULL,
    Starting_Date DATETIME NOT NULL,
    Employee_Number VARCHAR(20) NOT NULL,
    Home_Number VARCHAR(10) NULL,
    Mobile_Number VARCHAR(10) NOT NULL,
    Email_Address VARCHAR(80) NOT NULL,
    Address_Line VARCHAR(60) NOT NULL,
    City VARCHAR(60) NOT NULL,
    State VARCHAR(60) NOT NULL,
    Zip_Code VARCHAR(5) NOT NULL
);

CREATE TABLE Windows_Assets
(
    EmployeeID INT PRIMARY KEY,
    Employee_Location ENUM('Remote, USA', 'Remote LATAM', 'Remote EMEA', 'Headquarters') NOT NULL, 
    
    Asset_Hardware_Model ENUM(
        'Dell Pro Slim Plus QBS1250 - Windows 11 24H2', 
        'Dell Pro Tower Plus QBT1250 - Windows 11 24H2', 
        'Dell Pro Micro Plus QBM1250 - Windows 11 24H2', 
        'Dell Pro Slim QCS1250 - Windows 11 24H2', 
        'Dell Pro 13 Premium PA13250 - Windows 11 24H2', 
        'Dell Pro 14 Premium PA14250 - Windows 11 24H2',
        'Dell Pro 13 Plus PB13250 - Windows 11 24H2', 
        'Dell Pro 14 PC14250 - Windows 11 24H2',
        'Dell Pro Rugged 10 RA00260 - Windows 11 25H2',
        'Dell Pro 14 Rugged RB14250 - Windows 11 24H2') NOT NULL,
    
    Asset_Virtual_Model ENUM('AWS EC2', 'Azure VDI') NOT NULL,
    Type_Of_Asset ENUM('New Asset', 'Replacement', 'Desktop [Developer Computer]') NOT NULL,
    
    Serial_Number VARCHAR(20) NOT NULL,
    CONSTRAINT only_numbers_win CHECK (Serial_Number REGEXP '^[0-9]+$'),
    
    is_active TINYINT(1) DEFAULT 1,
    Asset_Condition VARCHAR(20) AS (CASE WHEN is_active = 1 THEN 'Good Condition' ELSE 'Fair Condition' END),
    
    Warranty_Information ENUM('Active', 'Expired') NOT NULL,
    
    Purchase_Date DATE NOT NULL,
    Asset_End_Date DATE NOT NULL,
    
    End_Of_Live_Value ENUM('$1,500 - $2,000', '$2,500 - $3,500', '$4,000 - $5,500', 'Special Purchase') NOT NULL,
    Notes VARCHAR(300) NOT NULL
);
