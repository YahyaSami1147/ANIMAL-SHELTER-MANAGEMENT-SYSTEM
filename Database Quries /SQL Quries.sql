-- Selection (Filtering data)
-- 1. Select all animals in the shelter:
SELECT * FROM Animals;

-- 2. Select all dogs from the shelter:
SELECT * FROM Dogs;

-- 3. Select adopters who have previously owned pets:
SELECT * FROM Adopters WHERE previousPets IS NOT NULL;

-- 4. Select all animals older than 3 years:
SELECT * FROM Animals WHERE age > 3;

-- 5. Select adoption requests that are still pending:
SELECT * FROM AdoptionRequests WHERE status = 'Pending';

-- Projection (Selecting specific columns)
-- 6. Select only the names and species of all animals:
SELECT name, species FROM Animals;

-- 7. Select adopter names and contact information:
SELECT name, contactInformation FROM Adopters;

-- 8. Select employee names and their roles:
SELECT name, role FROM ShelterEmployees;

-- 9. Select the names and adoption dates of adoption requests:
SELECT adopterName, adoptionDate FROM AdoptionRequests;

-- 10. Select only the breed and size of dogs:
SELECT breed, size FROM Dogs;

-- Joining (Combining data from multiple tables)
-- 11. Join AdoptionRequests with Animals to get information on animals requested for adoption:
SELECT ar.requestID, a.name AS animalName, ar.adopterName, ar.adoptionDate
FROM AdoptionRequests ar
JOIN Animals a ON ar.animalID = a.animalID;

-- 12. Join Adopters with AdoptionRequests to get adopter details along with their requests:
SELECT ad.name AS adopterName, ar.animalType, ar.adoptionDate, ar.status
FROM Adopters ad
JOIN AdoptionRequests ar ON ad.adopterID = ar.adopterID;

-- 13. Join ShelterEmployees with AdoptionRequests to find which employee processed which request:
SELECT se.name AS employeeName, ar.adopterName, ar.animalType, ar.status
FROM ShelterEmployees se
JOIN AdoptionRequests ar ON se.employeeID = ar.employeeID;

-- 14. Join Dogs and Animals to get dog-specific details:
SELECT a.name, d.breed, d.size, d.groomingNeeds
FROM Dogs d
JOIN Animals a ON d.animalID = a.animalID;

-- 15. Join Cats and Animals to get cat-specific details:
SELECT a.name, c.breed, c.color, c.personalityTraits
FROM Cats c
JOIN Animals a ON c.animalID = a.animalID;

-- Aggregation (Summarizing data)
-- 16. Count how many animals are in the shelter:
SELECT COUNT(*) AS totalAnimals FROM Animals;

-- 17. Find the average age of animals in the shelter:
SELECT AVG(age) AS averageAge FROM Animals;

-- 18. Count how many adoption requests are pending:
SELECT COUNT(*) AS pendingRequests FROM AdoptionRequests WHERE status = 'Pending';

-- 19. Find the number of dogs in the shelter:
SELECT COUNT(*) AS totalDogs FROM Dogs;

-- 20. Find the number of cats in the shelter:
SELECT COUNT(*) AS totalCats FROM Cats;

-- Subqueries (Queries within queries)
-- 21. Find adopters who have made at least one adoption request:
SELECT name FROM Adopters
WHERE adopterID IN (SELECT adopterID FROM AdoptionRequests);

-- 22. Find animals that have been requested for adoption but not approved yet:
SELECT * FROM Animals
WHERE animalID IN (SELECT animalID FROM AdoptionRequests WHERE status = 'Pending');

-- 23. Find the employee who has processed the most adoption requests:
SELECT employeeID, COUNT(*) AS requestsProcessed
FROM AdoptionRequests
GROUP BY employeeID
HAVING COUNT(*) = (SELECT MAX(requestsProcessed) FROM
    (SELECT employeeID, COUNT(*) AS requestsProcessed
     FROM AdoptionRequests
     GROUP BY employeeID) AS subquery);

-- 24. Find animals that have been adopted by adopters who have previously owned pets:
SELECT a.name
FROM Animals a
WHERE a.animalID IN
    (SELECT animalID FROM AdoptionRequests WHERE adopterID IN
        (SELECT adopterID FROM Adopters WHERE previousPets IS NOT NULL));

-- 25. Find the most common animal type requested for adoption:
SELECT animalType, COUNT(*) AS requestCount
FROM AdoptionRequests
GROUP BY animalType
ORDER BY requestCount DESC
LIMIT 1;
