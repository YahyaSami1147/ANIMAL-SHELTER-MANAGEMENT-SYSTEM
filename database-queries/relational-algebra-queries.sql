Relational Algebra Queries
1.	Find all animals in the shelter (Animals table):
           π(animalID, name, species, age)(Animals)
2.	List all dog breeds in the shelter:
          π(breed)(Dogs)
3.	List all adopter names:
          π(name)(Adopters)
4.	Find all adoption requests that are still pending:
          σ(status = 'Pending')(AdoptionRequests)
5.	List the names and ages of all animals that are 5 years or older:
          π(name, age)(σ(age >= 5)(Animals))
6.	Find all animals that are cats (only from the Cats table):
          π(animalID, name, breed, color)(Cats)
7.	Find all animals adopted by a specific adopter (e.g., Adopter with ID 1):
          π(animalID, adopterName)(σ(adopterID = 1)(AdoptionRequests))
8.	Find all animals requested for adoption and the status of the request:
          π(animalID, status)(AdoptionRequests)
9.	List all adoption requests for dogs (only from the AdoptionRequests for animals marked as dogs):
          π(requestID, adopterName, animalType)(σ(animalType =   'Dog')(AdoptionRequests))
10.	List the names of adopters who have previously owned pets:
          π(name)(σ(previousPets IS NOT NULL)(Adopters))
11.	Find adopters who have requested a specific animal (e.g., Animal with ID 3):
          π(adopterName)(σ(animalID = 3)(AdoptionRequests))
12.	Find all shelter employees who have processed adoption requests:
           π(name)(ShelterEmployees ⨝ AdoptionRequests)
13.	Find all animals that have a pending adoption request:
          π(animalID, name)(Animals ⨝ σ(status = 'Pending')(AdoptionRequests))
14.	List all adopters who have requested both dogs and cats:
          π(adopterID)(AdoptionRequests ⨝ animalType = 'Dog') ∩          π(adopterID)(AdoptionRequests ⨝ animalType = 'Cat')
15.	Find all animals that have been adopted (status is approved):
          π(animalID, name)(Animals ⨝ σ(status = 'Approved')(AdoptionRequests))
16.	Find the number of animals in the shelter:
          ρ(animalsCount)(π(animalID)(Animals))
17.	List the breed and size of all dogs (from the Dogs table):
          π(breed, size)(Dogs)
18.	Find the names of employees who have handled adoption requests for animals with a specific breed (e.g., 'Golden Retriever'):
          π(name)(ShelterEmployees ⨝ (σ(breed = 'Golden Retriever')(Dogs) ⨝ AdoptionRequests))
19.	List all animals and their corresponding adoption request status:
          π(animalID, status)(Animals ⨝ AdoptionRequests)
20.	List all animals in the shelter that have been adopted by a specific adopter (e.g., Adopter with ID 2):
          π(animalID, name)(Animals ⨝ σ(adopterID = 2)(AdoptionRequests))

