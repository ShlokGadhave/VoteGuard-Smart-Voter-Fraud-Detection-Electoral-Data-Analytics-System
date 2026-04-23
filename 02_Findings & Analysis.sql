USE voteguard;
-- Identify records where Aadhaar number is duplicated and return the full voter profiles
SELECT *
FROM voters
WHERE aadhaar_number IN (
    SELECT aadhaar_number
    FROM voters
    GROUP BY aadhaar_number
    HAVING COUNT(*) > 1
)
ORDER BY aadhaar_number;

-- What is the total number of registered voters in the database?
SELECT*FROM voters;

-- How many voters are there in each state and district?
SELECT state,district,count(voter_id)  as `Total Voters` FROM voters Group By state,district;

-- What is the total number of votes cast in the system?
SELECT count(vote_id) as `Count Voters`FROM voting_records;

-- How many polling stations exist per constituency?
SELECT count(constituency_id) as `Total Number Constituencies` ,constituency_name FROM constituencies Group By constituency_name ;

-- What is the distribution of voters by gender?
SELECT count(voter_id) `Number Of Voters`,gender FROM voters Group By gender;
