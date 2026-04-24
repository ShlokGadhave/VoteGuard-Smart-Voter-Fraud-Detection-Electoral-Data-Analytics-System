USE voteguard;
-- Identify voters with missing phone numbers or email IDs.
SELECT*
FROM voters 
WHERE phone_number and email IS NULL;

-- Detect records where age does not match date of birth.
SELECT *
FROM voters
WHERE age <> TIMESTAMPDIFF(YEAR, date_of_birth, CURDATE());

-- Find invalid Aadhaar numbers (not 12 digits or null).
SELECT * FROM voters
WHERE aadhaar_number IS NULL 
OR  LENGTH(TRIM(aadhaar_number)) <> 12 ;

-- Identify duplicate voter records based on Aadhaar number.
SELECT aadhaar_number, COUNT(*) AS count
FROM voters
GROUP BY aadhaar_number
HAVING COUNT(*) > 1;

