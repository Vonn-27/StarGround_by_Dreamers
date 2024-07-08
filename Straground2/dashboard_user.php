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

// Fetch data for the selected weapon
$senjataData = $resultSenjata->fetch_assoc();
$senjataName = $senjataData['nama'];
$digunakan = $senjataData['digunakan'];
$tidakDigunakan = $senjataData['tidak_digunakan'];

$conn->close();
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Stra Ground - Senjata</title>
    <link rel="stylesheet" href="dashboard_user.css">
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

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
                <a href="dashboard_user.html">Dashboard</a>
                <a href="senjata.php">Senjata</a>
                <a href="lokasi.php">Lokasi</a>
                <a href="kondisi.html">Kondisi</a>
                <a href="strategi.html">Strategi</a>
            </nav>
        </header>
        <main>
            <div class="sidebar">
                <div class="kategori">
                    <h4>KATEGORI</h4>
                </div>
                <?php while($row = $resultKategori->fetch_assoc()): ?>
                    <a href="?kategori=<?= $row['id'] ?>"><?= $row['nama'] ?></a>
                <?php endwhile; ?>
            </div>
            <div class="content">
                <div class="chart">
                    <canvas id="usageChart" width="200" height="200"></canvas>
                </div>
                <?php if ($senjataData): ?>
                    <div class="weapon-info">
                        <img src="gambar/<?= $senjataData['gambar'] ?>" alt="<?= $senjataName ?>" class="weapon-image">
                    </div>
                    <div class="description">
                        <p><?= $senjataData['deskripsi'] ?></p>
                    </div>
                    <div class="navigation">
                        <form method="GET">
                            <input type="hidden" name="kategori" value="<?= $idkategori ?>">
                            <input type="hidden" name="page" value="<?= max(0, $page - 1) ?>">
                            <button type="submit" class="nav-button" <?= $page <= 0 ? 'disabled' : '' ?>>&lt; Previous</button>
                        </form>
                        <form method="GET">
                            <input type="hidden" name="kategori" value="<?= $idkategori ?>">
                            <input type="hidden" name="page" value="<?= min($totalSenjata - 1, $page + 1) ?>">
                            <button type="submit" class="nav-button" <?= $page >= $totalSenjata - 1 ? 'disabled' : '' ?>>Next &gt;</button>
                        </form>
                    </div>
                <?php else: ?>
                    <p>Tidak ada senjata di kategori ini.</p>
                <?php endif; ?>
            </div>
        </main>
    </div>
    <script>
        var ctx = document.getElementById('usageChart').getContext('2d');
        var usageChart = new Chart(ctx, {
            type: 'doughnut',
            data: {
                labels: ['Digunakan', 'Tidak Digunakan'],
                datasets: [{
                    label: 'Penggunaan',
                    data: [<?= $digunakan ?>, <?= $tidakDigunakan ?>],
                    backgroundColor: ['#007bff', '#dc3545'],
                    hoverOffset: 4
                }]
            },
            options: {
                responsive: false, /* Ensure the chart is not responsive */
                plugins: {
                    legend: {
                        position: 'top',
                    },
                    tooltip: {
                        callbacks: {
                            label: function(context) {
                                var label = context.label || '';
                                if (label) {
                                    label += ': ';
                                }
                                if (context.parsed !== null) {
                                    label += context.parsed + ' kali';
                                }
                                return label;
                            }
                        }
                    }
                }
            }
        });
    </script>
</body>
</html>
