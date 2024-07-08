<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Stra Ground - Dashboard</title>
    <link rel="stylesheet" href="dashboard_admin_senjata.css">

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
                <a href="dashboard_admin.php">DASHBOARD</a>
                <a href="#">SENJATA</a>
                <a href="dashboard_admin_map.php">MAPS</a>
            </div>
            <div class="content">
                <button onclick="window.location.href='tambah_senjata.php'" class="btn-add">Tambah Senjata</button>
                <table>
                    <thead>
                        <tr>
                            <th>Nama Senjata</th>
                            <th>Deskripsi</th>
                            <th>Foto</th>
                            <th>Kategori</th>
                            <th>Aksi</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php
                        include 'dbConnect.php';
                        $conn = dbConnect();

                        // Ambil data senjata dari database dengan join ke tabel kategori
                        $sql = "SELECT senjata.id, senjata.nama, senjata.deskripsi, senjata.gambar, kategori.nama AS kategori 
                                FROM senjata 
                                LEFT JOIN kategori ON senjata.idkategori = kategori.id";
                        $result = $conn->query($sql);

                        if ($result->num_rows > 0) {
                            // Output data untuk setiap baris
                            while($row = $result->fetch_assoc()) {
                                ?>
                                <tr>
                                    <td><?php echo $row["nama"]; ?></td>
                                    <td><?php echo $row["deskripsi"]; ?></td>
                                    <td><img src="gambar/<?php echo $row["gambar"]; ?>" alt="<?php echo $row["nama"]; ?>" width="100"></td>
                                    <td><?php echo $row["kategori"]; ?></td>
                                    <td>
                                        <form method="GET" action="editS.php" style="display:inline;">
                                            <input type="hidden" name="id" value="<?php echo $row["id"]; ?>">
                                            <button type="submit" class="btn-edit">Edit</button>
                                        </form>
                                        <form method="POST" action="hapus_senjata.php" style="display:inline;">
                                            <input type="hidden" name="id" value="<?php echo $row["id"]; ?>">
                                            <button type="submit" class="btn-delete" onclick="return confirm('Apakah Anda yakin ingin menghapus <?php echo $row["nama"]; ?>?')">Hapus</button>
                                        </form>
                                    </td>
                                </tr>
                                <?php
                            }
                        } else {
                            ?>
                            <tr><td colspan="5">Tidak ada data</td></tr>
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
