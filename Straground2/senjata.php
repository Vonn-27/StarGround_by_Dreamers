<?php
include 'dbconnect.php';
$conn = dbConnect();

$idkategori = isset($_GET['kategori']) ? $_GET['kategori'] : 1;
$page = isset($_GET['page']) ? $_GET['page'] : 0;

$sqlKategori = "SELECT * FROM kategori";
$resultKategori = $conn->query($sqlKategori);

$sqlSenjata = "SELECT * FROM senjata WHERE idkategori = $idkategori LIMIT 1 OFFSET $page";
$resultSenjata = $conn->query($sqlSenjata);

$sqlCount = "SELECT COUNT(*) as total FROM senjata WHERE idkategori = $idkategori";
$resultCount = $conn->query($sqlCount);
$totalSenjata = $resultCount->fetch_assoc()['total'];
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Stra Ground</title>
    <link rel="stylesheet" href="senjata.css">

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
                <a href="#">KATEGORI</a>
                <?php while($row = $resultKategori->fetch_assoc()): ?>
                    <a href="?kategori=<?= $row['id'] ?>"><?= $row['nama'] ?></a>
                <?php endwhile; ?>
            </div>
            <div class="content">
                <?php if ($resultSenjata->num_rows > 0): ?>
                    <?php $row = $resultSenjata->fetch_assoc(); ?>
                    <h2><?= $row['nama'] ?></h2>
                    <img src="gambar/<?= $row['gambar'] ?>" alt="<?= $row['nama'] ?>" class="weapon-image">
                    <div class="description">
                        <p><?= $row['deskripsi'] ?></p>
                    </div>
                    <div class="navigation">
                        <form method="GET">
                            <input type="hidden" name="kategori" value="<?= $idkategori ?>">
                            <input type="hidden" name="page" value="<?= max(0, $page - 1) ?>">
                            <button type="submit" <?= $page <= 0 ? 'disabled' : '' ?>>&lt; Previous</button>
                        </form>
                        <form method="GET">
                            <input type="hidden" name="kategori" value="<?= $idkategori ?>">
                            <input type="hidden" name="page" value="<?= min($totalSenjata - 1, $page + 1) ?>">
                            <button type="submit" <?= $page >= $totalSenjata - 1 ? 'disabled' : '' ?>>Next &gt;</button>
                        </form>
                    </div>
                <?php else: ?>
                    <p>Tidak ada senjata di kategori ini.</p>
                <?php endif; ?>
            </div>
        </main>
    </div>
</body>
</html>

<?php
$conn->close();
?>
