<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Stra Ground - Dashboard</title>
    <link rel="stylesheet" href="dashboard_admin_map.css">

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
                <a href="#">DASHBOARD</a>
                <a href="dashboard_admin_senjata.php">SENJATA</a>
                <a href="#">MAPS</a>
            </div>
            <div class="content">
                <button onclick="window.location.href='tambah_map.php'" class="btn-add">Tambah Map</button>
                <table>
                    <thead>
                        <tr>
                            <th>Nama Map</th>
                            <th>Deskripsi</th>
                            <th>Foto</th>
                            <th>Aksi</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php
                        include 'dbConnect.php';
                        $conn = dbConnect();

                        // Ambil data map dari database
                        $sql = "SELECT id, nama, deskripsi, gambar FROM map";
                        $result = $conn->query($sql);

                        if ($result->num_rows > 0) {
                            // Output data untuk setiap baris
                            while($row = $result->fetch_assoc()) {
                                ?>
                                <tr>
                                    <td><?php echo $row["nama"]; ?></td>
                                    <td><?php echo $row["deskripsi"]; ?></td>
                                    <td><img src="gambar/<?php echo $row["gambar"]; ?>" alt="<?php echo $row["nama"]; ?>" width="100"></td>
                                    <td>
                                        <form method="GET" action="editM.php" style="display:inline;">
                                            <input type="hidden" name="id" value="<?php echo $row["id"]; ?>">
                                            <button type="submit" class="btn-edit">Edit</button>
                                        </form>
                                        <form method="POST" action="hapus_map.php" style="display:inline;">
                                            <input type="hidden" name="id" value="<?php echo $row["id"]; ?>">
                                            <button type="submit" class="btn-delete" onclick="return confirm('Apakah Anda yakin ingin menghapus <?php echo $row["nama"]; ?>?')">Hapus</button>
                                        </form>
                                    </td>
                                </tr>
                                <?php
                            }
                        } else {
                            ?>
                            <tr><td colspan="4">Tidak ada data</td></tr>
                            <?php
                        }

                        $conn->close();
                        ?>
                    </tbody>
                </table>
            </div>
        </main>
    </div>
</body>
</html>
