<?php
$host = 'localhost'; // or other host
$dbname = 'your_database_name';
$username = 'your_username';
$password = 'your_password';
$conn = new mysqli($host, $username, $password, $dbname);

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$email = $_POST['email'];
$pass = password_hash($_POST['password'], PASSWORD_DEFAULT); // Encrypt the password
$name = $_POST['name'];

$sql = "INSERT INTO users (Email, Password, Name) VALUES (?, ?, ?)";
$stmt = $conn->prepare($sql);
$stmt->bind_param("sss", $email, $pass, $name);

if ($stmt->execute()) {
    echo "New record created successfully";
} else {
    echo "Error: " . $stmt->error;
}

$stmt->close();
$conn->close();
?>
