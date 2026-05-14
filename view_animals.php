<?php
include 'db.php';

$query = "SELECT * FROM Animals";
$result = mysqli_query($conn, $query);
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Available Animals</title>
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

        table {
            width: 80%;
            margin: 20px auto;
            border-collapse: collapse;
            background-color: rgba(255, 255, 255, 0.7);  /* Semi-transparent white background */
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }

        th, td {
            padding: 12px 15px;
            text-align: left;
            border: 1px solid #ddd;
        }

        th {
            background-color: #4CAF50;
            color: white;
        }
        td {
            color: black;
        }

        tr:nth-child(even) {
            background-color: rgba(255, 255, 255, 0.2);  /* Light gray semi-transparent */
        }

        tr:hover {
            background-color: rgba(255, 255, 255, 0.6);  /* Slightly darker hover effect */
        }

        a {
            text-decoration: none;
            color: #4CAF50;
            font-weight: bold;
            transition: color 0.3s ease;
        }

        a:hover {
            color: #333;
        }

        .container {
            padding: 20px;
            text-align: center;
        }

        .container a {
            padding: 10px 20px;
            background-color: #4CAF50;
            color: white;
            border-radius: 5px;
            text-decoration: none;
            margin-top: 20px;
            display: inline-block;
            transition: background-color 0.3s ease;
        }

        .container a:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <h2>Animals for Adoption</h2>
    <table>
        <tr>
            <th>Name</th>
            <th>Species</th>
            <th>Age</th>
            <th>Medical History</th>
            <th>Dietary Requirements</th>
            <th>Actions</th>
        </tr>
        <?php while ($row = mysqli_fetch_assoc($result)): ?>
        <tr>
            <td><?php echo $row['name']; ?></td>
            <td><?php echo $row['species']; ?></td>
            <td><?php echo $row['age']; ?></td>
            <td><?php echo $row['medicalHistory']; ?></td>
            <td><?php echo $row['dietaryRequirements']; ?></td>
            <td><a href="animal_details.php?id=<?php echo $row['animalID']; ?>">View Details</a></td>
        </tr>
        <?php endwhile; ?>
    </table>
    <div class="container">
        <a href="index.php">Go Back to Homepage</a>
    </div>
</body>
</html>
