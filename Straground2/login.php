<?php
include 'dbconnect.php';
$conn = dbConnect();

// Fungsi untuk membersihkan data input
function test_input($data) {
    $data = trim($data);
    $data = stripslashes($data);
    $data = htmlspecialchars($data);
    return $data;
}

session_start();

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $username = test_input($_POST["username"]);
    $password = md5(test_input($_POST["password"]));

    $sql = "SELECT * FROM users WHERE name='$username' AND password='$password'";
    $result = $conn->query($sql);

    if ($result->num_rows > 0) {
        // Menyimpan informasi pengguna ke sesi
        $row = $result->fetch_assoc();
        $_SESSION['user_id'] = $row['id'];
        $_SESSION['user_role'] = $row['role'];

        // Mengarahkan pengguna berdasarkan peran
        if ($row['role'] == 'admin') {
            header("Location: dashboard_admin.php");
        } else {
            header("Location: dashboard_user.php");
        }
        exit();
    } else {
        echo "Username atau password salah!";
    }

    $conn->close();
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Masuk ke StraGround</title>
    <link rel="stylesheet" href="login.css">
    
    <!-- fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link href="https://fonts.googleapis.com/css2?family=Aldrich&display=swap" rel="stylesheet" />


</head>
<body>
    <div class="container">
        <div class="login-box">
            <div class="logo">
                <img src="gambar/logo.png" alt="Logo">
                <h1>Stra Ground</h1>
            </div>
            <h2>Masuk ke StraGround</h2>
            <div class="user-icon">
                <img src="gambar/login.png" alt="User Icon">
            </div>
            <form method="post" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]);?>">
                <input type="text" name="username" placeholder="Username" required>
                <input type="password" name="password" placeholder="Password" required>
                <button type="submit">Masuk</button>
            </form>
            <div class="links">
                <a href="#">Lupa Password</a>
                <a href="daftar.php">Daftar ke StraGround</a>
            </div>
        </div>
    </div>
</body>
</html>
