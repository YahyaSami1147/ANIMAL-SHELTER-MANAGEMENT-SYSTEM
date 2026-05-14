-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 17, 2025 at 05:23 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `animalshelter`
--

-- --------------------------------------------------------

--
-- Table structure for table `adminlogin`
--

CREATE TABLE `adminlogin` (
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `adminlogin`
--

INSERT INTO `adminlogin` (`username`, `password`, `id`) VALUES
('jeeha123', '$2y$10$YZpz1LIX2rLkB85rty4UbOnQ42k91fMAZ9Ti7WTgstkkRFlI6kJfG', 1),
('Yahya', '$2y$10$BmEw6nirRvMbnwe4xuUIleIYJxExNE7iaRgH3NJ1/9RlKo4OGBs0O', 2);

-- --------------------------------------------------------

--
-- Table structure for table `adopterlogin`
--

CREATE TABLE `adopterlogin` (
  `adopterID` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `adopterlogin`
--

INSERT INTO `adopterlogin` (`adopterID`, `username`, `password`) VALUES
(1, 'jeeha123', '$2y$10$FJylwIeB2iYpoFEsK4Eeau3T2hcaPL85Orki83XfuKYgsTS.RNc0m'),
(2, 'saadimran', '$2y$10$k5C7k29cuwqfZuc.8WcYq.vy1UTY0R1UN9S0U7yqkzM.160Fn3CrW');

-- --------------------------------------------------------

--
-- Table structure for table `adopters`
--

CREATE TABLE `adopters` (
  `adopterID` int(11) NOT NULL,
  `adopterName` varchar(50) NOT NULL,
  `contactInformation` varchar(100) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `employmentStatus` varchar(20) DEFAULT NULL,
  `previousPets` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `adopters`
--

INSERT INTO `adopters` (`adopterID`, `adopterName`, `contactInformation`, `address`, `employmentStatus`, `previousPets`) VALUES
(1, 'Wajeeha Naeem', 'wajeeha@example.com', 'Islamabad , Pakistan', 'Employed', 'Null'),
(2, 'Saad Imran Toori', '03216226321', 'Sihala, ISL, PAK', 'Self - Employeed', 'cat');

-- --------------------------------------------------------

--
-- Table structure for table `adoptionrequests`
--

CREATE TABLE `adoptionrequests` (
  `requestID` int(11) NOT NULL,
  `adopterID` int(11) DEFAULT NULL,
  `employeeID` int(11) DEFAULT NULL,
  `animalID` int(11) DEFAULT NULL,
  `adopterName` varchar(50) DEFAULT NULL,
  `animalType` varchar(20) DEFAULT NULL,
  `adoptionDate` date DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  `approvalDate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `adoptionrequests`
--

INSERT INTO `adoptionrequests` (`requestID`, `adopterID`, `employeeID`, `animalID`, `adopterName`, `animalType`, `adoptionDate`, `status`, `approvalDate`) VALUES
(1, 1, 1, 1, 'Wajeeha Naeem', 'Dog', '2025-01-24', 'Approved', '2025-01-17'),
(2, 2, 1, 8, 'Saad Imran Toori', 'Cat', '2025-01-24', 'Approved', '2025-01-17');

--
-- Triggers `adoptionrequests`
--
DELIMITER $$
CREATE TRIGGER `update_adoption_status` AFTER UPDATE ON `adoptionrequests` FOR EACH ROW BEGIN
    IF NEW.status = 'Approved' THEN
        UPDATE animals
        SET adoptionStatus = 'Adopted'
        WHERE animalID = NEW.animalID;
    END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `animals`
--

CREATE TABLE `animals` (
  `animalID` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `animalType` varchar(20) NOT NULL,
  `age` int(11) DEFAULT NULL,
  `medicalHistory` text DEFAULT NULL,
  `dietaryRequirements` text DEFAULT NULL,
  `adoptionStatus` varchar(20) DEFAULT 'Not Adopted'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `animals`
--

INSERT INTO `animals` (`animalID`, `name`, `animalType`, `age`, `medicalHistory`, `dietaryRequirements`, `adoptionStatus`) VALUES
(1, 'Max', 'Dog', 5, 'Healthy', 'Normal Diet', 'Adopted'),
(2, 'Bella', 'Dog', 3, 'Vaccinated', 'High Protein Diet', 'Not Adopted'),
(3, 'Charlie', 'Dog', 7, 'Hip Dysplasia', 'Low Fat Diet', 'Not Adopted'),
(4, 'Luna', 'Dog', 2, 'Allergic to chicken', 'Grain-Free Diet', 'Not Adopted'),
(5, 'Buddy', 'Dog', 6, 'Fractured leg healed', 'High Protein Diet', 'Not Adopted'),
(6, 'Whiskers', 'Cat', 3, 'Healthy', 'Normal Diet', 'Not Adopted'),
(7, 'Mittens', 'Cat', 4, 'Kidney issues', 'Low Sodium Diet', 'Not Adopted'),
(8, 'Daisy', 'Cat', 2, 'Allergic to dust', 'Vegetarian Diet', 'Adopted'),
(9, 'Shadow', 'Cat', 5, 'Dental issues', 'Soft Diet', 'Not Adopted'),
(10, 'Simba', 'Cat', 6, 'Healthy', 'Normal Diet', 'Not Adopted'),
(11, 'Rocky', 'Dog', 4, 'Recovered from flu', 'Normal Diet', 'Not Adopted'),
(12, 'Milo', 'Cat', 1, 'Vaccinated', 'High Protein Diet', 'Not Adopted'),
(13, 'Oscar', 'Cat', 2, 'Sensitive to cold', 'Special Cat Food', 'Not Adopted'),
(14, 'Bubbles', 'Dog', 8, 'Arthritis', 'Special Senior Diet', 'Not Adopted'),
(15, 'Coco', 'Dog', 9, 'Healthy', 'Normal Diet', 'Not Adopted'),
(16, 'Goldie', 'Cat', 5, 'Eye infection healed', 'Low Carb Diet', 'Not Adopted'),
(17, 'Buddy', 'Dog', 4, 'Healthy', 'Regular Diet', 'Not Adopted'),
(18, 'Lily', 'Cat', 3, 'Allergic to pollen', 'Vegetarian Diet', 'Not Adopted'),
(19, 'Duke', 'Dog', 10, 'Recovered from injury', 'High Protein Diet', 'Not Adopted'),
(20, 'Jasper', 'Cat', 7, 'Obesity', 'Low Calorie Diet', 'Not Adopted'),
(21, 'Kiddo', 'Cat', 2, 'Good Health', 'Normal Diet', 'Not Adopted'),
(22, 'mitto', 'Dog', 2, 'Good Health', 'Normal Diet', 'Not Adopted');

-- --------------------------------------------------------

--
-- Table structure for table `cats`
--

CREATE TABLE `cats` (
  `animalID` int(11) NOT NULL,
  `breed` varchar(30) NOT NULL,
  `color` varchar(20) DEFAULT NULL,
  `vaccinationStatus` varchar(15) DEFAULT NULL,
  `personalityTraits` varchar(50) DEFAULT NULL,
  `groomingNeeds` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cats`
--

INSERT INTO `cats` (`animalID`, `breed`, `color`, `vaccinationStatus`, `personalityTraits`, `groomingNeeds`) VALUES
(6, 'Siamese', 'Gray', 'Vaccinated', 'Curious', 'Monthly grooming'),
(7, 'Persian', 'White', 'Vaccinated', 'Affectionate', 'Daily grooming'),
(8, 'Maine Coon', 'Brown Tabby', 'Vaccinated', 'Gentle', 'Weekly grooming'),
(9, 'Bengal', 'Spotted Brown', 'Vaccinated', 'Playful', 'Occasional grooming'),
(10, 'Russian Blue', 'Blue-Gray', 'Vaccinated', 'Shy', 'Monthly grooming'),
(12, 'Ragdoll', 'Cream and Gray', 'Vaccinated', 'Laid-back', 'Weekly grooming'),
(13, 'Scottish Fold', 'Orange Tabby', 'Vaccinated', 'Curious', 'Monthly grooming'),
(16, 'Abyssinian', 'Ruddy Brown', 'Vaccinated', 'Energetic', 'Occasional grooming'),
(18, 'Birman', 'Seal Point', 'Vaccinated', 'Loving', 'Weekly grooming'),
(20, 'Sphynx', 'Pink', 'Vaccinated', 'Social', 'Regular skin cleaning'),
(21, 'Persian', 'White', 'Vaccinated', 'Gentle', 'Monthly');

-- --------------------------------------------------------

--
-- Table structure for table `dogs`
--

CREATE TABLE `dogs` (
  `animalID` int(11) NOT NULL,
  `breed` varchar(30) NOT NULL,
  `size` varchar(15) DEFAULT NULL,
  `vaccinationStatus` varchar(15) DEFAULT NULL,
  `groomingNeeds` varchar(50) DEFAULT NULL,
  `temperament` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `dogs`
--

INSERT INTO `dogs` (`animalID`, `breed`, `size`, `vaccinationStatus`, `groomingNeeds`, `temperament`) VALUES
(1, 'Labrador', 'Medium', 'Vaccinated', 'Weekly grooming', 'Friendly'),
(2, 'Beagle', 'Medium', 'Vaccinated', 'Weekly grooming', 'Energetic'),
(3, 'Golden Retriever', 'Large', 'Vaccinated', 'Bi-weekly grooming', 'Gentle'),
(4, 'Bulldog', 'Medium', 'Vaccinated', 'Occasional grooming', 'Calm'),
(5, 'German Shepherd', 'Large', 'Vaccinated', 'Bi-weekly grooming', 'Loyal'),
(11, 'Poodle', 'Small', 'Vaccinated', 'Frequent grooming', 'Intelligent'),
(14, 'Rottweiler', 'Large', 'Vaccinated', 'Bi-weekly grooming', 'Confident'),
(15, 'Chihuahua', 'Small', 'Vaccinated', 'Occasional grooming', 'Alert'),
(17, 'Boxer', 'Large', 'Vaccinated', 'Weekly grooming', 'Playful'),
(19, 'Siberian Husky', 'Large', 'Vaccinated', 'Weekly grooming', 'Active'),
(22, 'Libra', 'small', 'Vaccinated', 'Monthly', 'Gentle');

-- --------------------------------------------------------

--
-- Table structure for table `shelteremployees`
--

CREATE TABLE `shelteremployees` (
  `employeeID` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `role` varchar(30) DEFAULT NULL,
  `hireDate` date DEFAULT NULL,
  `contactInformation` varchar(100) DEFAULT NULL,
  `schedule` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `shelteremployees`
--

INSERT INTO `shelteremployees` (`employeeID`, `name`, `role`, `hireDate`, `contactInformation`, `schedule`) VALUES
(1, 'John Doe', 'Veterinarian', '2020-05-10', 'johndoe@email.com', '9 AM - 5 PM'),
(2, 'Jane Smith', 'Adoption Coordinator', '2021-08-15', 'janesmith@email.com', '10 AM - 6 PM');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `adminlogin`
--
ALTER TABLE `adminlogin`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `adopterlogin`
--
ALTER TABLE `adopterlogin`
  ADD PRIMARY KEY (`adopterID`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `unique_adopterID` (`adopterID`);

--
-- Indexes for table `adopters`
--
ALTER TABLE `adopters`
  ADD PRIMARY KEY (`adopterID`),
  ADD UNIQUE KEY `unique_adopterID` (`adopterID`);

--
-- Indexes for table `adoptionrequests`
--
ALTER TABLE `adoptionrequests`
  ADD PRIMARY KEY (`requestID`),
  ADD KEY `adopterID` (`adopterID`),
  ADD KEY `employeeID` (`employeeID`),
  ADD KEY `animalID` (`animalID`);

--
-- Indexes for table `animals`
--
ALTER TABLE `animals`
  ADD PRIMARY KEY (`animalID`);

--
-- Indexes for table `cats`
--
ALTER TABLE `cats`
  ADD PRIMARY KEY (`animalID`);

--
-- Indexes for table `dogs`
--
ALTER TABLE `dogs`
  ADD PRIMARY KEY (`animalID`);

--
-- Indexes for table `shelteremployees`
--
ALTER TABLE `shelteremployees`
  ADD PRIMARY KEY (`employeeID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `adminlogin`
--
ALTER TABLE `adminlogin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `adopterlogin`
--
ALTER TABLE `adopterlogin`
  MODIFY `adopterID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `adopters`
--
ALTER TABLE `adopters`
  MODIFY `adopterID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `adoptionrequests`
--
ALTER TABLE `adoptionrequests`
  MODIFY `requestID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `animals`
--
ALTER TABLE `animals`
  MODIFY `animalID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `adopterlogin`
--
ALTER TABLE `adopterlogin`
  ADD CONSTRAINT `adopterlogin_ibfk_1` FOREIGN KEY (`adopterID`) REFERENCES `adopters` (`adopterID`);

--
-- Constraints for table `adoptionrequests`
--
ALTER TABLE `adoptionrequests`
  ADD CONSTRAINT `adoptionrequests_ibfk_1` FOREIGN KEY (`adopterID`) REFERENCES `adopters` (`adopterID`),
  ADD CONSTRAINT `adoptionrequests_ibfk_2` FOREIGN KEY (`employeeID`) REFERENCES `shelteremployees` (`employeeID`),
  ADD CONSTRAINT `adoptionrequests_ibfk_3` FOREIGN KEY (`animalID`) REFERENCES `animals` (`animalID`);

--
-- Constraints for table `cats`
--
ALTER TABLE `cats`
  ADD CONSTRAINT `cats_ibfk_1` FOREIGN KEY (`animalID`) REFERENCES `animals` (`animalID`);

--
-- Constraints for table `dogs`
--
ALTER TABLE `dogs`
  ADD CONSTRAINT `dogs_ibfk_1` FOREIGN KEY (`animalID`) REFERENCES `animals` (`animalID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
