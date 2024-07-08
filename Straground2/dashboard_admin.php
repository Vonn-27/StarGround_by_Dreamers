<?php
include 'dbconnect.php';
$conn = dbConnect();

// Mengambil data pendaftaran per bulan
$sql = "SELECT DATE_FORMAT(registration_date, '%Y-%m') as month, COUNT(*) as count FROM users GROUP BY month";
$result = $conn->query($sql);

$months = [];
$counts = [];
while($row = $result->fetch_assoc()) {
    $months[] = $row['month'];
    $counts[] = $row['count'];
}

$conn->close();
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Stra Ground - Dashboard</title>
    <link rel="stylesheet" href="dashboard_admin.css">
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

    <!-- fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link href="https://fonts.googleapis.com/css2?family=Aldrich&display=swap" rel="stylesheet" />
</head>
<body>
    <div class="container">
        <header>
            <div class="logo">
                <img src="gambar/logo.png" alt="Logo">
                <h1>Stra Ground</h1>
            </div>
            
        </header>
        <main>
            <div class="sidebar">
                <a href="#"> DASHBOARD</a>
                <a href="dashboard_admin_senjata.php"> SENJATA</a>
                <a href="dashboard_admin_map.php"> MAPS</a>
            </div>
            <div class="content">
                <canvas id="lineChart" width="800" height="400"></canvas>
                <div class="stats">
                    <p>Active Percentage</p>
                    <h2>594 Total</h2>
                    <div class="bar">
                        <div class="online" style="width: 30%;"></div>
                        <div class="offline" style="width: 70%;"></div>
                    </div>
                    <p>Online: 179 users</p>
                    <p>Offline: 394 users</p>
                </div>
            </div>
        </main>
    </div>
    <script>
        document.addEventListener("DOMContentLoaded", function() {
            var ctx = document.getElementById('lineChart').getContext('2d');
            var lineChart = new Chart(ctx, {
                type: 'line',
                data: {
                    labels: <?php echo json_encode($months); ?>,
                    datasets: [{
                        label: 'Registrations per Month',
                        data: <?php echo json_encode($counts); ?>,
                        borderColor: '#007bff',
                        backgroundColor: 'rgba(0, 123, 255, 0.1)',
                        fill: true,
                        tension: 0.4
                    }]
                },
                options: {
                    responsive: true,
                    scales: {
                        x: {
                            title: {
                                display: true,
                                text: 'Month'
                            }
                        },
                        y: {
                            title: {
                                display: true,
                                text: 'Registrations'
                            },
                            beginAtZero: true
                        }
                    },
                    plugins: {
                        legend: {
                            display: false
                        },
                        tooltip: {
                            callbacks: {
                                label: function(context) {
                                    return ' ' + context.parsed.y + ' registrations';
                                }
                            }
                        }
                    }
                }
            });
        });
    </script>
</body>
</html>
