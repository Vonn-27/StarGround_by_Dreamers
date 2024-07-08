<?php
include 'dbConnect.php';
$conn = dbConnect();

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Ambil ID senjata dari request
    $id = intval($_POST['id']);

    // Query untuk menghapus senjata berdasarkan ID
    $sql = "DELETE FROM senjata WHERE id = ?";
    
    // Siapkan statement
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("i", $id);

    if ($stmt->execute()) {
        echo "Senjata berhasil dihapus.";
    } else {
        echo "Error: " . $conn->error;
    }

    $stmt->close();
    $conn->close();
    
    // Redirect ke halaman dashboard setelah penghapusan
    header("Location: dashboard_admin_senjata.php");
    exit();
} else {
    echo "Invalid request method.";
}

