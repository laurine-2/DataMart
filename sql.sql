-- Utilisation de la base de données DataMart
USE SnowflakeDatabase;

INSERT INTO Location (LocationID, Borough, Zone)
SELECT LocationID, Borough, Zone
FROM DataWarehouseDatabase.Location;

INSERT INTO LocationDetails (LocationID, LocationType)
SELECT LocationID, LocationType
FROM DataWarehouseDatabase.LocationDetails;

INSERT INTO Vendor (VendorID, VendorName)
SELECT VendorID, VendorName
FROM DataWarehouseDatabase.Vendor;

INSERT INTO VendorDetails (VendorID, VendorType)
SELECT VendorID, VendorType
FROM DataWarehouseDatabase.VendorDetails;

INSERT INTO Ratecode (RatecodeID, RatecodeDescription)
SELECT RatecodeID, RatecodeDescription
FROM DataWarehouseDatabase.Ratecode;

INSERT INTO RatecodeDetails (RatecodeID, RatecodeType)
SELECT RatecodeID, RatecodeType
FROM DataWarehouseDatabase.RatecodeDetails;

INSERT INTO Time (TimeID, PickupHour, PickupDay, PickupMonth, PickupYear)
SELECT TimeID, PickupHour, PickupDay, PickupMonth, PickupYear
FROM DataWarehouseDatabase.Time;

INSERT INTO TimeDetails (TimeID, HolidayType)
SELECT TimeID, HolidayType
FROM DataWarehouseDatabase.TimeDetails;

INSERT INTO PaymentType (PaymentTypeID, PaymentTypeName)
SELECT PaymentTypeID, PaymentTypeName
FROM DataWarehouseDatabase.PaymentType;

INSERT INTO PaymentTypeDetails (PaymentTypeID, CardNetwork)
SELECT PaymentTypeID, CardNetwork
FROM DataWarehouseDatabase.PaymentTypeDetails;

INSERT INTO Trip (
    TripID, VendorID, tpep_pickup_datetime, tpep_dropoff_datetime,
    passenger_count, trip_distance, RatecodeID, store_and_fwd_flag,
    PULocationID, DOLocationID, payment_type, fare_amount, extra,
    mta_tax, tip_amount, tolls_amount, improvement_surcharge,
    total_amount, congestion_surcharge, airport_fee
)
SELECT
    TripID, VendorID, tpep_pickup_datetime, tpep_dropoff_datetime,
    passenger_count, trip_distance, RatecodeID, store_and_fwd_flag,
    PULocationID, DOLocationID, payment_type, fare_amount, extra,
    mta_tax, tip_amount, tolls_amount, improvement_surcharge,
    total_amount, congestion_surcharge, airport_fee
FROM DataWarehouseDatabase.Trip;
