<?php
session_start();
include 'db.php';
$successMessage = ''; // Variable to store success message
$errorMessage = '';   // Variable to store error message

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $username = $_POST['username'];
    $password = password_hash($_POST['password'], PASSWORD_DEFAULT);
    $name = $_POST['name'];
    $contactInformation = $_POST['contactInformation'];
    $address = $_POST['address'];
    $employmentStatus = $_POST['employmentStatus'];
    $previousPets = $_POST['previousPets'];

    // Insert into Adopters (auto-incremented adopterID)
    $stmt = $conn->prepare("INSERT INTO Adopters (name, contactInformation, address, employmentStatus, previousPets) VALUES (?, ?, ?, ?, ?)");
    $stmt->bind_param("sssss", $name, $contactInformation, $address, $employmentStatus, $previousPets);
    if ($stmt->execute()) {
        $adopterID = $stmt->insert_id; // Get the newly inserted adopterID
    } else {
        $errorMessage = "Error creating adopter: " . $stmt->error;
    }

    // Now insert into AdopterLogin
    $stmt = $conn->prepare("INSERT INTO AdopterLogin (adopterID, username, password) VALUES (?, ?, ?)");
    $stmt->bind_param("iss", $adopterID, $username, $password);

    if ($stmt->execute()) {
        $successMessage .= " User registered successfully!";
    } else {
        $errorMessage = "Error: " . $stmt->error;
    }
    $stmt->close();
}
?>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register Page</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <link rel="stylesheet" href="register.css">
    
</head>
<body>
    <div class="login-container">
        <h2>Register</h2>

        <?php if ($successMessage): ?>
            <div class="success-message"><?= $successMessage ?></div>
        <?php elseif ($errorMessage): ?>
            <div class="error-message"><?= $errorMessage ?></div>
        <?php endif; ?>

        <form method="POST">
        
            <div class="input-group">
                <i class="fas fa-user"></i>
                <input type="text" name="username" placeholder="Username" required>
            </div>
            <div class="input-group">
                <i class="fas fa-lock"></i>
                <input type="password" name="password" placeholder="Password" required>
            </div>
            <div class="input-group">
                <i class="fas fa-lock"></i>
                <input type="text" name="name" placeholder="Name" required>
            </div>
            <div class="input-group">
                <i class="fas fa-lock"></i>
                <input type="text" name="contactInformation" placeholder="Contact Information" required>
            </div>
            <div class="input-group">
                <i class="fas fa-lock"></i>
                <textarea name="address" placeholder="Address" required></textarea>
            </div>
            <div class="input-group">
                <i class="fas fa-lock"></i>
                <input type="text" name="employmentStatus" placeholder="Employment Status" required>
            </div>
            <div class="input-group">
                <i class="fas fa-lock"></i>
                <input type="text" name="previousPets" placeholder="Previous Pets" required>
            </div>
            <button class="login-btn" type="submit">Register</button>
        </form>
        <div class="register-link">
            <p>Already have an account? <a href="login.php">Login here</a></p>
        </div>
    </div>
</body>
</html>
