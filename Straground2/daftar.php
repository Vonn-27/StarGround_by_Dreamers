<?php
// Koneksi ke database
include 'dbconnect.php';
$conn = dbConnect();

// Fungsi untuk membersihkan data input
function test_input($data) {
    $data = trim($data);
    $data = stripslashes($data);
    $data = htmlspecialchars($data);
    return $data;
}

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $name = test_input($_POST["nama_pengguna"]);
    $email = test_input($_POST["email"]);
    $password = md5(test_input($_POST["kata_sandi"]));
    $registration_date = date('Y-m-d');
    $role = 'user';

    $sql = "INSERT INTO users (name, password, registration_date, role) VALUES ('$name', '$password', '$registration_date', '$role')";

    if ($conn->query($sql) === TRUE) {
        header("Location: login.php");
    } else {
        echo "Error: " . $sql . "<br>" . $conn->error;
    }
    
    $conn->close();
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Stra Ground - Buat Akun</title>
    <link rel="stylesheet" href="daftar.css">
</head>
<body>
    <div class="container">
        <div class="logo">
            <img src="gambar/logo.png" alt="Logo">
            <h1>Stra Ground</h1>
            <p>Buat akun</p>
        </div>
        <form method="post" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]);?>">
            <input type="text" name="nama_pengguna" placeholder="Nama Pengguna" required>
            <input type="email" name="email" placeholder="Email" required>
            <input type="password" name="kata_sandi" placeholder="Kata Sandi" required>
            <button type="submit">Daftar</button>
        </form>
    </div>
</body>
</html>
