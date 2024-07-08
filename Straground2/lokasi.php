<?php
include 'dbconnect.php';
$conn = dbConnect();

// Ambil semua data map dari database
$query = "SELECT * FROM map";
$result = mysqli_query($conn, $query);

if (!$result) {
    die("Query Error: " . mysqli_error($conn));
}

// Ambil data map berdasarkan id (default id = 1)
$map_id = isset($_GET['id']) ? intval($_GET['id']) : 1;
$query_map = "SELECT * FROM map WHERE id = $map_id";
$result_map = mysqli_query($conn, $query_map);

if (!$result_map) {
    die("Query Error: " . mysqli_error($conn));
}

$map = mysqli_fetch_assoc($result_map);
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Stra Ground</title>
    <link rel="stylesheet" href="lokasi.css">

    <!-- fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link href="https://fonts.googleapis.com/css2?family=Aldrich&display=swap" rel="stylesheet" />
</head>
<body>
    <div class="container">
        <header>
        <a class="logo" href="awal.html"">
                
                <img src="gambar/logo.png" alt="Logo">
                <h1>Stra Ground</h1>
            </a>
            <nav>
                <a href="dashboard_user.php">Dashboard</a>
                <a href="senjata.php">Senjata</a>
                <a href="lokasi.php">Lokasi</a>
                <a href="kondisi.html">Kondisi</a>
                <a href="strategi.html">Strategi</a>
            </nav>
        </header>
        <main>
            <div class="sidebar">
                <a href="#">LOKASI</a>
                <?php while ($row = mysqli_fetch_assoc($result)): ?>
                    <a href="?id=<?php echo $row['id']; ?>"><?php echo $row['nama']; ?></a>
                <?php endwhile; ?>
            </div>
            <div class="content">
                <div class="map-container">
                    <?php if ($map): ?>
                        <h2><?php echo $map['nama']; ?></h2>
                        <img src="gambar/<?php echo $map['gambar']; ?>" alt="<?php echo $map['nama']; ?> Map">
                        <div class="map-description">
                            <p><?php echo $map['deskripsi']; ?></p>
                        </div>
                    <?php else: ?>
                        <h2>Map Not Found</h2>
                        <p>The map you are looking for does not exist.</p>
                    <?php endif; ?>
                </div>
            </div>
        </main>
    </div>
</body>
</html>
