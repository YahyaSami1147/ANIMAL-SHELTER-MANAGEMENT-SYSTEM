<?php
session_start();
if (!isset($_SESSION['username'])) {
    header("Location: login.php");
    exit();
}

?>




<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Animal Shelter</title>
    <link rel="stylesheet" href="index.css">
</head>
<body>
    <header>
        <h1>Welcome to Animal Shelter</h1>
        <p>Where Love and Compassion Meet</p>
        <nav>
            <ul>
                <li><a href="view_animals.php">View Animals</a></li>
                <li><a href="#about">About Us</a></li>
                <li><a href="#contact">Contact</a></li>
            </ul>
        </nav>
    </header>
        
    

    <section class="intro">
        <p>At our Animal Shelter, we believe every animal deserves a loving home. Explore, adopt, and make a difference in the lives of pets who need it the most.</p>
    </section>

    <section id="about" class="about">
        <h2>About Us</h2>
        <p>We are a nonprofit organization dedicated to rescuing, rehabilitating, and rehoming animals in need. Our mission is to provide every animal with the care and compassion they deserve.</p>
    </section>

    <section id="contact" class="contact">
        <h2>Contact Us</h2>
        <p>Have questions? Reach out to us at <a href="mailto:info@animalshelter.com">info@animalshelter.com</a></p>
    </section>

    <div><a href="logout.php" class="logout-button">Logout</a></div>

    <footer>
        <p>&copy; 2025 Animal Shelter. All Rights Reserved.</p>
    </footer>
</body>
</html>
