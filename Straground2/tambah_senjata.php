<?php
include 'dbconnect.php';
$conn = dbConnect();

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $nama = $_POST['nama'];
    $deskripsi = $_POST['deskripsi'];
    $id_kategori = $_POST['id_kategori'];

    $target_dir = "gambar/";
    $target_file1 = $target_dir . basename($_FILES["foto1"]["name"]);
    $uploadOk = 1;
    $errorMessage = "";

    // Cek apakah file gambar valid
    $check = getimagesize($_FILES["foto1"]["tmp_name"]);
    if ($check !== false) {
        $uploadOk = 1;
    } else {
        $errorMessage .= "File bukan gambar. ";
        $uploadOk = 0;
    }

    // Cek apakah file sudah ada
    if (file_exists($target_file1)) {
        $errorMessage .= "Maaf, file sudah ada. ";
        $uploadOk = 0;
    }

    // Batasi jenis file yang diizinkan
    $imageFileType1 = strtolower(pathinfo($target_file1, PATHINFO_EXTENSION));
    if ($imageFileType1 != "jpg" && $imageFileType1 != "png" && $imageFileType1 != "jpeg" && $imageFileType1 != "gif") {
        $errorMessage .= "Maaf, hanya file JPG, JPEG, PNG & GIF yang diizinkan. ";
        $uploadOk = 0;
    }

    // Cek apakah $uploadOk bernilai 0 karena ada kesalahan
    if ($uploadOk == 0) {
        $errorMessage .= "Maaf, file tidak diunggah.";
        echo $errorMessage;
    } else {
        // Jika semuanya baik, coba unggah file
        if (move_uploaded_file($_FILES["foto1"]["tmp_name"], $target_file1)) {
            $foto1 = $_FILES['foto1']['name'];
            $query = "INSERT INTO senjata (nama, deskripsi, idkategori, gambar) VALUES ('$nama', '$deskripsi', $id_kategori, '$foto1')";

            if (mysqli_query($conn, $query)) {
                header('Location: dashboard_admin_senjata.php');
                exit();
            } else {
                echo 'Error: ' . mysqli_error($conn);
            }
        } else {
            $errorMessage .= "Maaf, terjadi kesalahan saat mengunggah file.";
            echo $errorMessage;
        }
    }
}

$query_kategori = "SELECT * FROM kategori";
$result_kategori = mysqli_query($conn, $query_kategori);
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tambah Senjata</title>
    <link rel="stylesheet" href="tambah_senjata.css">

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
            <nav>
                <a href="dashboard_admin.html">Dashboard</a>
                <a href="senjata.php">Senjata</a>
                <a href="#">Lokasi</a>
                <a href="#">Kondisi</a>
                <a href="#">Strategi</a>
            </nav>
        </header>
        <main>
            <div class="sidebar">
                <a href="index.php">DASHBOARD</a>
                <a href="dashboard_admin_senjata.php">SENJATA</a>
                <a href="#">MAPS</a>
            </div>
            <div class="content">
                <h2>Tambah Senjata</h2>
                <form method="post" enctype="multipart/form-data" onsubmit="return validateForm()">
                    <div class="form-group">
                        <label for="nama">Nama Senjata</label>
                        <input type="text" class="form-control" name="nama" id="nama" required>
                    </div>
                    <div class="form-group">
                        <label for="deskripsi">Deskripsi</label>
                        <textarea class="form-control" name="deskripsi" id="deskripsi"></textarea>
                    </div>
                    <div class="form-group">
                        <label for="id_kategori">Kategori</label>
                        <select class="form-control" name="id_kategori" id="id_kategori" required>
                            <?php while ($row_kategori = mysqli_fetch_assoc($result_kategori)) : ?>
                                <option value="<?= $row_kategori['id']; ?>"><?= $row_kategori['nama']; ?></option>
                            <?php endwhile; ?>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="foto1">Foto 1</label>
                        <input type="file" class="form-control-file" name="foto1" id="foto1" accept="image/*" required>
                    </div>
                    <button type="submit" class="btn btn-primary">Submit Data</button>
                </form>
            </div>
        </main>
    </div>

    <script src="https://cdn.ckeditor.com/ckeditor5/40.1.0/classic/ckeditor.js"></script>
    <script>
        let editor;
        ClassicEditor
            .create(document.querySelector('#deskripsi'), {
                toolbar: [ 'heading', '|', 'bold', 'italic', 'link', 'bulletedList', 'numberedList', 'blockQuote' ],
                heading: {
                    options: [
                        { model: 'paragraph', title: 'Paragraph', class: 'ck-heading_paragraph' },
                        { model: 'heading1', view: 'h1', title: 'Heading 1', class: 'ck-heading_heading1' },
                        { model: 'heading2', view: 'h2', title: 'Heading 2', class: 'ck-heading_heading2' },
                        { model: 'heading3', view: 'h3', title: 'Heading 3', class: 'ck-heading_heading3' }
                    ]
                }
            })
            .then(newEditor => {
                editor = newEditor;
            })
            .catch(error => {
                console.error(error);
            });

        function validateForm() {
            // Update the textarea with the editor data
            const deskripsi = document.querySelector('#deskripsi');
            deskripsi.value = editor.getData();

            // Ensure the deskripsi field is not empty
            if (deskripsi.value.trim() === '') {
                alert('Deskripsi tidak boleh kosong.');
                return false;
            }

            return true;
        }
    </script>
</body>
</html>
