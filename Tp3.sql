-- Création de la base de données
CREATE DATABASE IF NOT EXISTS nomdelabase;

-- Utilisation de la base de données
USE nomdelabase;

-- Création de la table de dimension Location
CREATE TABLE IF NOT EXISTS Location (
    LocationID INT PRIMARY KEY,
    Borough VARCHAR(255),
    Zone VARCHAR(255),
);

-- Création de la sous-dimension LocationDetails
CREATE TABLE IF NOT EXISTS LocationDetails (
    LocationID INT PRIMARY KEY,
    LocationType VARCHAR(255),
    FOREIGN KEY (LocationID) REFERENCES Location(LocationID)
);

-- Création de la table de dimension Vendor
CREATE TABLE IF NOT EXISTS Vendor (
    VendorID INT PRIMARY KEY,
    VendorName VARCHAR(255),
);

-- Création de la sous-dimension VendorDetails
CREATE TABLE IF NOT EXISTS VendorDetails (
    VendorID INT PRIMARY KEY,
    VendorType VARCHAR(255),
    FOREIGN KEY (VendorID) REFERENCES Vendor(VendorID)
);

-- Création de la table de dimension Ratecode
CREATE TABLE IF NOT EXISTS Ratecode (
    RatecodeID INT PRIMARY KEY,
    RatecodeDescription VARCHAR(255),
);

-- Création de la sous-dimension RatecodeDetails
CREATE TABLE IF NOT EXISTS RatecodeDetails (
    RatecodeID INT PRIMARY KEY,
    RatecodeType VARCHAR(255),
    FOREIGN KEY (RatecodeID) REFERENCES Ratecode(RatecodeID)
);

-- Création de la table de dimension Time
CREATE TABLE IF NOT EXISTS Time (
    TimeID INT PRIMARY KEY,
    PickupHour INT,
    PickupDay INT,
    PickupMonth INT,
    PickupYear INT,
);

-- Création de la sous-dimension TimeDetails
CREATE TABLE IF NOT EXISTS TimeDetails (
    TimeID INT PRIMARY KEY,
    HolidayType VARCHAR(255),
    FOREIGN KEY (TimeID) REFERENCES Time(TimeID)
);

-- Création de la table de dimension PaymentType
CREATE TABLE IF NOT EXISTS PaymentType (
    PaymentTypeID INT PRIMARY KEY,
    PaymentTypeName VARCHAR(255),
);

-- Création de la sous-dimension PaymentTypeDetails
CREATE TABLE IF NOT EXISTS PaymentTypeDetails (
    PaymentTypeID INT PRIMARY KEY,
    CardNetwork VARCHAR(255),
    FOREIGN KEY (PaymentTypeID) REFERENCES PaymentType(PaymentTypeID)
);

-- Création de la table de faits Trip
CREATE TABLE IF NOT EXISTS Trip (
    TripID INT PRIMARY KEY,
    VendorID INT,
    tpep_pickup_datetime DATETIME,
    tpep_dropoff_datetime DATETIME,
    passenger_count INT,
    trip_distance FLOAT,
    RatecodeID INT,
    store_and_fwd_flag VARCHAR(1),
    PULocationID INT,
    DOLocationID INT,
    payment_type INT,
    fare_amount FLOAT,
    extra FLOAT,
    mta_tax FLOAT,
    tip_amount FLOAT,
    tolls_amount FLOAT,
    improvement_surcharge FLOAT,
    total_amount FLOAT,
    congestion_surcharge FLOAT,
    airport_fee FLOAT,
    FOREIGN KEY (VendorID) REFERENCES Vendor(VendorID),
    FOREIGN KEY (RatecodeID) REFERENCES Ratecode(RatecodeID),
    FOREIGN KEY (PULocationID) REFERENCES Location(LocationID),
    FOREIGN KEY (DOLocationID) REFERENCES Location(LocationID)
);
