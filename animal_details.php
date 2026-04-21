<?php
include 'db.php';

$animalID = $_GET['id'];

// Check if the animal is a dog or a cat
$checkQuery = "
    SELECT 'Dog' AS type 
    FROM Dogs WHERE animalID = $animalID
    UNION
    SELECT 'Cat' AS type 
    FROM Cats WHERE animalID = $animalID
    LIMIT 1;
";
$typeResult = mysqli_query($conn, $checkQuery);
$typeRow = mysqli_fetch_assoc($typeResult);
$animalType = $typeRow['type'];

if ($animalType === 'Dog') {
    // Join Dogs and Animals for Dog details
    $query = "
        SELECT a.name, d.breed, d.size, d.groomingNeeds, d.temperament 
        FROM Dogs d
        JOIN Animals a ON d.animalID = a.animalID
        WHERE a.animalID = $animalID;
    ";
} elseif ($animalType === 'Cat') {
    // Join Cats and Animals for Cat details
    $query = "
        SELECT a.name, c.breed, c.color, c.personalityTraits, c.groomingNeeds 
        FROM Cats c
        JOIN Animals a ON c.animalID = a.animalID
        WHERE a.animalID = $animalID;
    ";
} else {
    die("Animal not found or does not belong to a known species.");
}

$result = mysqli_query($conn, $query);
$animal = mysqli_fetch_assoc($result);

if (!$animal) {
    die("Animal details not found.");
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><?php echo $animal['name']; ?> Details</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-image: url('assets/images/aa.webp');
            background-size: cover;
            background-attachment: fixed;
            background-position: center;
            color: white;
            margin: 0;
            padding: 0;
        }

        h2 {
            text-align: center;
            margin-top: 20px;
            color: #4CAF50;
        }

        .details {
            width: 80%;
            margin: 20px auto;
            padding: 20px;
            background-color: rgba(255, 255, 255, 0.7); /* Semi-transparent background */
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }

        .details p {
            font-size: 1.2em;
            margin: 10px 0;
            color: #333;
        }

        a {
            display: inline-block;
            margin-top: 20px;
            padding: 10px 20px;
            background-color: #4CAF50;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            font-weight: bold;
            transition: background-color 0.3s ease;
        }

        a:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <h2><?php echo $animal['name']; ?></h2>
    <div class="details">
        <p>Breed: <?php echo $animal['breed']; ?></p>
        <?php if ($animalType === 'Dog'): ?>
            <p>Size: <?php echo $animal['size']; ?></p>
            <p>Grooming Needs: <?php echo $animal['groomingNeeds']; ?></p>
            <p>Temperament: <?php echo $animal['temperament']; ?></p>
        <?php elseif ($animalType === 'Cat'): ?>
            <p>Color: <?php echo $animal['color']; ?></p>
            <p>Personality Traits: <?php echo $animal['personalityTraits']; ?></p>
            <p>Grooming Needs: <?php echo $animal['groomingNeeds']; ?></p>
        <?php endif; ?>
        <a href="make_adoption_request.php?id=<?php echo $animalID; ?>">Adopt This Animal</a>
        <a href="view_animals.php">Go Back to Animals</a>
    </div>
</body>
</html>
