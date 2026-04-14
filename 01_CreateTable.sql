-- Create Database
Create Database VoteGuard;

-- Create Table 

CREATE TABLE voters (
    voter_id INT PRIMARY KEY,
    full_name VARCHAR(100),
    gender VARCHAR(10),
    date_of_birth DATE,
    age INT,
    aadhaar_number VARCHAR(12),
    phone_number VARCHAR(15),
    email VARCHAR(100),
    address TEXT,
    city VARCHAR(50),
    district VARCHAR(50),
    state VARCHAR(50),
    pincode VARCHAR(10),
    registration_date DATE
);
USE voteguard;
SELECT*FROM voters;

CREATE TABLE constituencies (
    constituency_id INT PRIMARY KEY,
    constituency_name VARCHAR(100),
    district VARCHAR(50),
    state VARCHAR(50),
    total_population INT
);
SELECT*FROM constituencies;

CREATE TABLE polling_stations (
    station_id INT PRIMARY KEY,
    station_name VARCHAR(100),
    constituency_id INT,
    capacity INT,
    FOREIGN KEY (constituency_id) REFERENCES constituencies(constituency_id)
);
SELECT*FROM polling_stations;

CREATE TABLE voting_records (
    vote_id INT PRIMARY KEY,
    voter_id INT,
    station_id INT,
    vote_date DATE,
    FOREIGN KEY (voter_id) REFERENCES voters(voter_id),
    FOREIGN KEY (station_id) REFERENCES polling_stations(station_id)
);
SELECT*FROM voting_records;

CREATE TABLE fraud_flags (
    voter_id INT,
    duplicate_aadhaar_flag INT,
    multi_state_flag INT,
    multiple_votes_flag INT,
    suspicious_score INT,
    PRIMARY KEY (voter_id),
    FOREIGN KEY (voter_id) REFERENCES voters(voter_id)
);
SELECT*FROM fraud_flags;

