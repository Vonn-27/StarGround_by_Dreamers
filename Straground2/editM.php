<?php
include 'dbconnect.php';
$conn = dbConnect();

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $id = isset($_POST['id']) ? $_POST['id'] : null;
    $nama = isset($_POST['nama']) ? $_POST['nama'] : null;
    $deskripsi = isset($_POST['deskripsi']) ? $_POST['deskripsi'] : null;

    if ($id && $nama && $deskripsi) {
        $target_dir = "gambar/";
        $target_file1 = isset($_FILES["foto1"]["name"]) && $_FILES["foto1"]["name"] != "" ? $target_dir . basename($_FILES["foto1"]["name"]) : null;
        $uploadOk = 1;
        $errorMessage = "";

        if ($target_file1) {
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
                    $query = "UPDATE map SET nama='$nama', deskripsi='$deskripsi', gambar='$foto1' WHERE id=$id";

                    if (mysqli_query($conn, $query)) {
                        header('Location: dashboard_admin_map.php');
                        exit();
                    } else {
                        echo 'Error: ' . mysqli_error($conn);
                    }
                } else {
                    $errorMessage .= "Maaf, terjadi kesalahan saat mengunggah file.";
                    echo $errorMessage;
                }
            }
        } else {
            // Update data tanpa mengubah gambar
            $query = "UPDATE map SET nama='$nama', deskripsi='$deskripsi' WHERE id=$id";

            if (mysqli_query($conn, $query)) {
                header('Location: dashboard_admin_map.php');
                exit();
            } else {
                echo 'Error: ' . mysqli_error($conn);
            }
        }
    } else {
        echo "Data tidak lengkap.";
    }
}

// Ambil data map untuk di-edit
$map = null;
if (isset($_GET['id'])) {
    $id = $_GET['id'];
    $query = "SELECT * FROM map WHERE id=$id";
    $result = mysqli_query($conn, $query);
    if ($result && mysqli_num_rows($result) > 0) {
        $map = mysqli_fetch_assoc($result);
    } else {
        echo "Data map tidak ditemukan.";
        exit();
    }
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Map</title>
    <link rel="stylesheet" href="editM.css">
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
                <a href="dashboard_admin_map.php">MAPS</a>
            </div>
            <div class="content">
                <h2>Edit Map</h2>
                <form method="post" enctype="multipart/form-data" onsubmit="return validateForm()">
                    <input type="hidden" name="id" value="<?= isset($map['id']) ? htmlspecialchars($map['id']) : ''; ?>">
                    <div class="form-group">
                        <label for="nama">Nama Map</label>
                        <input type="text" class="form-control" name="nama" id="nama" value="<?= isset($map['nama']) ? htmlspecialchars($map['nama']) : ''; ?>" required>
                    </div>
                    <div class="form-group">
                        <label for="deskripsi">Deskripsi</label>
                        <textarea class="form-control" name="deskripsi" id="deskripsi" required><?= isset($map['deskripsi']) ? htmlspecialchars($map['deskripsi']) : ''; ?></textarea>
                    </div>
                    <div class="form-group">
                        <label for="foto1">Foto (opsional)</label>
                        <input type="file" class="form-control-file" name="foto1" id="foto1" accept="image/*">
                        <?php if (isset($map['gambar'])): ?>
                        <p>Foto saat ini: <img src="gambar/<?= htmlspecialchars($map['gambar']); ?>" alt="<?= htmlspecialchars($map['nama']); ?>" width="100"></p>
                        <?php endif; ?>
                    </div>
                    <button type="submit" class="btn btn-primary">Update Data</button>
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
