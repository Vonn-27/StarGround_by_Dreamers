-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 02 Jul 2024 pada 03.05
-- Versi server: 10.4.28-MariaDB
-- Versi PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `straground`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `kategori`
--

CREATE TABLE `kategori` (
  `id` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `kategori`
--

INSERT INTO `kategori` (`id`, `nama`) VALUES
(1, 'ASSAULT RIFLES'),
(2, 'SNIPER RIFLES'),
(3, 'SUBMACHINE GUNS'),
(4, 'MARKSMAN RIFLE'),
(5, 'SHOTGUNS'),
(6, 'HANDGUNS'),
(7, 'MELEE'),
(8, 'THROWABLE'),
(9, 'ETC');

-- --------------------------------------------------------

--
-- Struktur dari tabel `map`
--

CREATE TABLE `map` (
  `id` int(11) NOT NULL,
  `nama` varchar(255) DEFAULT NULL,
  `gambar` varchar(255) DEFAULT NULL,
  `deskripsi` varchar(10000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `map`
--

INSERT INTO `map` (`id`, `nama`, `gambar`, `deskripsi`) VALUES
(2, 'Erangel', 'ERANGEL.jpg', '<p><strong>Deskripsi</strong>: Erangel adalah peta pertama yang diperkenalkan di PUBG Mobile dan merupakan peta dengan ukuran 8x8 km yang menawarkan berbagai medan dan struktur.</p><p><strong>Fitur Unik</strong>:</p><ul><li><strong>Kota dan Desa</strong>: Georgopol, Pochinki, Yasnaya Polyana, Novorepnoye.</li><li><strong>Militer</strong>: Sosnovka Military Base.</li><li><strong>Medan Bervariasi</strong>: Hutan, pegunungan, lahan terbuka, dan pantai.</li><li><strong>Jembatan</strong>: Penghubung utama antara pulau utama dan pulau militer.</li><li><strong>Kendaraan</strong>: Tersedia berbagai kendaraan untuk mobilitas cepat.</li></ul>'),
(3, 'Miramar', 'miramar.jpg', '<p><strong>Deskripsi</strong>: Miramar adalah peta gurun dengan ukuran 8x8 km yang menawarkan medan terbuka dan kota-kota besar.</p><p><strong>Fitur Unik</strong>:</p><ul><li><strong>Kota dan Area</strong>: Los Leones, Pecado, El Pozo, Hacienda del Patrón.</li><li><strong>Medan Terbuka</strong>: Gurun pasir dengan bukit dan pegunungan.</li><li><strong>Kendaraan</strong>: Tersedia berbagai kendaraan termasuk muscle car dan sepeda motor off-road.</li><li><strong>Sniping</strong>: Medan terbuka membuat peta ini ideal untuk sniper.</li></ul>'),
(4, 'Sanhok', 'sahhok.jpg', '<p><strong>Deskripsi</strong>: Sanhok adalah peta dengan ukuran 4x4 km yang lebih kecil, dirancang untuk permainan yang lebih cepat dan intens.</p><p><strong>Fitur Unik</strong>:</p><ul><li><strong>Kota dan Area</strong>: Bootcamp, Paradise Resort, Ruins, Pai Nan.</li><li><strong>Medan Tropis</strong>: Hutan lebat, sungai, dan bukit.</li><li><strong>Kendaraan</strong>: Sepeda motor dan kendaraan kecil untuk mobilitas cepat.</li><li><strong>Loot Cepat</strong>: Item lebih mudah ditemukan dan area lebih padat.</li></ul>'),
(5, 'Vikendi', 'vikendi.jpg', '<p><strong>Deskripsi</strong>: Vikendi adalah peta bersalju dengan ukuran 6x6 km, menawarkan medan bersalju dan desa-desa kecil.</p><p><strong>Fitur Unik</strong>:</p><ul><li><strong>Kota dan Area</strong>: Castle, Cosmodrome, Dino Park, Volnova.</li><li><strong>Medan Bersalju</strong>: Hutan pinus, desa tertutup salju, dan sungai beku.</li><li><strong>Kendaraan</strong>: Snowmobile dan kendaraan dengan roda salju.</li><li><strong>Footprints</strong>: Jejak kaki di salju yang bisa dilacak.</li></ul>');

-- --------------------------------------------------------

--
-- Struktur dari tabel `senjata`
--

CREATE TABLE `senjata` (
  `id` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `deskripsi` text NOT NULL,
  `gambar` varchar(255) NOT NULL,
  `idkategori` int(11) DEFAULT NULL,
  `digunakan` int(11) DEFAULT 0,
  `tidak_digunakan` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `senjata`
--

INSERT INTO `senjata` (`id`, `nama`, `deskripsi`, `gambar`, `idkategori`, `digunakan`, `tidak_digunakan`) VALUES
(1, 'M416', '<p>M416 adalah senjata serbu yang sangat populer karena kecepatan tembakannya yang tinggi, akurasi yang baik, dan kestabilan recoil yang dapat diatur.</p><p><strong>Attachment yang Cocok:</strong></p><ul><li><strong>Muzzle</strong>: Compensator (mengurangi recoil), Suppressor (menyembunyikan lokasi tembakan)</li><li><strong>Grip</strong>: Vertical Foregrip atau Half Grip (mengontrol recoil)</li><li><strong>Magazine</strong>: Extended QuickDraw Magazine (memperluas kapasitas magasin dan meningkatkan kecepatan reload)</li><li><strong>Scope</strong>: Red Dot atau Holographic Scope (untuk jarak dekat), 2x atau 3x Scope (untuk jarak menengah)</li><li><strong>Stock</strong>: Tactical Stock (meningkatkan kontrol recoil dan akurasi saat bergerak)</li></ul>', 'm416.png', 1, 99, 24),
(2, 'AWM', '<p>AWM (Arctic Warfare Magnum) adalah sniper rifle paling kuat di PUBG Mobile yang menggunakan amunisi .300 Magnum. Senjata ini memiliki damage tertinggi dari semua sniper rifles, mampu membunuh musuh dengan helm level 3 dalam satu tembakan ke kepala.</p><p><strong>Attachment yang Cocok:</strong></p><ul><li><strong>Muzzle</strong>: Compensator (mengurangi recoil), Suppressor (menyembunyikan suara tembakan)</li><li><strong>Magazine</strong>: Extended QuickDraw Magazine</li><li><strong>Stock</strong>: Cheek Pad (meningkatkan stabilitas dan mengurangi sway)</li><li><strong>Scope</strong>: 6x atau 8x Scope (untuk jarak jauh)</li></ul>', 'awm.png', 2, 23, 42),
(5, 'M24', '<p>M24 adalah bolt-action sniper rifle yang menggunakan amunisi 7.62mm, dengan damage yang sedikit lebih rendah dari AWM tetapi lebih tinggi dari KAR98K. M24 memiliki kecepatan peluru yang tinggi, membuatnya efektif untuk jarak jauh.</p><p><strong>Attachment yang Cocok:</strong></p><ul><li><strong>Muzzle</strong>: Compensator atau Suppressor</li><li><strong>Magazine</strong>: Extended QuickDraw Magazine</li><li><strong>Stock</strong>: Cheek Pad</li><li><strong>Scope</strong>: 4x, 6x, atau 8x Scope</li></ul>', 'm24.png', 2, 42, 84),
(6, 'G36C', '<p>G36C adalah senjata serbu yang hanya tersedia di peta Vikendi, dengan kestabilan yang baik dan kecepatan tembakan yang tinggi.</p><p><strong>Attachment yang Cocok:</strong></p><ul><li><strong>Muzzle</strong>: Compensator atau Suppressor</li><li><strong>Grip</strong>: Vertical Foregrip atau Thumb Grip (mengontrol recoil)</li><li><strong>Magazine</strong>: Extended QuickDraw Magazine</li><li><strong>Scope</strong>: Red Dot, Holographic Scope, atau 2x/3x Scope</li></ul>', 'g36c.png', 1, 93, 10),
(7, 'SCAR-L', '<p>SCAR-L adalah senjata serbu yang terkenal dengan kestabilannya dan cocok untuk pertempuran jarak dekat hingga menengah.</p><p><strong>Attachment yang Cocok:</strong></p><ul><li><strong>Muzzle</strong>: Compensator atau Suppressor</li><li><strong>Grip</strong>: Vertical Foregrip atau Angled Foregrip</li><li><strong>Magazine</strong>: Extended QuickDraw Magazine</li><li><strong>Scope</strong>: Red Dot, Holographic Scope, atau 2x/3x Scope</li><li><strong>Stock</strong>: Tactical Stock (jika tersedia)</li></ul>', 'scar-l.png', 1, 74, 38),
(8, 'QBZ', '<p>QBZ adalah senjata serbu yang hanya tersedia di peta Sanhok, dengan kecepatan tembak yang baik dan recoil yang dapat dikendalikan.</p><p><strong>Attachment yang Cocok:</strong></p><ul><li><strong>Muzzle</strong>: Compensator atau Suppressor</li><li><strong>Grip</strong>: Vertical Foregrip atau Half Grip</li><li><strong>Magazine</strong>: Extended QuickDraw Magazine</li><li><strong>Scope</strong>: Red Dot, Holographic Scope, atau 2x/3x Scope</li></ul>', 'qbz.png', 1, 68, 25),
(9, 'AKM', '<p>AKM adalah senjata serbu yang menggunakan amunisi 7.62mm, memberikan damage yang tinggi tetapi dengan recoil yang lebih sulit dikendalikan.</p><p><strong>Attachment yang Cocok:</strong></p><ul><li><strong>Muzzle</strong>: Compensator atau Suppressor</li><li><strong>Magazine</strong>: Extended QuickDraw Magazine</li><li><strong>Scope</strong>: Red Dot, Holographic Scope, atau 2x/3x Scope</li></ul>', 'akm.png', 1, 22, 32),
(10, 'Honey Badger', '<p>Honey Badger adalah senjata serbu yang memiliki suppressor built-in dan menawarkan recoil yang rendah serta kecepatan tembak yang baik.</p><p><strong>Attachment yang Cocok:</strong></p><ul><li><strong>Grip</strong>: Vertical Foregrip atau Half Grip</li><li><strong>Magazine</strong>: Extended QuickDraw Magazine</li><li><strong>Scope</strong>: Red Dot, Holographic Scope, atau 2x/3x Scope</li></ul>', 'honeybadger.png', 1, 96, 82),
(11, 'AUG A3', '<p>AUG A3 adalah senjata serbu yang hanya tersedia dalam airdrop, dikenal dengan kestabilan tembakannya yang tinggi dan damage yang baik.</p><p><strong>Attachment yang Cocok:</strong></p><ul><li><strong>Muzzle</strong>: Compensator atau Suppressor</li><li><strong>Grip</strong>: Vertical Foregrip atau Light Grip</li><li><strong>Magazine</strong>: Extended QuickDraw Magazine</li><li><strong>Scope</strong>: Red Dot, Holographic Scope, atau 2x/3x Scope</li></ul>', 'aug.png', 1, 21, 61),
(12, 'M16A4', '<p>M16A4 adalah senjata serbu dengan mode burst dan single-shot, dikenal dengan akurasi yang tinggi dan kecepatan peluru yang cepat.</p><p><strong>Attachment yang Cocok:</strong></p><ul><li><strong>Muzzle</strong>: Compensator atau Suppressor</li><li><strong>Magazine</strong>: Extended QuickDraw Magazine</li><li><strong>Scope</strong>: Red Dot, Holographic Scope, atau 4x Scope</li></ul>', 'm16a4.png', 1, 41, 21),
(13, 'Groza', '<p>Groza adalah senjata serbu yang hanya tersedia dalam airdrop, menggunakan amunisi 7.62mm dan memberikan damage yang sangat tinggi dengan recoil yang lebih sulit dikendalikan.</p><p><strong>Attachment yang Cocok:</strong></p><ul><li><strong>Muzzle</strong>: Suppressor (khusus untuk Groza)</li><li><strong>Magazine</strong>: Extended QuickDraw Magazine</li><li><strong>Scope</strong>: Red Dot, Holographic Scope, atau 2x/3x Scope</li></ul>', 'groza.png', 1, 81, 43),
(14, 'MK47 Mutant', '<p>MK47 Mutant adalah senjata serbu yang memiliki mode tembak single-shot dan burst, menggunakan amunisi 7.62mm.</p><p><strong>Attachment yang Cocok:</strong></p><ul><li><strong>Muzzle</strong>: Compensator atau Suppressor</li><li><strong>Grip</strong>: Vertical Foregrip atau Thumb Grip</li><li><strong>Magazine</strong>: Extended QuickDraw Magazine</li><li><strong>Scope</strong>: Red Dot, Holographic Scope, atau 4x Scope</li></ul>', 'mk47.png', 1, 70, 19),
(15, 'FAMAS', '<p>FAMAS adalah senjata serbu yang memiliki kecepatan tembak yang sangat tinggi dan recoil yang dapat dikendalikan dengan baik.</p><p><strong>Attachment yang Cocok:</strong></p><ul><li><strong>Muzzle</strong>: Compensator atau Suppressor</li><li><strong>Grip</strong>: Vertical Foregrip atau Angled Foregrip</li><li><strong>Magazine</strong>: Extended QuickDraw Magazine</li><li><strong>Scope</strong>: Red Dot, Holographic Scope, atau 2x/3x Scope</li></ul>', 'famas.png', 1, 87, 77),
(16, 'Beryl M762', '<p>Beryl M762 adalah senjata serbu dengan kecepatan tembak yang tinggi dan damage yang kuat, tetapi memiliki recoil yang cukup tinggi.</p><p><strong>Attachment yang Cocok:</strong></p><ul><li><strong>Muzzle</strong>: Compensator atau Suppressor</li><li><strong>Grip</strong>: Vertical Foregrip atau Angled Foregrip</li><li><strong>Magazine</strong>: Extended QuickDraw Magazine</li><li><strong>Scope</strong>: Red Dot, Holographic Scope, atau 2x/3x Scope</li></ul>', 'm762.png', 1, 23, 85),
(17, 'ACE32', '<p>ACE32 adalah senjata serbu dengan stabilitas yang baik dan recoil yang lebih mudah dikendalikan dibandingkan dengan beberapa senjata lainnya yang menggunakan amunisi 7.62mm.</p><p><strong>Attachment yang Cocok:</strong></p><ul><li><strong>Muzzle</strong>: Compensator atau Suppressor</li><li><strong>Grip</strong>: Vertical Foregrip atau Half Grip</li><li><strong>Magazine</strong>: Extended QuickDraw Magazine</li><li><strong>Scope</strong>: Red Dot, Holographic Scope, atau 2x/3x Scope</li></ul>', 'ace32c.png', 1, 53, 10),
(18, 'Mosin-Nagant', '<p>Mosin-Nagant adalah bolt-action sniper rifle yang mirip dengan KAR98K, menggunakan amunisi 7.62mm. Senjata ini memiliki damage yang besar dan akurasi yang baik.</p><p><strong>Attachment yang Cocok:</strong></p><ul><li><strong>Muzzle</strong>: Compensator atau Suppressor</li><li><strong>Magazine</strong>: Tidak ada slot untuk magazine</li><li><strong>Stock</strong>: Cheek Pad</li><li><strong>Scope</strong>: 4x, 6x, atau 8x Scope</li></ul>', 'mosin.png', 2, 92, 29),
(19, 'KAR98K', '<p>KAR98K adalah bolt-action sniper rifle klasik yang menggunakan amunisi 7.62mm. Senjata ini dikenal dengan damage yang besar dan sering digunakan oleh pemain untuk headshots.</p><p><strong>Attachment yang Cocok:</strong></p><ul><li><strong>Muzzle</strong>: Compensator atau Suppressor</li><li><strong>Magazine</strong>: Tidak ada slot untuk magazine</li><li><strong>Stock</strong>: Cheek Pad</li><li><strong>Scope</strong>: 4x, 6x, atau 8x Scope</li></ul>', '98k.png', 2, 68, 54),
(20, 'AMR Rytec', '<p>AMR Rytec adalah sniper rifle semi-automatic yang menggunakan amunisi .50 BMG. Senjata ini adalah salah satu yang paling kuat di dalam permainan, mampu menghancurkan kendaraan dengan beberapa tembakan.</p><p><strong>Attachment yang Cocok:</strong></p><ul><li><strong>Muzzle</strong>: Compensator atau Suppressor</li><li><strong>Magazine</strong>: Tidak ada slot untuk magazine</li><li><strong>Stock</strong>: Cheek Pad</li></ul><p><strong>Scope</strong>: 6x atau 8x Scope</p>', 'amr.png', 2, 65, 61),
(21, 'Thompson', '<p>Thompson, atau Tommy Gun, adalah SMG yang menggunakan amunisi .45 ACP dan dikenal dengan kapasitas magasin yang besar serta kecepatan tembak yang tinggi.</p><p><strong>Attachment yang Cocok:</strong></p><ul><li><strong>Muzzle</strong>: Compensator (mengurangi recoil), Suppressor (menyembunyikan suara tembakan)</li><li><strong>Magazine</strong>: Extended QuickDraw Magazine (memperluas kapasitas magasin dan meningkatkan kecepatan reload)</li><li><strong>Grip</strong>: Tidak ada slot untuk grip</li><li><strong>Scope</strong>: Red Dot atau Holographic Sight (meningkatkan akurasi)</li></ul>', 'thommygun.png', 3, 10, 68),
(22, 'UMP45', '<p>UMP45 adalah SMG yang menggunakan amunisi .45 ACP dan memiliki kestabilan serta akurasi yang baik, cocok untuk pertempuran jarak dekat hingga menengah.</p><p><strong>Attachment yang Cocok:</strong></p><ul><li><strong>Muzzle</strong>: Compensator (mengurangi recoil), Suppressor (menyembunyikan suara tembakan)</li><li><strong>Grip</strong>: Vertical Foregrip atau Half Grip (meningkatkan kontrol recoil)</li><li><strong>Magazine</strong>: Extended QuickDraw Magazine</li><li><strong>Scope</strong>: Red Dot, Holographic Sight, atau 2x Scope</li></ul>', 'ump45.png', 3, 10, 46),
(23, 'PP-19 Bizon', '<p>PP-19 Bizon adalah SMG yang menggunakan amunisi 9mm, dengan kapasitas magasin yang besar tetapi tanpa opsi untuk magazine attachment.</p><p><strong>Attachment yang Cocok:</strong></p><ul><li><strong>Muzzle</strong>: Compensator atau Suppressor</li><li><strong>Grip</strong>: Vertical Foregrip atau Half Grip</li><li><strong>Scope</strong>: Red Dot, Holographic Sight, atau 2x Scope</li></ul>', 'pp19.png', 3, 96, 45),
(24, 'MP5K', '<p>MP5K adalah SMG yang menggunakan amunisi 9mm, dengan kecepatan tembak yang tinggi dan recoil yang rendah.</p><p><strong>Attachment yang Cocok:</strong></p><ul><li><strong>Muzzle</strong>: Compensator atau Suppressor</li><li><strong>Grip</strong>: Vertical Foregrip atau Angled Foregrip</li><li><strong>Magazine</strong>: Extended QuickDraw Magazine</li><li><strong>Scope</strong>: Red Dot, Holographic Sight, atau 2x Scope</li><li><strong>Stock</strong>: Tactical Stock</li></ul>', 'mp5k.png', 3, 35, 40),
(25, 'P90', '<p>P90 adalah SMG yang menggunakan amunisi 9mm, dengan kecepatan tembak yang sangat tinggi dan kontrol recoil yang baik.</p><p><strong>Attachment yang Cocok:</strong></p><ul><li><strong>Muzzle</strong>: Compensator atau Suppressor</li><li><strong>Grip</strong>: Vertical Foregrip atau Angled Foregrip</li><li><strong>Magazine</strong>: Extended QuickDraw Magazine</li><li><strong>Scope</strong>: Red Dot, Holographic Sight, atau 2x Scope</li></ul>', 'p90.png', 3, 95, 54),
(26, 'Micro Uzi', '<p>Micro Uzi adalah SMG yang menggunakan amunisi 9mm, dengan kecepatan tembak yang sangat tinggi tetapi damage per peluru yang rendah.</p><p><strong>Attachment yang Cocok:</strong></p><ul><li><strong>Muzzle</strong>: Compensator atau Suppressor</li><li><strong>Grip</strong>: Tidak ada slot untuk grip</li><li><strong>Magazine</strong>: Extended QuickDraw Magazine</li><li><strong>Scope</strong>: Red Dot atau Holographic Sight</li><li><strong>Stock</strong>: Stock for Micro Uzi</li></ul>', 'uzi.png', 3, 86, 68),
(27, 'Vector', '<p>Vector adalah SMG yang menggunakan amunisi .45 ACP, dengan kecepatan tembak yang sangat tinggi tetapi kapasitas magasin standar yang kecil.</p><p><strong>Attachment yang Cocok:</strong></p><ul><li><strong>Muzzle</strong>: Compensator atau Suppressor</li><li><strong>Grip</strong>: Vertical Foregrip atau Angled Foregrip</li><li><strong>Magazine</strong>: Extended QuickDraw Magazine</li><li><strong>Scope</strong>: Red Dot, Holographic Sight, atau 2x Scope</li><li><strong>Stock</strong>: Tactical Stock</li></ul>', 'Vector.png', 3, 82, 5),
(28, 'Win94', '<p>Win94 adalah senapan lever-action yang menggunakan amunisi .45 ACP. Senjata ini memiliki damage yang tinggi dan kecepatan tembak yang moderat, namun tidak bisa dilengkapi dengan scope modern.</p><p><strong>Attachment yang Cocok:</strong></p><ul><li><strong>Muzzle</strong>: Tidak ada slot untuk muzzle.</li><li><strong>Scope</strong>: Terintegrasi dengan 2.7x Scope (tidak bisa diganti).</li><li><strong>Stock</strong>: Tidak ada slot untuk stock.</li></ul>', 'win94.png', 4, 76, 66),
(29, 'MK12', '<p><strong>Deskripsi:</strong></p><p>MK12 adalah DMR yang menggunakan amunisi 5.56mm, dengan recoil yang moderat dan akurasi yang baik.</p><p><strong>Attachment yang Cocok:</strong></p><ul><li><strong>Muzzle</strong>: Compensator (mengurangi recoil), Suppressor (menyembunyikan suara tembakan)</li><li><strong>Grip</strong>: Vertical Foregrip atau Angled Foregrip (meningkatkan kontrol recoil)</li><li><strong>Magazine</strong>: Extended QuickDraw Magazine</li><li><strong>Scope</strong>: 4x, 6x, atau 8x Scope</li><li><strong>Stock</strong>: Tactical Stock</li></ul>', 'mk12.png', 4, 2, 11),
(30, 'Mini14', '<p>Mini14 adalah DMR yang menggunakan amunisi 5.56mm, dengan kapasitas magasin yang besar dan kecepatan peluru yang tinggi, menjadikannya efektif untuk jarak menengah hingga jauh.</p><p><strong>Attachment yang Cocok:</strong></p><ul><li><strong>Muzzle</strong>: Compensator atau Suppressor</li><li><strong>Magazine</strong>: Extended QuickDraw Magazine</li><li><strong>Scope</strong>: 4x, 6x, atau 8x Scope</li><li><strong>Stock</strong>: Cheek Pad (meningkatkan stabilitas)</li></ul>', 'mini.png', 4, 49, 12),
(31, 'VSS', '<p>VSS adalah DMR yang menggunakan amunisi 9mm, dengan integrasi suppressor dan scope. Senjata ini memiliki kecepatan tembak yang rendah tetapi sangat senyap dan cocok untuk pertempuran jarak menengah hingga dekat.</p><p><strong>Attachment yang Cocok:</strong></p><ul><li><strong>Muzzle</strong>: Tidak ada slot untuk muzzle (sudah terintegrasi).</li><li><strong>Magazine</strong>: Extended QuickDraw Magazine</li><li><strong>Scope</strong>: Terintegrasi dengan 4x Scope (tidak bisa diganti)</li><li><strong>Stock</strong>: Cheek Pad</li></ul>', 'vss.png', 4, 13, 28),
(32, 'QBU', '<p>QBU adalah DMR yang menggunakan amunisi 5.56mm, eksklusif untuk map Sanhok, dengan bipod terintegrasi untuk meningkatkan stabilitas saat menembak sambil berbaring.</p><p><strong>Attachment yang Cocok:</strong></p><ul><li><strong>Muzzle</strong>: Compensator atau Suppressor</li><li><strong>Magazine</strong>: Extended QuickDraw Magazine</li><li><strong>Scope</strong>: 4x, 6x, atau 8x Scope</li><li><strong>Stock</strong>: Tidak ada slot untuk stock</li></ul>', 'qbu.png', 4, 98, 9),
(33, 'SLR', '<p>SLR adalah DMR yang menggunakan amunisi 7.62mm, dengan damage yang tinggi dan recoil yang signifikan. Membutuhkan kontrol yang baik dari pemain.</p><p><strong>Attachment yang Cocok:</strong></p><ul><li><strong>Muzzle</strong>: Compensator (sangat direkomendasikan untuk mengurangi recoil), Suppressor</li><li><strong>Magazine</strong>: Extended QuickDraw Magazine</li><li><strong>Scope</strong>: 4x, 6x, atau 8x Scope</li><li><strong>Stock</strong>: Cheek Pad</li></ul>', 'slr.png', 4, 48, 12),
(34, 'MK14', '<p>MK14 adalah DMR yang menggunakan amunisi 7.62mm, dengan mode tembak semi-auto dan full-auto. Senjata ini sangat kuat tetapi dengan recoil yang besar.</p><p><strong>Attachment yang Cocok:</strong></p><ul><li><strong>Muzzle</strong>: Compensator (sangat direkomendasikan), Suppressor</li><li><strong>Grip</strong>: Tidak ada slot untuk grip</li><li><strong>Magazine</strong>: Extended QuickDraw Magazine</li><li><strong>Scope</strong>: 4x, 6x, atau 8x Scope</li><li><strong>Stock</strong>: Cheek Pad</li></ul>', 'mk14.png', 4, 14, 37),
(35, 'SKS', '<p>SKS adalah DMR yang menggunakan amunisi 7.62mm, dengan damage yang baik dan kecepatan tembak yang moderat.</p><p><strong>Attachment yang Cocok:</strong></p><ul><li><strong>Muzzle</strong>: Compensator atau Suppressor</li><li><strong>Grip</strong>: Vertical Foregrip atau Angled Foregrip</li><li><strong>Magazine</strong>: Extended QuickDraw Magazine</li><li><strong>Scope</strong>: 4x, 6x, atau 8x Scope</li><li><strong>Stock</strong>: Cheek Pad</li></ul>', 'sks.png', 4, 40, 90),
(36, 'S12K', '<p>S12K adalah shotgun semi-automatic yang menggunakan amunisi 12 gauge. Senjata ini memiliki kecepatan tembak yang tinggi dan cocok untuk pertempuran jarak dekat.</p><p><strong>Attachment yang Cocok:</strong></p><ul><li><strong>Muzzle</strong>: Compensator (mengurangi recoil), Suppressor (menyembunyikan suara tembakan)</li><li><strong>Magazine</strong>: Extended QuickDraw Magazine</li><li><strong>Stock</strong>: Cheek Pad (meningkatkan stabilitas)</li><li><strong>Scope</strong>: Red Dot atau Holographic Sight</li></ul>', 's12k.png', 5, 30, 78),
(37, 'M1014', '<p>M1014 adalah shotgun semi-automatic yang menggunakan amunisi 12 gauge. Senjata ini memiliki kecepatan tembak yang cepat dan cukup efektif dalam jarak dekat.</p><p><strong>Attachment yang Cocok:</strong></p><ul><li><strong>Muzzle</strong>: Tidak ada slot untuk muzzle</li><li><strong>Magazine</strong>: Tidak ada slot untuk magazine</li><li><strong>Stock</strong>: Tidak ada slot untuk stock</li><li><strong>Scope</strong>: Red Dot atau Holographic Sight</li></ul>', 'm1014.png', 5, 100, 65),
(38, 'S686', '<p>S686 adalah shotgun break-action dengan dua peluru yang menggunakan amunisi 12 gauge. Senjata ini memiliki damage yang sangat besar, tetapi hanya memiliki dua tembakan sebelum harus reload.</p><p><strong>Attachment yang Cocok:</strong></p><ul><li><strong>Muzzle</strong>: Tidak ada slot untuk muzzle</li><li><strong>Magazine</strong>: Tidak ada slot untuk magazine</li><li><strong>Stock</strong>: Tidak ada slot untuk stock</li><li><strong>Scope</strong>: Red Dot atau Holographic Sight</li></ul>', 's686.png', 5, 23, 21),
(39, 'DBS', '<p>DBS adalah shotgun double-barrel yang menggunakan amunisi 12 gauge dan memiliki magasin internal. Senjata ini dapat menembakkan dua peluru secara cepat sebelum reload.</p><p><strong>Attachment yang Cocok:</strong></p><ul><li><strong>Muzzle</strong>: Tidak ada slot untuk muzzle</li><li><strong>Magazine</strong>: Tidak ada slot untuk magazine</li><li><strong>Stock</strong>: Tidak ada slot untuk stock</li><li><strong>Scope</strong>: Red Dot atau Holographic Sight</li></ul>', 'dbs.png', 5, 34, 7),
(40, 'S1897', '<p>S1897 adalah shotgun pump-action yang menggunakan amunisi 12 gauge. Senjata ini memiliki damage yang tinggi dan kapasitas peluru yang baik tetapi kecepatan reload yang lambat.</p><p><strong>Attachment yang Cocok:</strong></p><ul><li><strong>Muzzle</strong>: Tidak ada slot untuk muzzle</li><li><strong>Magazine</strong>: Tidak ada slot untuk magazine</li><li><strong>Stock</strong>: Tidak ada slot untuk stock</li><li><strong>Scope</strong>: Red Dot atau Holographic Sight</li></ul>', 's1897.png', 5, 34, 48),
(41, 'NS2000', '<p>NS2000 adalah shotgun pump-action yang menggunakan amunisi 12 gauge. Senjata ini memiliki damage yang tinggi dan kapasitas peluru yang baik.</p><p><strong>Attachment yang Cocok:</strong></p><ul><li><strong>Muzzle</strong>: Tidak ada slot untuk muzzle</li><li><strong>Magazine</strong>: Tidak ada slot untuk magazine</li><li><strong>Stock</strong>: Tidak ada slot untuk stock</li><li><strong>Scope</strong>: Red Dot atau Holographic Sight</li></ul>', 'ns2000.png', 5, 38, 45),
(42, 'Flare Gun', '<p>Flare Gun adalah senjata khusus yang digunakan untuk memanggil airdrop atau kendaraan lapis baja di PUBG Mobile.</p><p><strong>Attachment yang Cocok:</strong></p><ul><li><strong>Attachment</strong>: Tidak ada attachment yang tersedia untuk Flare Gun.</li></ul>', 'flaregun.png', 6, 9, 11),
(43, 'R45', '<p>R45 adalah revolver yang menggunakan amunisi .45 ACP. Senjata ini memiliki kecepatan reload yang lebih cepat dibandingkan revolver lainnya.</p><p><strong>Attachment yang Cocok:</strong></p><ul><li><strong>Muzzle</strong>: Tidak ada slot untuk muzzle.</li><li><strong>Scope</strong>: Red Dot Sight (meningkatkan akurasi).</li></ul>', 'r45.png', 6, 29, 9),
(44, 'Desert Eagle', '<p>Desert Eagle adalah pistol yang kuat dengan damage tinggi, menggunakan amunisi .45 ACP.</p><p><strong>Attachment yang Cocok:</strong></p><ul><li><strong>Muzzle</strong>: Suppressor (menyembunyikan suara tembakan), Compensator (mengurangi recoil).</li><li><strong>Magazine</strong>: Extended Magazine (memperluas kapasitas magasin).</li><li><strong>Scope</strong>: Red Dot Sight (meningkatkan akurasi).</li></ul>', 'deserteagle.png', 6, 60, 73),
(45, 'Skorpion', '<p>Skorpion adalah senjata kecil semi-otomatis dan otomatis yang menggunakan amunisi 9mm.</p><p><strong>Attachment yang Cocok:</strong></p><ul><li><strong>Muzzle</strong>: Suppressor atau Compensator.</li><li><strong>Grip</strong>: Vertical Foregrip.</li><li><strong>Stock</strong>: Stock for Micro Uzi.</li><li><strong>Magazine</strong>: Extended Magazine (memperluas kapasitas magasin).</li><li><strong>Scope</strong>: Red Dot Sight (meningkatkan akurasi).</li></ul>', 'skorpion.png', 6, 82, 93),
(46, 'R1895', '<p>R1895 adalah revolver yang menggunakan amunisi 7.62mm, dikenal dengan damage yang tinggi tetapi dengan reload yang lambat.</p><p><strong>Attachment yang Cocok:</strong></p><ul><li><strong>Muzzle</strong>: Suppressor (menyembunyikan suara tembakan).</li><li><strong>Scope</strong>: Tidak ada slot untuk scope.</li></ul>', 'r1895.png', 6, 18, 11),
(47, 'P92', '<p>P92 adalah pistol standar yang menggunakan amunisi 9mm, menawarkan kestabilan dan kecepatan tembak yang baik.</p><p><strong>Attachment yang Cocok:</strong></p><ul><li><strong>Muzzle</strong>: Suppressor atau Compensator.</li><li><strong>Magazine</strong>: Extended Magazine.</li><li><strong>Scope</strong>: Red Dot Sight (meningkatkan akurasi).</li></ul>', 'p92.png', 6, 1, 71),
(48, 'P18C', '<p>P18C adalah pistol semi-otomatis yang bisa beralih ke mode full-auto, menggunakan amunisi 9mm.</p><p><strong>Attachment yang Cocok:</strong></p><ul><li><strong>Muzzle</strong>: Suppressor atau Compensator.</li><li><strong>Magazine</strong>: Extended Magazine.</li><li><strong>Scope</strong>: Tidak ada slot untuk scope.</li></ul>', 'p18c.png', 6, 51, 40),
(49, 'P1911', '<p>P1911 adalah pistol yang menggunakan amunisi .45 ACP, memiliki damage yang baik dengan kecepatan tembak yang moderat.</p><p><strong>Attachment yang Cocok:</strong></p><ul><li><strong>Muzzle</strong>: Suppressor atau Compensator.</li><li><strong>Magazine</strong>: Extended Magazine.</li><li><strong>Scope</strong>: Tidak ada slot untuk scope.</li></ul>', 'p1911.png', 6, 46, 13),
(50, 'Sawed-Off Shotgun', '<p>Sawed-Off Shotgun adalah senjata khusus yang menggunakan amunisi 12 Gauge, cocok untuk pertempuran jarak sangat dekat.</p><p><strong>Attachment yang Cocok:</strong></p><ul><li><strong>Attachment</strong>: Tidak ada slot untuk attachment pada Sawed-Off Shotgun.</li></ul>', 'sawedoff.png', 6, 23, 76),
(51, 'Pan', '<p>Pan adalah senjata melee yang paling populer dan ikonik di PUBG Mobile. Pan memiliki damage yang besar dan juga berfungsi sebagai pelindung, karena dapat menangkis peluru ketika disimpan di punggung pemain.</p><p><strong>Attachment yang Cocok:</strong></p><ul><li>Tidak ada slot untuk attachment</li></ul><p><strong>Kegunaan:</strong></p><ul><li><strong>Pertarungan Jarak Dekat</strong>: Sangat efektif dalam pertarungan jarak dekat karena damage yang tinggi.</li><li><strong>Perlindungan</strong>: Bisa menangkis peluru, terutama saat disimpan di punggung pemain, memberikan perlindungan ekstra dari tembakan musuh.</li></ul>', 'pan.png', 7, 11, 28),
(52, 'Machete', '<p>Machete adalah senjata melee yang memberikan damage moderat dalam pertempuran jarak dekat. Machete memiliki jangkauan yang sedikit lebih panjang dibandingkan dengan senjata melee lainnya.</p><p><strong>Attachment yang Cocok:</strong></p><ul><li>Tidak ada slot untuk attachment</li></ul><p><strong>Kegunaan:</strong></p><ul><li><strong>Pertarungan Jarak Dekat</strong>: Berguna dalam situasi darurat saat tidak memiliki senjata lain.</li><li><strong>Penghancuran Barang</strong>: Bisa digunakan untuk menghancurkan jendela atau pintu untuk masuk ke bangunan.</li></ul>', 'machete.png', 7, 5, 40),
(53, 'Combat Knife', '<p>Combat Knife adalah senjata melee yang lebih kecil dan lebih cepat dibandingkan dengan Pan dan Machete. Meskipun damage-nya lebih rendah, Combat Knife memungkinkan serangan yang lebih cepat.</p><p><strong>Attachment yang Cocok:</strong></p><ul><li>Tidak ada slot untuk attachment</li></ul><p><strong>Kegunaan:</strong></p><ul><li><strong>Pertarungan Jarak Dekat</strong>: Efektif untuk serangan cepat dalam jarak sangat dekat.</li><li><strong>Penghancuran Barang</strong>: Bisa digunakan untuk menghancurkan jendela atau pintu dengan cepat.</li></ul>', 'bishou.png', 7, 86, 9),
(54, 'Molotov Cocktail', '<p>Bom ini tidak memiliki hitungan mundur dan saat mengenai permukaan keras, bom akan meledak dan menimbulkan kobaran api, yang mengakibatkan kerusakan besar. Bom ini terus menimbulkan kerusakan bahkan saat Anda terbentur. Bom ini dapat ditemukan di semua mode kecuali Arena.</p>', 'img-weapons-molotov_cocktail.png', 8, 84, 95),
(55, 'Frag Grenade', '<p>Frag Grenade adalah granat kuat yang dapat ditemukan dalam Mode Klasik , Arena , Mode Arkade , Evoground , dan bahkan Metro Royale .</p><p>Mungkin Throwable yang paling sering digunakan dalam permainan, Frag Grenade menghasilkan kerusakan setelah hitungan mundur berakhir - ini bisa terjadi di kaki musuh Anda, di udara, atau tepat di tangan Anda, yang akan menjatuhkan Anda.</p><p>Granat Frag yang diarahkan dengan tepat dapat langsung menjatuhkan musuh, atau setidaknya melukai Anda dengan parah. Inilah alasan mengapa banyak pemain strategi menggunakan Granat Frag untuk melemahkan musuh mereka, dan mengalahkan mereka saat menyerang.</p>', 'img-weapons-frag_grenade.png', 8, 24, 32),
(56, 'Smoke Grenade', '<p>Granat Asap merupakan bagian dari Throwables . Ini adalah item taktis yang digunakan untuk menciptakan awan asap tebal, yang dapat melindungi Anda dari mata musuh. Granat ini dapat ditemukan dalam mode eery kecuali Arena.</p>', 'img-weapons-smoke_grenade.png', 8, 87, 37),
(57, 'Stun Grenade', '<p>Stun Grenade merupakan bagian dari Throwables . Seperti Smoke Grenade , Stun Grenade merupakan item taktis yang tidak menimbulkan kerusakan apa pun. Stun Grenade memiliki hitungan mundur sekitar 4 detik dan dapat membuat Anda atau musuh Anda tuli dan buta selama beberapa detik. Stun Grenade dapat ditemukan dalam semua mode.</p>', 'img-weapons-stun_grenade.png', 8, 27, 23),
(58, 'Sticky Bomb ', '<p>Sticky Bomb merupakan bagian dari Throwables . Bom ini memulai hitungan mundur setelah mengenai suatu objek dan menempel padanya, dan terkenal sulit dilempar dalam jarak sedang, jadi tidak dapat digunakan semudah Frag Grenade , misalnya. Sticky Bomb memberikan kerusakan tinggi dalam jarak dekat. Ditemukan secara eksklusif di Karakin , Sticky Bomb juga dapat digunakan untuk meledakkan Dinding Kertas dan pintu masuk ke ruangan tersembunyi atau Terowongan.</p>', 'img-weapons-sticky_bomb.png', 8, 34, 99);

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `password` varchar(32) NOT NULL,
  `registration_date` date NOT NULL,
  `role` enum('user','admin') NOT NULL DEFAULT 'user'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `name`, `password`, `registration_date`, `role`) VALUES
(1, 'admin', '202cb962ac59075b964b07152d234b70', '2024-06-28', 'admin'),
(2, 'Putu Gunawan', '55bd7306a83e9aa210ca3d5ae6004362', '2024-05-06', 'user'),
(3, 'Qori Setiawan', '80dbc8b4369a23175fdd97f6e24a3ba5', '2024-04-15', 'user'),
(4, 'Taufik Rahayu', '9212648b0f4c644c2dc66b23edb8e24f', '2024-03-04', 'user'),
(5, 'Ahmad Pramono', '464cc7db97886024610d4140bb3f59fa', '2024-02-18', 'user'),
(6, 'Dewi Hartono', 'f0337a59d76607005df571adcf4a5885', '2024-04-28', 'user'),
(7, 'Hari Zulkarnain', '41ef6203cbae456f8825e29dedd0d961', '2024-06-06', 'user'),
(8, 'Ahmad Susanti', 'fa4a3b784347f56374c68bc3223cd1b0', '2024-03-15', 'user'),
(9, 'Budi Pramono', '8efc0a4f99350dcd07ea33844b33c418', '2024-01-23', 'user'),
(10, 'Umar Hartono', 'f4ab3d4f4871c3164fab7f72aa0938c2', '2024-04-01', 'user'),
(11, 'Putu Pramono', '87b738c3aaf7e32993e0debf0008f63d', '2024-02-01', 'user'),
(12, 'Vina Hartono', '899093d011a91d6a47ad0fccc1d707a8', '2024-01-10', 'user'),
(13, 'Dewi Kurniawan', 'b30c3175a6e0a25f0ffcfd927ff23f29', '2024-03-09', 'user'),
(14, 'Zara Rahayu', '2a57a95fccf7916c55c7865a95595c58', '2024-01-05', 'user'),
(15, 'Rini Hartono', 'd4d10c2781a92f3d63c8f71120cebfa9', '2024-05-25', 'user'),
(16, 'Maya Wijaya', '15b1a9d3bfaac6248d309d81c7a28fe7', '2024-01-12', 'user'),
(17, 'Citra Zulkarnain', 'ebd76ad8c43642c7ed8daa9e2bc00a27', '2024-01-28', 'user'),
(18, 'Rini Pramono', '6d530b7dcb2962b8f723ee59c4dff08e', '2024-06-05', 'user'),
(19, 'Rini Saputra', 'a2fb71b9c6482f5c0ee771b744466a06', '2024-05-02', 'user'),
(20, 'Eko Kurniawan', 'e9b6a93533c687e28086c0e953562c6c', '2024-03-25', 'user'),
(21, 'Kiki Rahayu', '5fec6a002268160be35ec2af29f86b5e', '2024-02-26', 'user'),
(22, 'Putu Saputra', '883f62c448fc6beac791cb8df65dc690', '2024-03-19', 'user'),
(23, 'Gita Setiawan', '56ab4dc21faa352e8e70c1703a050d8f', '2024-04-29', 'user'),
(24, 'Sinta Wibowo', '049accda91a278888b5207fd2c25e606', '2024-05-06', 'user'),
(25, 'Fajar Wibowo', '9ef9711a5020e3e4d4af83dfaed4baac', '2024-01-05', 'user'),
(26, 'Oka Santika', '927f77c192578f184871995dcd387a65', '2024-05-03', 'user'),
(27, 'Qori Suryadi', '7df0ebaa8803a6c7d1aa3b84b79ecb3a', '2024-04-26', 'user'),
(28, 'Rini Zulkarnain', '14470820233ffcd2eaaa10b1bf9b4432', '2024-02-11', 'user'),
(29, 'Vina Wibowo', 'e804bd0b8bce6cff12e4efd213a632af', '2024-05-08', 'user'),
(30, 'Vina Sari', '3df9a4f40d591b54262a27bc0033adcc', '2024-01-01', 'user'),
(31, 'Wawan Suryadi', 'd8fde471ba3c473f792321fb868104d8', '2024-04-21', 'user'),
(32, 'Hari Setiawan', '073de6355d35784a99fcdae14f713b74', '2024-05-31', 'user'),
(33, 'Rini Utomo', '72179471affe7c2f37df058a953f3741', '2024-02-08', 'user'),
(34, 'Maya Zulkarnain', '54c1991a31017befe3ec1065cd8494f7', '2024-03-14', 'user'),
(35, 'Qori Pratama', '00f4bee86966b366fb01f90ff1ea0a47', '2024-02-04', 'user'),
(36, 'Intan Wibowo', '9a8efc2186db074d3b4267223c293485', '2024-01-09', 'user'),
(37, 'Ahmad Hartono', 'd59e691c4ec60e08d396787b2257cbdf', '2024-04-27', 'user'),
(38, 'Putu Susanti', 'fcd8f1732c10dc6b6e13b387a0af7893', '2024-04-18', 'user'),
(39, 'Zara Suryadi', '9a6a1d01bd04bb924615ea8b1ad0f73f', '2024-02-16', 'user'),
(40, 'Hari Kurniawan', '5da1415097906c04d8e9c5defd8fd64a', '2024-02-18', 'user'),
(41, 'Yudi Wibowo', 'eef1ae02d08ee3ee272437916e8e8197', '2024-06-14', 'user'),
(42, 'Ahmad Gunawan', '80cd24c26291f5e50df84d18fc781638', '2024-03-04', 'user'),
(43, 'Yudi Susanto', 'b37365034796c42e826ab198a8f36975', '2024-06-23', 'user'),
(44, 'Citra Gunawan', '73d81d1ac17d9842e0b347da72c69c29', '2024-03-18', 'user'),
(45, 'Vina Santika', '8895f43133c4849df33b4952c942ab3f', '2024-01-21', 'user'),
(46, 'Putu Wijaya', 'c93d06add7e21ae14daa53200ad39aac', '2024-01-06', 'user'),
(47, 'Qori Saputra', '4f8f07520ad8c7295e6c79b9f8b7df73', '2024-06-09', 'user'),
(48, 'Xenia Kurniawan', 'a167bd5a94d501fc379070c29b5eb80e', '2024-02-16', 'user'),
(49, 'Nina Lestari', '32ce9a60ca7831bbcfe1908a04b53f4f', '2024-02-22', 'user'),
(50, 'Sinta Wijaya', 'a1580db168a7ec5c46df21dc310b06ff', '2024-05-12', 'user'),
(51, 'Intan Setiawan', 'd48eb4d67311382f539feebbd05600fc', '2024-03-27', 'user'),
(52, 'Gita Rahman', '42f223211602fb8ba6e19099ba1a0973', '2024-01-29', 'user'),
(53, 'Rini Wijaya', 'd78a1bf5aa87968c5448751ad6f4e57f', '2024-01-18', 'user'),
(54, 'Ahmad Rahayu', '1562627b8e644bdd4cb0180956b75723', '2024-04-08', 'user'),
(55, 'Rini Putri', '3dfccd15d23b3c715cc426f2938503c8', '2024-05-12', 'user'),
(56, 'Joko Pramono', 'd152899417c9d35b35c04b63d803b9fa', '2024-01-06', 'user'),
(57, 'Rini Sari', '4de0cc4933cc92f5e05d0865dfe1b79e', '2024-05-20', 'user'),
(58, 'Lina Saputra', 'eb74d9ec98335994c1847816d7063b99', '2024-01-05', 'user'),
(59, 'Yudi Kurniawan', 'f73fdb51cc9897b4786541f5adb7c789', '2024-03-05', 'user'),
(60, 'Dewi Setiawan', '49f5e81cc892a10bca3b573dd1c4b348', '2024-06-15', 'user'),
(61, 'Zara Kurniawan', 'd317a03cb1b3f763fe21caf719c54b27', '2024-01-12', 'user'),
(62, 'Nina Pratama', '68feb44bfc6b5d21c390b410c33ca6f5', '2024-04-23', 'user'),
(63, 'Lina Pratama', 'dd0385955b380c41f732e345c8d17b27', '2024-04-21', 'user'),
(64, 'Yudi Hartono', '4a1c52088f704880329a19f613d61501', '2024-02-02', 'user'),
(65, 'Hari Pramono', '09ea92d50f662ad74e627380fa36c477', '2024-03-22', 'user'),
(66, 'Zara Pramono', 'f824dd01dd88fbfd7412953630530b8a', '2024-03-05', 'user'),
(67, 'Eko Gunawan', 'd66885a525d2b80fcb032e243f163fe8', '2024-04-02', 'user'),
(68, 'Kiki Wibowo', '4b242ab4f40d9cf8d9ebb4bd5a6f9dfc', '2024-05-11', 'user'),
(69, 'Citra Saputra', 'a1a1e270f678726046d1fcdd2f59cb2f', '2024-02-13', 'user'),
(70, 'Xenia Hartono', '8f2c0148f24398bcb6c4decc9db73a46', '2024-04-26', 'user'),
(71, 'Ahmad Nugroho', '1c3b8bc7eade501fe8c8c2323e02cb6b', '2024-03-28', 'user'),
(72, 'Budi Saputra', 'a5b33d3b0358bf9385356b162fc7bce3', '2024-04-15', 'user'),
(73, 'Gita Putri', '9b691038ce09283e4ac032ec661b24cd', '2024-06-26', 'user'),
(74, 'Umar Saputra', '432639ee104eb09bf194ebb03a2f64a3', '2024-01-14', 'user'),
(75, 'Kiki Saputra', '204259424e6bee23040f448371cde6f1', '2024-01-24', 'user'),
(76, 'Hari Hartono', '24ad6fee7cfb236f97caa616d332984b', '2024-02-13', 'user'),
(77, 'Fajar Lestari', '0f4a2de4b11be7d70ad5ae309eb0bf55', '2024-03-25', 'user'),
(78, 'Wawan Rahayu', 'b2a8ba752f08cd9111369bd6c7820d02', '2024-01-10', 'user'),
(79, 'Umar Santika', '8ee032c928097c12ff6aa33d47822b7d', '2024-02-10', 'user'),
(80, 'Xenia Gunawan', 'c2e944a505efe69caa4f0bb36ea0a22c', '2024-03-30', 'user'),
(81, 'Zara Saputra', '304a54c19672e7e6556ac952a3194dec', '2024-04-12', 'user'),
(82, 'Dewi Saputra', '2cb92704032d02e74fa1c7111ccefce0', '2024-02-29', 'user'),
(83, 'Nina Nugroho', '412af096887a00bc38ee744cca046f64', '2024-06-27', 'user'),
(84, 'Xenia Rahman', '3841547cfc04323f474c4e3d4cf82d55', '2024-02-18', 'user'),
(85, 'Xenia Wibowo', '46cc07e00e920e18faf21f001d94ec77', '2024-02-18', 'user'),
(86, 'Wawan Susanto', 'f915481afcbb988b79d94a7b36b7f4c4', '2024-03-18', 'user'),
(87, 'Lina Suryawan', 'fc2e825660b99e1c872ce944b8cf682f', '2024-01-26', 'user'),
(88, 'Joko Nugroho', 'b44d145ab4dc3970ae7d1e68eb5ecaee', '2024-04-30', 'user'),
(89, 'Fajar Putri', 'bbe17817497dad3bd9ac366c1339b5a9', '2024-03-10', 'user'),
(90, 'Xenia Setiawan', 'af0a1f46a3241877edb190d7f55ccd48', '2024-06-12', 'user'),
(91, 'Gita Hartono', '6637497dcca66d974d9c214802f7cb7a', '2024-04-16', 'user'),
(92, 'Sinta Nugroho', '6da951681374bc272ba151c6c1cff420', '2024-04-24', 'user'),
(93, 'Oka Kurniawan', '022bad308f46bbcca656dbd157ba0e05', '2024-01-06', 'user'),
(94, 'Qori Rahman', 'f9533f53ebd35a4b53181e52fef8a349', '2024-06-27', 'user'),
(95, 'Putu Setiawan', '350cf2636fece078a4947875c298ca4b', '2024-06-23', 'user'),
(96, 'Maya Santoso', 'b19a39775bd58d4988bec0c2cdee0ac7', '2024-05-17', 'user'),
(97, 'Rini Pratama', 'b890133f188e7781b182117a90a3b16d', '2024-02-14', 'user'),
(98, 'Ahmad Wijaya', '9133fbfbd03766858d1a94d4d6a82449', '2024-02-24', 'user'),
(99, 'Dewi Santoso', 'd93f15b3de3b83b4f18bcbd4be8ff086', '2024-05-24', 'user'),
(100, 'Nina Utomo', '026cb210221d05b48eb8356c61c3e465', '2024-03-31', 'user'),
(101, 'Qori Utomo', 'f796f5b0fe453a66e2f74a0ca3e6334f', '2024-04-11', 'user'),
(102, 'Oka Zulkarnain', '06b1c7933a4f4858ccf51cabe48580e6', '2024-04-26', 'user'),
(103, 'Yudi Suryadi', 'bb8a2372c8a7c3ad53c06310a4b20fe6', '2024-05-05', 'user'),
(104, 'Vina Zulkarnain', 'd15bc6a78bd1fd270c874e976b70d4d6', '2024-01-28', 'user'),
(105, 'Putu Rahman', 'd558ac8f706c20596cf2f50033576966', '2024-01-08', 'user'),
(106, 'Maya Gunawan', 'a660f47e71bda381e54c1997b6091484', '2024-02-05', 'user'),
(107, 'Dewi Zulkarnain', '959f62e0b108f718afcb2626b862b2b0', '2024-03-18', 'user'),
(108, 'Oka Hartono', '2f0e1aa00d18f6c0e445e88e089046a1', '2024-05-04', 'user'),
(109, 'Wawan Wijaya', '8aa3fd7d68bfb01415bd3e10c0e7d5db', '2024-06-13', 'user'),
(110, 'Kiki Suryawan', 'e2ffab297e05720f52d20c9726475e2a', '2024-02-28', 'user'),
(111, 'Joko Suryadi', '59668c4f36c8ef8d30aba4ea0ea87c55', '2024-02-15', 'user'),
(112, 'Joko Kurniawan', '37746862daa26c4689b96f674d52f862', '2024-05-12', 'user'),
(113, 'Xenia Suryawan', '2f907a1f201dbbcab618048d59443352', '2024-04-03', 'user'),
(114, 'Dewi Rahayu', 'ebc9e09826558e097899d69f256797e0', '2024-04-28', 'user'),
(115, 'Umar Putri', '5aa974cdf85e76760075af519b6f1aaa', '2024-02-10', 'user'),
(116, 'Budi Nugroho', '72943959d667e115733660ed0900cfb0', '2024-02-12', 'user'),
(117, 'Taufik Putri', '88131ad05525d8367a0388e34f7c91f2', '2024-02-17', 'user'),
(118, 'Gita Wibowo', '22eaa89ce608b294b07046c942310679', '2024-02-26', 'user'),
(119, 'Fajar Saputra', 'e0ff114a7d50a7dfa44a8b6a1755b425', '2024-02-29', 'user'),
(120, 'Ahmad Wibowo', 'ce76af2816d2ce0e6b16ab4451d9b28a', '2024-04-21', 'user'),
(121, 'Joko Zulkarnain', '27fdf1ccbe47ca627b785aebf054f7f8', '2024-05-09', 'user'),
(122, 'Qori Kurniawan', '609f062ea2cb8b7665095172e8aafa80', '2024-05-01', 'user'),
(123, 'Gita Santika', '34c97b70c44c8d932f7eba4d80683d8a', '2024-02-09', 'user'),
(124, 'Maya Rahayu', '42606a5f2f91d0a2a395bd04a56ab386', '2024-01-04', 'user'),
(125, 'Hari Sari', '4b8b40279b8d154c7c5f866f0215351c', '2024-03-05', 'user'),
(126, 'Sinta Hartono', 'b96f6d1a21e18fdefa7aa049e35d7fe3', '2024-06-06', 'user'),
(127, 'Putu Lestari', '7f3ee1512562d09f594022f402dcb4af', '2024-04-29', 'user'),
(128, 'Citra Sari', '7239fbfbafcdd6576bf7ef747590eb78', '2024-03-15', 'user'),
(129, 'Eko Hartono', '3e138ca53775248d68a6c8f50d2b515b', '2024-04-12', 'user'),
(130, 'Xenia Lestari', '76103690dcec7fd7b41d43f0d57f53f4', '2024-01-05', 'user'),
(131, 'Dewi Nugroho', '745da096a1338f9cb162907d66e47657', '2024-01-17', 'user'),
(132, 'Maya Suryadi', 'd5ed2d3152c92b24922cc3783d429ef3', '2024-05-15', 'user'),
(133, 'Oka Suryadi', '56e1fa51003f2cb91683eadb60ca1172', '2024-04-07', 'user'),
(134, 'Oka Sari', '088622baa7bf942f7c703edf85f7afe1', '2024-05-06', 'user'),
(135, 'Yudi Santoso', '4bd2ee50360f947057b375046efc064e', '2024-05-27', 'user'),
(136, 'Qori Santoso', '3dc2394073de28660df8e77fd8554564', '2024-04-21', 'user'),
(137, 'Yudi Rahayu', '8fbd1c5e1fc2bc0275fab587e074159f', '2024-05-14', 'user'),
(138, 'Sinta Gunawan', '5bce229f3c493cb92fd0f7e2ad26ade0', '2024-01-09', 'user'),
(139, 'Gita Wijaya', 'c2c3c1faeac04a2bc09c6a53e82b43ea', '2024-06-19', 'user'),
(140, 'Umar Susanto', '1145f21a0f6c027572d08d0a983745b8', '2024-06-08', 'user'),
(141, 'Zara Sari', '84cdaac12a1bcb022b7672f176016fed', '2024-05-01', 'user'),
(142, 'Gita Pramono', 'b1e1d73e76004fbdaca928b0a4dabff6', '2024-03-17', 'user'),
(143, 'Hari Rahman', '938198ec82f74c1460e985d7f82f83d8', '2024-01-15', 'user'),
(144, 'Zara Pratama', '0905774b9d7c3710ed1f777b635bcd30', '2024-01-14', 'user'),
(145, 'Intan Suryadi', 'd99ad4b8553194e4e3ac2d1c87bd527f', '2024-02-14', 'user'),
(146, 'Maya Wibowo', '941bc49a48993de02ac1a9629aa71491', '2024-04-15', 'user'),
(147, 'Ahmad Utomo', 'ef96fa1f73d505235c25de29ac14891a', '2024-03-17', 'user'),
(148, 'Oka Setiawan', 'e3023c2c8abef6d7d83a90fb647b4733', '2024-02-20', 'user'),
(149, 'Fajar Setiawan', '0ab053547662ec240d97998ae595f267', '2024-03-27', 'user'),
(150, 'Taufik Sari', '260d36ef2de5ca89c86b7ab672fd3ff5', '2024-03-28', 'user'),
(151, 'Fajar Susanto', '5b7fdd8555750ca28bf6aad4cedf3c7e', '2024-02-03', 'user'),
(152, 'Sinta Rahayu', '6bb47e0a5d7b1680b146f3487aac8007', '2024-05-17', 'user'),
(153, 'Umar Susanti', '7039795ad689a247fb4c1a1428d5322e', '2024-02-03', 'user'),
(154, 'Citra Setiawan', '38ac66e8330560908cdb3c19eba718c4', '2024-01-12', 'user'),
(155, 'Joko Utomo', 'a020c2b53c7936d401ccefacd48b5941', '2024-02-25', 'user'),
(156, 'Putu Hartono', 'de8665a32bbc29bca8ec145af01854da', '2024-04-03', 'user'),
(157, 'Vina Rahayu', '9b741d5f212f5e854763907c9e4df07d', '2024-06-13', 'user'),
(158, 'Oka Pratama', '0acc9d865e2c3df3a8800d4d3c497411', '2024-04-18', 'user'),
(159, 'Taufik Lestari', '6dc453f273e654a23ede691e0927fe97', '2024-02-02', 'user'),
(160, 'Taufik Saputra', 'c936284b4665c3880dc0aff12af40fc1', '2024-06-12', 'user'),
(161, 'Lina Utomo', 'b09da80c2ccef6df60680ec25d3fe949', '2024-02-02', 'user'),
(162, 'Fajar Hartono', 'd9277879c6983ccd265675c33cecedc4', '2024-01-13', 'user'),
(163, 'Joko Saputra', '198cb8b687fe200eec6de96f88a98cd0', '2024-02-29', 'user'),
(164, 'Rini Suryawan', '13d806c3dbda778141fb9a735c93219d', '2024-02-06', 'user'),
(165, 'Joko Lestari', 'c2ba2196acd57324fa56ccf916b41ab3', '2024-02-02', 'user'),
(166, 'Fajar Santoso', '4b65c416891f387bc3b524ed4ae7543f', '2024-01-19', 'user'),
(167, 'Putu Santika', '337a8ab1c3c508e6ecefa61adef4abff', '2024-03-31', 'user'),
(168, 'Fajar Nugroho', 'ab002a610745a8d17d6a666d778c6e76', '2024-06-22', 'user'),
(169, 'Joko Santoso', '02b653cbf71ab40cacec92ed29740409', '2024-06-13', 'user'),
(170, 'Wawan Sari', 'cd5ac5efdf2e63eb849d626666ea5960', '2024-01-15', 'user'),
(171, 'Taufik Wibowo', 'd08505a5f9cdbb5b9dcc48f8c3982be9', '2024-03-15', 'user'),
(172, 'Zara Setiawan', 'ac70eb66c2cb4c641c7cd2667372141c', '2024-02-15', 'user'),
(173, 'Xenia Pratama', '0a9b3c7945e2a9dc0c1424564aba332a', '2024-05-15', 'user'),
(174, 'Dewi Lestari', '3892fa04435a2305420ee954f44adb25', '2024-01-24', 'user'),
(175, 'Eko Setiawan', 'a220bf289a08e507fdfd9263b46d2307', '2024-05-07', 'user'),
(176, 'Umar Utomo', '02ee7017e2dcc0162d4ce124d9d48d50', '2024-02-24', 'user'),
(177, 'Umar Wibowo', '3f1aa02f954bdb24edfb94027b42a644', '2024-06-23', 'user'),
(178, 'Yudi Sari', '11e7c9a6a8d8f70689e678eebbd2c3e2', '2024-05-30', 'user'),
(179, 'Hari Susanti', '349cc8fd881c48c7c7279c49c6905e08', '2024-03-18', 'user'),
(180, 'Putu Putri', 'bb30da294b5509f6c6d2b23e29152423', '2024-06-05', 'user'),
(181, 'Zara Wijaya', '677f48fbb08fe68dccbd7f8a838f213e', '2024-05-24', 'user'),
(182, 'Lina Lestari', '4bb3af4aa688c9d4066314689f7bc809', '2024-04-16', 'user'),
(183, 'Intan Saputra', '40c03fdea2c59f2493d89f50e2309a4f', '2024-06-17', 'user'),
(184, 'Fajar Rahman', '3f31839a12889bf340e55e8b92abbab4', '2024-06-26', 'user'),
(185, 'Zara Susanto', 'fa0cd0e0c4689d477ca23fb8815ccb8d', '2024-04-27', 'user'),
(186, 'Oka Susanti', 'ba59364c284c667a85ad32ca1997438c', '2024-03-14', 'user'),
(187, 'Zara Putri', 'dca469fa1e835184d3f18a3d0f4a5c42', '2024-05-14', 'user'),
(188, 'Intan Gunawan', '69724e68ed5d014862387be8ee9f65bb', '2024-03-11', 'user'),
(189, 'Kiki Nugroho', '0debf610478681f43d29c0a1fbd1e006', '2024-01-06', 'user'),
(190, 'Intan Hartono', 'e0853b14544298a57767c6a270e053f8', '2024-02-20', 'user'),
(191, 'Sinta Zulkarnain', '9bd05ea11640f781d09d7854f0376602', '2024-01-24', 'user'),
(192, 'Sinta Susanto', 'f549d4960c272ba4e87d395cd30b4547', '2024-06-21', 'user'),
(193, 'Maya Santika', '809e368bc94890b018be42d23b4f60dc', '2024-02-10', 'user'),
(194, 'Hari Rahayu', '53d55a4c939035f4143598f0a4cad520', '2024-03-30', 'user'),
(195, 'Lina Rahayu', '49b39e529ca79998744a795ff605bc91', '2024-05-16', 'user'),
(196, 'Zara Zulkarnain', '65b91b76703223161f4a6ce36345fdca', '2024-06-22', 'user'),
(197, 'Lina Susanti', '90ec85afd6f9296e8b9693f5cbb31b53', '2024-05-30', 'user'),
(198, 'Rini Santoso', '0b0db4dd9f725bd518a355c9a41012dd', '2024-06-16', 'user'),
(199, 'Qori Zulkarnain', 'e6665ed5dbf24bd74f4c26994628f40b', '2024-03-05', 'user'),
(200, 'Intan Pramono', '9613c5c52e10059b7b59fa84953200a2', '2024-06-01', 'user'),
(201, 'Intan Wijaya', 'a392621ce125d0a87f013143feaa2951', '2024-04-30', 'user'),
(202, 'Wawan Lestari', '7b034f3bc784e4cba7b1f686b00942e5', '2024-06-05', 'user'),
(203, 'Yudi Putri', '0c61676110d380f0129a3a518311d3c9', '2024-06-10', 'user'),
(204, 'Wawan Susanti', '7002248621658a8e714080350051b2b5', '2024-06-16', 'user'),
(205, 'Maya Kurniawan', '4df53da32d0ae6b6a2ee88d65aedd19f', '2024-06-26', 'user'),
(206, 'Joko Susanti', '35d39da6191bb0037444e20632d94e6e', '2024-06-25', 'user'),
(207, 'Umar Lestari', '1eee63d21e47986ee0523d38bc754391', '2024-04-10', 'user'),
(208, 'Ahmad Putri', 'fad922b9354de1bb34651cec69883ba9', '2024-06-21', 'user'),
(209, 'Taufik Kurniawan', '5f3f7d540cf7c20501a8579d1fddfd68', '2024-02-16', 'user'),
(210, 'Eko Rahman', '644deed54b047f776be411670aecb293', '2024-06-05', 'user'),
(211, 'Taufik Nugroho', 'ee38e738e8a17e5c4a12967395910c86', '2024-06-23', 'user'),
(212, 'Dewi Putri', '39489127c30a9234e5cd12393c7b19cf', '2024-06-21', 'user'),
(213, 'Taufik Pratama', '2b82b90b4e79e35facb024202d83ddaa', '2024-02-03', 'user'),
(214, 'Kiki Susanto', 'df0ab3fabdd7fbd2f75e9c46f988a423', '2024-05-29', 'user'),
(215, 'Nina Saputra', '18cdfc117e5334e8939ce225d8fa048c', '2024-03-07', 'user'),
(216, 'Zara Utomo', 'f48234fdff6bd9e6740e060d4adb1c11', '2024-02-06', 'user'),
(217, 'Ahmad Saputra', '303da4453930c989a64e4cabbe46acc0', '2024-03-22', 'user'),
(218, 'Dewi Wibowo', '3ee5b30e93750d9779822ab1593410fd', '2024-06-03', 'user'),
(219, 'Zara Santoso', '37fadafe40ce55d2138f645f8249ed98', '2024-04-04', 'user'),
(220, 'Wawan Santika', '5ef3a9df349aa8a2fae6e25c4ef6348e', '2024-02-11', 'user'),
(221, 'Citra Santoso', '5c17c55050fb33b97263f7dfa3356810', '2024-01-22', 'user'),
(222, 'Qori Hartono', '3dff1d8ae425a7b9c8380367668c9c1c', '2024-01-08', 'user'),
(223, 'Ahmad Santika', 'f218522bff01178ef58d68645beeb370', '2024-04-26', 'user'),
(224, 'Budi Rahayu', '9580a85eda26381828b5886b45b1a045', '2024-01-15', 'user'),
(225, 'Nina Suryadi', '4da925ed1c922a3d098654c336c603cc', '2024-04-21', 'user'),
(226, 'Putu Suryadi', 'cd04bc0a32c983ab39bb1428489e4206', '2024-05-24', 'user'),
(227, 'Taufik Setiawan', '95f78d82dd7a19de8f23912a04a6f5fd', '2024-02-18', 'user'),
(228, 'Maya Saputra', '48ea901298f594241b984eb4836f5996', '2024-01-08', 'user'),
(229, 'Nina Rahman', 'eac61d6893b105ccd1c8bad178f5cec0', '2024-01-24', 'user'),
(230, 'Intan Zulkarnain', '1ce15ba87b5f77e2ad4b6e46cf58f26b', '2024-04-19', 'user'),
(231, 'Lina Hartono', 'e88c57c8a0a985224bb74d674f56c66a', '2024-05-27', 'user'),
(232, 'Oka Saputra', '1f34ac0adb16dc9b7bc64ce6b47e42e3', '2024-01-08', 'user'),
(233, 'Dewi Pramono', '05bc554b07795a487a5f68e22242fc50', '2024-04-16', 'user'),
(234, 'Hari Wijaya', 'bd6c9ddb6ea8e42ff21aec308f2fa369', '2024-02-06', 'user'),
(235, 'Rini Rahman', '04a62fcf71deaefc124aee648a4d0ca5', '2024-01-04', 'user'),
(236, 'Sinta Santika', '0de4cbf1f5e906e429534ff663c829b8', '2024-02-19', 'user'),
(237, 'Xenia Pramono', '58661bf7755b1c1804c1b380163771c7', '2024-04-06', 'user'),
(238, 'Ahmad Setiawan', '5ee6ebc19554fbdcac120f8769652617', '2024-03-04', 'user'),
(239, 'Gita Rahayu', '22974921243ceff258782edfc4fb60bc', '2024-04-19', 'user'),
(240, 'Wawan Zulkarnain', 'c6efd8dcc6b18d5cb5d768d7c1ea72ce', '2024-05-02', 'user'),
(241, 'Oka Utomo', 'f95f57adad732a13b3500ebb5b63e73d', '2024-04-18', 'user'),
(242, 'Citra Wibowo', '8be7f15e835975cb1fe43a29e2414f3e', '2024-04-05', 'user'),
(243, 'Xenia Santika', '7183ae17e01a666c19646278b4f83c84', '2024-04-28', 'user'),
(244, 'Oka Rahayu', '5cfda73b015122d413b4580bea3b3579', '2024-02-16', 'user'),
(245, 'Citra Lestari', 'adf6653ed22fac35b65236533bd43aca', '2024-04-17', 'user'),
(246, 'Hari Gunawan', '9d3dc25be3032934f547f3cd70b9b090', '2024-01-22', 'user'),
(247, 'Kiki Hartono', 'ac0ae42612cd9452dc0d1ae4ae97b2b7', '2024-01-10', 'user'),
(248, 'Wawan Nugroho', '2a07553dba4e55513b7da21aec1c5ad9', '2024-02-19', 'user'),
(249, 'Oka Pramono', '99da5b4da2c54907e5cfa0583d89ec43', '2024-01-31', 'user'),
(250, 'Oka Santoso', 'b178c013365c06749eddfa8ded9281d8', '2024-02-24', 'user'),
(251, 'Xenia Saputra', '1d81e24489595d81096404da4e2bce2f', '2024-01-30', 'user'),
(252, 'Xenia Sari', '955a8a3723a098d65550aa80a4cee38e', '2024-02-18', 'user'),
(253, 'Vina Pramono', 'b0fe8c4c6b45aeef16216318b7556377', '2024-05-02', 'user'),
(254, 'Sinta Saputra', '8f212dc646f77e36b0c5128b9755e923', '2024-03-20', 'user'),
(255, 'Sinta Sari', '55122ebaabb0a7f1d4ec89afc60e5360', '2024-01-24', 'user'),
(256, 'Taufik Susanti', 'b874353b85c8dc9b19d49833ac3e40b8', '2024-05-05', 'user'),
(257, 'Citra Santika', '6ee8a5e63836258e9d377e6719c62d7f', '2024-06-25', 'user'),
(258, 'Vina Putri', '3f08a3984b661e237d453edc1c8d5bcd', '2024-05-11', 'user'),
(259, 'Gita Santoso', '7733ff4b5be59836c72506aeca2ec4ff', '2024-02-22', 'user'),
(260, 'Zara Susanti', '4e93575394bbc5736d67df275c6d144d', '2024-05-18', 'user'),
(261, 'Citra Rahman', '51727180a7a92d62beb4031bb0135456', '2024-05-23', 'user'),
(262, 'Dewi Sari', '95d0111ef7f78c652cd3462c9fc87623', '2024-05-31', 'user'),
(263, 'Dewi Suryadi', '20bfa7e08fd30a8a3e453aa8e998a4c8', '2024-06-12', 'user'),
(264, 'Joko Rahman', '33399b23a703d672c64961b13a993fb6', '2024-02-07', 'user'),
(265, 'Lina Putri', '4ac10fb3dfce5eeb63ad1b348a479159', '2024-03-09', 'user'),
(266, 'Intan Santoso', 'd8033d10e545b2863a2a1ff28ec3e7c6', '2024-06-22', 'user'),
(267, 'Zara Lestari', '36bf23c5e52f6375448dbd7378435b93', '2024-05-17', 'user'),
(268, 'Oka Putri', '5a30f3df4c9239a1f67feca858005221', '2024-04-20', 'user'),
(269, 'Sinta Rahman', '72ffe677b9b5b7ab861f60270a361141', '2024-06-22', 'user'),
(270, 'Lina Setiawan', '10133c9fafc7485aaf08c7365da3d580', '2024-05-16', 'user'),
(271, 'Taufik Santoso', 'f4cd80e20e991027a71536a154861962', '2024-05-25', 'user'),
(272, 'Wawan Pratama', 'dcd245b8045976960aa87e8c808cef10', '2024-06-02', 'user'),
(273, 'Intan Putri', '0a74462fd8bf7a1ff4640953bc2d605e', '2024-04-18', 'user'),
(274, 'Hari Putri', 'ea2b98bcb49b0418b068aaa44f650f78', '2024-03-31', 'user'),
(275, 'Nina Wibowo', 'e2391c267347b7c3cbc306eb6f496871', '2024-01-09', 'user'),
(276, 'Rini Susanto', '37f378767191daba1bc2210ca76e92c6', '2024-03-31', 'user'),
(277, 'Gita Utomo', '4fa5759916a6ac38bba73d7a467692f3', '2024-04-16', 'user'),
(278, 'Oka Gunawan', 'b9ac62c2731bb564ef3f2482ffadd21f', '2024-02-01', 'user'),
(279, 'Fajar Suryawan', '9ea99e74437dfd49cf0369f44cbc5811', '2024-03-09', 'user'),
(280, 'Vina Susanti', 'c3205c0f24f6a703be7d35f1db87aca9', '2024-02-27', 'user'),
(281, 'Hari Susanto', '25e144d000f4727e1a09f4e0e71aa131', '2024-03-20', 'user'),
(282, 'Fajar Sari', 'f0507815916da7c02f850608d8e71bdc', '2024-02-17', 'user'),
(283, 'Xenia Utomo', 'd41737830a3bc50af4e8d3bafa39d054', '2024-05-17', 'user'),
(284, 'Budi Santika', '32c28ad327dd62cb67ae1ec40afed75e', '2024-05-23', 'user'),
(285, 'Putu Zulkarnain', 'c3af3eb23b7eee430335f2875648f9ec', '2024-04-17', 'user'),
(286, 'Citra Nugroho', '1670fdb5319fc23811f1339f95556586', '2024-02-10', 'user'),
(287, 'Xenia Suryadi', 'baa9a96d4d8eae001b62d77f359efd62', '2024-05-16', 'user'),
(288, 'Vina Suryadi', '0c8238ad6f8c28e6f30bdc831fe5e5b7', '2024-04-26', 'user'),
(289, 'Zara Rahman', '7318cfb2e9346031f3222833939085e7', '2024-06-07', 'user'),
(290, 'Maya Hartono', '1b84b16beee9986a9bc17d2c5093c53e', '2024-04-04', 'user'),
(291, 'Fajar Wijaya', 'f9568e3e3cb0030c5c313b381973d397', '2024-05-27', 'user'),
(292, 'Budi Suryadi', '0da1f7c93ff9bede460d8368335e14f3', '2024-02-18', 'user'),
(293, 'Dewi Utomo', 'd8869f7e0233309177ae5cc2773dd642', '2024-05-26', 'user'),
(294, 'Qori Nugroho', '3bdbe1a565224b78e8bcbb1e15223c2b', '2024-02-14', 'user'),
(295, 'Ahmad Suryadi', '9fd2076b5c23cf14d0923b69b8cb2912', '2024-01-29', 'user'),
(296, 'Taufik Suryawan', '5bebdcfba4946c6654afbc0aa58c4220', '2024-05-26', 'user'),
(297, 'Gita Lestari', 'a859632878a1cc36d047a7a2f71c5d9f', '2024-04-11', 'user'),
(298, 'Vina Nugroho', '27766caecc04b4d4bc1bb1a1220a7c01', '2024-05-16', 'user'),
(299, 'Nina Suryawan', 'b272f97bdc81d5918f6f5ad8d200776f', '2024-02-28', 'user'),
(300, 'Rini Lestari', 'f4a8f5bd48681e458d82c74a38486687', '2024-05-08', 'user'),
(301, 'Lina Suryadi', '426a83e47699f51564581d6b928e133d', '2024-03-19', 'user'),
(302, 'Maya Pramono', 'bde61a2b485344931ed90ea339aa1a74', '2024-03-10', 'user'),
(303, 'Nina Setiawan', '73301b1960df666ff17ac6f30ae9606b', '2024-05-16', 'user'),
(304, 'Hari Saputra', 'ca0ecf32c38622b3f168815cfadf7c43', '2024-02-07', 'user'),
(305, 'Zara Gunawan', 'e83b3f37dc1dda39195bfebdd1d6e6c7', '2024-05-21', 'user'),
(306, 'Fajar Kurniawan', 'c7cf2143b3027c7aaffdc9d5c67b8811', '2024-02-25', 'user'),
(307, 'Ahmad Zulkarnain', 'be3558b1863102a9910af61c54cf887d', '2024-06-19', 'user'),
(308, 'Joko Gunawan', '0ef786c18550d824e7d2d2bdc1e902d2', '2024-05-20', 'user'),
(309, 'Hari Suryawan', '0e8e5ecdbe3bec473dfe5557e5ab5056', '2024-06-02', 'user'),
(310, 'Citra Wijaya', '1246f2660d2ccb36a3be80edb2f4bbd0', '2024-06-19', 'user'),
(311, 'Citra Rahayu', '9ce4b3b877161e962e1ca4212a7e2eac', '2024-03-28', 'user'),
(312, 'Hari Lestari', 'cb15c3c950a0ea9088471bce882425f3', '2024-02-18', 'user'),
(313, 'Fajar Santika', 'ce63e56f68ddb7bec31962c52d1d30c0', '2024-02-05', 'user'),
(314, 'Citra Suryadi', '01615fe55ccc278a36b440b8a0625cfd', '2024-04-11', 'user'),
(315, 'Kiki Utomo', '26d8bec8ca28990d449cb4ec6bd69419', '2024-01-02', 'user'),
(316, 'Eko Utomo', 'c5395af2dfa7c6430067b5563f4518fc', '2024-06-11', 'user'),
(317, 'Budi Lestari', '398a345fef511302beb1a73adec0027a', '2024-05-16', 'user'),
(318, 'Intan Santika', '01910cc521c6ec93d3675a31dce937bf', '2024-01-08', 'user'),
(319, 'Nina Gunawan', '9604900504c2062952e47c5f97174f17', '2024-04-29', 'user'),
(320, 'Gita Gunawan', '26a36d520580fc2d9dd1c2bfea8ed280', '2024-05-08', 'user'),
(321, 'Oka Suryawan', '7b5c0e14bed9a0347994c7f75795554f', '2024-04-19', 'user'),
(322, 'Sinta Kurniawan', '2b83041a0d4be459ebb70e051ffc96c4', '2024-03-15', 'user'),
(323, 'Budi Wijaya', '829ef7fd6a691daa90e5758180100321', '2024-04-08', 'user'),
(324, 'Fajar Pramono', '8c2fdd2f9be54b81634530cab9f2a90d', '2024-03-11', 'user'),
(325, 'Wawan Wibowo', '0d96a709d26f7e5f83556d174439b17b', '2024-04-04', 'user'),
(326, 'Gita Susanti', '93d82af69410cbf49f09ab82caee29e2', '2024-02-28', 'user'),
(327, 'Oka Susanto', '2741ec4bf8f76312f30a7ddd2a891328', '2024-01-26', 'user'),
(328, 'Eko Susanto', '6b54391405b9c43aae1b8be0eac13687', '2024-05-13', 'user'),
(329, 'Hari Nugroho', 'baba616643004f1c14dba34f7149edee', '2024-02-17', 'user'),
(330, 'Qori Santika', 'c7c31305d991c6bdfc07855a44662d08', '2024-05-04', 'user'),
(331, 'Taufik Utomo', 'adc98fc190d49ab38d7c350272f2a71e', '2024-01-13', 'user'),
(332, 'Eko Rahayu', '1dc0fd7ef93f513b8fcb099e12aac45f', '2024-06-21', 'user'),
(333, 'Kiki Pramono', 'f3fe52f216bc502182e999df518d38c2', '2024-06-26', 'user'),
(334, 'Kiki Lestari', '84fdc7d6ef9de6a8c0113a9bb9acc549', '2024-06-09', 'user'),
(335, 'Fajar Rahayu', '3e4d4a1af50dc41f0c1296a7cac6ee44', '2024-06-08', 'user'),
(336, 'Maya Suryawan', '67e389f68d6e6da06b7c4f9c0e0c856d', '2024-06-04', 'user'),
(337, 'Eko Susanti', 'cc10476845aba8121b95795b67df02ac', '2024-04-09', 'user'),
(338, 'Nina Pramono', '20bf1cab24a98243fad1239d3d993d3e', '2024-04-27', 'user'),
(339, 'Sinta Setiawan', 'cb6300d0cf39c940e9e6cce64b229511', '2024-05-19', 'user'),
(340, 'Yudi Saputra', '0804d2997cc1df2e9b08e1c04b4c5249', '2024-01-15', 'user'),
(341, 'Budi Kurniawan', '83cd47bf50efc0f9f8cf5d17b55ece32', '2024-04-27', 'user'),
(342, 'Taufik Suryadi', '4373bf7b3516b2e788dcc8ec6977e0b7', '2024-05-28', 'user'),
(343, 'Vina Pratama', '2e40a4d33de0d57b50e78f1ade1c8aa6', '2024-01-07', 'user'),
(344, 'Nina Sari', '742702141c86e37fc89eb98db49ff099', '2024-05-27', 'user'),
(345, 'Xenia Nugroho', 'ff9dd9bd0aa3fd7d5ab920a1b4184f14', '2024-06-19', 'user'),
(346, 'Fajar Suryadi', 'bd87f71caa21d803a13aed01040d110e', '2024-01-01', 'user'),
(347, 'Dewi Rahman', '3d1bd81ab3a8c5804877ccbe91267394', '2024-02-25', 'user'),
(348, 'Eko Sari', '599788a4a3712f93c4b38f559861bc7a', '2024-01-09', 'user'),
(349, 'Yudi Wijaya', 'cf1f8441d27e7431585be64877d20847', '2024-05-16', 'user'),
(350, 'Sinta Putri', 'b058995041a7adcd91f59fa50a3e159d', '2024-06-05', 'user'),
(351, 'Budi Zulkarnain', 'ff51a04bfe9d98d34669cb3d8912269d', '2024-01-21', 'user'),
(352, 'Intan Suryawan', '1224c24838d537c79a420d41c114d315', '2024-04-07', 'user'),
(353, 'Budi Pratama', 'f14f13eb92e8e464eb15eddd8778c9c3', '2024-02-21', 'user'),
(354, 'Nina Putri', 'ab8fa385af2120e36d844fb36f9dd7c9', '2024-03-08', 'user'),
(355, 'Ahmad Pratama', 'a0ba6c1e6f78d03050651269e86bba02', '2024-05-04', 'user'),
(356, 'Joko Setiawan', 'd4096c7d6f1126f703ec2c2a17e8da5d', '2024-04-13', 'user'),
(357, 'Citra Susanto', 'c7739c102f213ad96f50dcf8fb23112e', '2024-03-22', 'user'),
(358, 'Umar Wijaya', 'a717c4a5503c509f677148e567c1e5d3', '2024-01-04', 'user'),
(359, 'Rini Santika', 'd7fb7f54744064a73246bf63957096b1', '2024-05-29', 'user'),
(360, 'Vina Wijaya', '2ee896ee3821aef6d7da444ac4acc0c3', '2024-02-07', 'user'),
(361, 'Nina Zulkarnain', 'cf32f35a9f561fba4bfe66b765692867', '2024-01-08', 'user'),
(362, 'Nina Kurniawan', '5bb2ca18f69e25ce9b093c81c41af978', '2024-01-01', 'user'),
(363, 'Dewi Wijaya', 'e39f9deafa971f7a96142ac639ac908e', '2024-05-31', 'user'),
(364, 'Wawan Hartono', 'fa869210d74048004f19b3fb2baf0a10', '2024-05-15', 'user'),
(365, 'Nina Rahayu', 'dac96995593388325487194749aa9862', '2024-02-06', 'user'),
(366, 'Kiki Rahman', '5f772a0bc488a2314a3e5b58a02f5435', '2024-03-15', 'user'),
(367, 'Budi Rahman', '6f3a6712b809a7726a10881f9d76b4e0', '2024-04-18', 'user'),
(368, 'Joko Suryawan', '1c00a890fcffa4869338f68ba0564148', '2024-06-03', 'user'),
(369, 'Putu Santoso', '5494bdab263e46eaba56cb457d68d095', '2024-06-26', 'user'),
(370, 'Putu Rahayu', '5edfcd646cf354d4c9c55943c4df48ba', '2024-01-09', 'user'),
(371, 'Rini Gunawan', '0c7655d4d40e13f422b3f0cb0fe55d0b', '2024-05-08', 'user'),
(372, 'Maya Sari', 'c57d81d1b02092bd419d41f6537ddb9a', '2024-02-13', 'user'),
(373, 'Dewi Pratama', 'd91556f728043b4007ba7354cdfe600b', '2024-03-28', 'user'),
(374, 'Intan Pratama', '662adc62bdfed26883847cdbf5989fea', '2024-06-21', 'user'),
(375, 'Xenia Wijaya', 'ae69e551d75695028652bd7f5bceaf96', '2024-01-25', 'user'),
(376, 'Nina Wijaya', '24ead6d7e4f4c9054a4d0eeb75b15ee2', '2024-03-03', 'user'),
(377, 'Xenia Zulkarnain', '90c2b18c6688bd1a981ef071ae869a3e', '2024-01-23', 'user'),
(378, 'Hari Wibowo', '61545e61c795a57c0270036b51fc8947', '2024-03-02', 'user'),
(379, 'Qori Sari', 'e53df0d28938d023442d5c3807affc07', '2024-02-18', 'user'),
(380, 'Hari Santika', 'fb89a5af8e5213e0c8f0d029e4a2b6f0', '2024-06-05', 'user'),
(381, 'Yudi Lestari', 'a22cfcb871d4be58056c7206d270ea65', '2024-06-12', 'user'),
(382, 'Yudi Susanti', 'd17a8680e3476e72a93a9bd5eedea558', '2024-04-27', 'user'),
(383, 'Rini Nugroho', 'dcf07ee4e4cc6b9555577c0e9fd87804', '2024-03-18', 'user'),
(384, 'Xenia Rahayu', '0265e252c59707df71a28ee9e9f855b1', '2024-05-25', 'user'),
(385, 'Qori Lestari', 'f49069bed9c1bc5572cacf618d93ef73', '2024-03-04', 'user'),
(386, 'Ahmad Suryawan', 'e12b4e091d4258d686ce69a7d9a6ed0d', '2024-06-20', 'user'),
(387, 'Putu Pratama', 'a885fea9f473d4190d141d3ec3ca5fd3', '2024-06-23', 'user'),
(388, 'Umar Zulkarnain', '8353d5681ff6a1405874a0b2df3c1df5', '2024-04-03', 'user'),
(389, 'Intan Susanto', 'dfcc9025de3825c764a18991af446143', '2024-03-29', 'user'),
(390, 'Gita Zulkarnain', 'c2c230f249e64b18892409c82b609212', '2024-06-05', 'user'),
(391, 'Yudi Utomo', '6f282124bceed9ab4fe654cee8f28799', '2024-04-08', 'user'),
(392, 'Eko Wijaya', 'dec2bb87193cd16120c1c7de7f511aad', '2024-02-04', 'user'),
(393, 'Rini Wibowo', '40fd84b0b00c18c7caec3eb6f437a7d7', '2024-02-29', 'user'),
(394, 'Citra Susanti', 'c375d926bde413fcfe24c1dcf5c26b04', '2024-03-19', 'user'),
(395, 'Vina Lestari', 'cf6acc99535faf5058b2d2571dac7285', '2024-02-15', 'user'),
(396, 'Lina Kurniawan', '14675a2755601a5eedbe81f5ac9f7740', '2024-01-06', 'user'),
(397, 'Joko Pratama', 'b3006de542bd9b0f302a85791db334ce', '2024-03-11', 'user'),
(398, 'Lina Gunawan', '995bf028956fa146b8ada2c6dcd9b86c', '2024-04-12', 'user'),
(399, 'Fajar Susanti', '62d8116dad7cbab1be14701d853a9a92', '2024-02-12', 'user'),
(400, 'Wawan Utomo', '41d6414b8c135302105206d43a9633f4', '2024-04-03', 'user'),
(401, 'Taufik Pramono', '32874d2d99d419c5b7fce9c2a989c837', '2024-04-17', 'user'),
(402, 'Intan Nugroho', '563b8b09da98a56e4eeaf0d401985a01', '2024-03-10', 'user'),
(403, 'Fajar Gunawan', '18ddf9cfb03ae42fb2ffd15c34302df3', '2024-06-23', 'user'),
(404, 'Dewi Santika', 'd0c7b9a5ef524ae8e737273ae1611089', '2024-04-08', 'user'),
(405, 'Joko Putri', '4bcf98376a05769365623319b1f3456b', '2024-04-07', 'user'),
(406, 'Sinta Suryadi', 'cf3aaadc90b82f6bf3c820a3719374d7', '2024-06-23', 'user'),
(407, 'Citra Putri', 'bf019ae1b323297c55bb1a88e03aef98', '2024-02-28', 'user'),
(408, 'Eko Nugroho', '08f7d05e8afbde935aa88737df813144', '2024-05-06', 'user'),
(409, 'Budi Santoso', '2bf7adcea4af3f6903bcfa9de1423285', '2024-03-14', 'user'),
(410, 'Zara Hartono', '9a9ba5025fe7e5cb26d49933a0fd0041', '2024-05-27', 'user'),
(411, 'Gita Sari', '29bb04b064e148295faa53c8a7dd18fe', '2024-04-13', 'user'),
(412, 'Yudi Pratama', 'a5f575695af2bd946216164d049cba4f', '2024-03-05', 'user'),
(413, 'Kiki Setiawan', '5112c1e4bef6645e9c95c9362f202aa8', '2024-01-10', 'user'),
(414, 'Maya Rahman', '4b028afb78fb0515ab962a9d5d5f5a3c', '2024-01-03', 'user'),
(415, 'Umar Kurniawan', '9ae934b5e2a8db4f5f9fbc1653f5b843', '2024-02-23', 'user'),
(416, 'Oka Wijaya', '138a87d689cc7f7a373dace1e23cddb7', '2024-02-07', 'user'),
(417, 'Wawan Pramono', '84c8a604c15a6e58b9ee566ba514155d', '2024-01-15', 'user'),
(418, 'Lina Santoso', '3276278444bef409b54daa4ed2f1063b', '2024-04-16', 'user'),
(419, 'Dewi Susanto', '9704b8df6ed8a35b98abdc11859152b3', '2024-01-24', 'user'),
(420, 'Kiki Sari', '98de7e5c9e1919008deccc8c67e89918', '2024-04-09', 'user'),
(421, 'Joko Wijaya', '4f3a6b34ef922e6148279dff10b5e12b', '2024-06-05', 'user'),
(422, 'Sinta Pratama', '279465f52e4ae228e360b8b1807628a8', '2024-01-02', 'user'),
(423, 'Joko Wibowo', 'e607b26c919d67adff7fd73435ebf26a', '2024-01-07', 'user'),
(424, 'Lina Pramono', '562304fe6004891c3fd8f9dc09a9cc73', '2024-03-19', 'user'),
(425, 'Ahmad Susanto', 'f8507e3100490fc6a3bfcf4a2c6c7eb0', '2024-01-03', 'user'),
(426, 'Qori Susanto', '303076bf5bd09c5f87a99c27ef864512', '2024-01-27', 'user'),
(427, 'Zara Nugroho', 'aeada7c86e91027d79db9b4b768f6e8a', '2024-02-29', 'user'),
(428, 'Taufik Rahman', 'e1d7fe530d586d5b7faa17189edef139', '2024-04-23', 'user'),
(429, 'Eko Zulkarnain', '6d19e440a56f7137658100f302b8aa10', '2024-01-30', 'user'),
(430, 'Budi Suryawan', 'f2fed82aed05dea80dd78f8db0dacc23', '2024-02-02', 'user'),
(431, 'Maya Setiawan', 'f1ec5971d6d3be842e09bef941079cf2', '2024-02-16', 'user'),
(432, 'Dewi Suryawan', '532532c47d06b7a430a536c0dfcf5d80', '2024-06-02', 'user'),
(433, 'Maya Susanto', 'cb4bb68375bde111c6702e713b1484fe', '2024-06-06', 'user'),
(434, 'Maya Nugroho', 'efba126bdba018aa4f398b48768e1991', '2024-05-14', 'user'),
(435, 'Vina Suryawan', 'ce9d546d1bbd5eab0273beb24922cf84', '2024-04-30', 'user'),
(436, 'Lina Wijaya', '52cbed860bc5c8a4dd954b6848a0c5a1', '2024-02-19', 'user'),
(437, 'Vina Susanto', '9f6bc59d36793b44a98ea8f6acefc8b7', '2024-03-25', 'user'),
(438, 'Oka Lestari', '6bf457d977035b3edf1b00421effa9c1', '2024-01-27', 'user'),
(439, 'Xenia Susanto', '7c90e43c2891791dd76331e2f9122c25', '2024-01-08', 'user'),
(440, 'Eko Suryawan', '15337a668f5d7f507ad816cd0a688803', '2024-01-08', 'user'),
(441, 'Kiki Suryadi', '1927f86c5cfcee2e4d385c25e383d996', '2024-02-18', 'user'),
(442, 'Sinta Utomo', 'ba46acdd69b44d0a3ef8eda98f9f5296', '2024-02-20', 'user'),
(443, 'Vina Saputra', 'bf844771282957604d48d441c3114567', '2024-06-20', 'user'),
(444, 'Kiki Santoso', '792842b8a339eb8fc6f87df319767fbc', '2024-03-03', 'user'),
(445, 'Ahmad Rahman', '935980ae9143671a6a461f4aee99db26', '2024-04-25', 'user'),
(446, 'Citra Kurniawan', '970b02015ab940b8b02387717ac48188', '2024-04-17', 'user'),
(447, 'Citra Suryawan', '2267149e05cf304b38c074086626e17f', '2024-01-24', 'user'),
(448, 'Wawan Saputra', '54c585620775902d698f6f1e7cfa007d', '2024-04-14', 'user'),
(449, 'Taufik Gunawan', 'b8342b03a31524eace50f9fb20b8a30e', '2024-04-11', 'user'),
(450, 'Umar Suryawan', 'fac8ca6a0f2563d683096153b02eab09', '2024-06-12', 'user'),
(451, 'Budi Setiawan', 'bf3f6dc997674d159cbfcb798b36bb1e', '2024-05-28', 'user'),
(452, 'Fajar Zulkarnain', 'dc743d93b25bcda4288909fb27b4910e', '2024-01-12', 'user'),
(453, 'Umar Santoso', 'fcc794877411ae3f9c1de76cb2b8440a', '2024-05-14', 'user'),
(454, 'Qori Gunawan', '959a92d752cb10bf3ed4b09b368bccb9', '2024-06-13', 'user'),
(455, 'Taufik Susanto', 'e4a3bb157ae588d3be222034180ac5d0', '2024-04-03', 'user'),
(456, 'Ahmad Sari', 'c659032b84c6beb732c98c015cd73e83', '2024-01-21', 'user'),
(457, 'Wawan Gunawan', '9927ebdd135b42fa5e42ffaf20ad324d', '2024-03-19', 'user'),
(458, 'Citra Hartono', '1e990b021aacd4407d2d4ecbeb475663', '2024-01-01', 'user'),
(459, 'Sinta Lestari', '5f7e9868c8c2cb6d0ff8a9fa695f19e9', '2024-06-16', 'user'),
(460, 'Joko Hartono', '3074454dcd170a3c618ec3fb9afabd65', '2024-04-01', 'user'),
(461, 'Rini Rahayu', 'dd569875d3ca796bfd2f89712b930b02', '2024-05-10', 'user'),
(462, 'Taufik Wijaya', '5b97823b985ddf0bd3156086e69c6c49', '2024-06-22', 'user'),
(463, 'Hari Suryadi', '40125fa48e4b7a9808cf136426766c3d', '2024-04-16', 'user'),
(464, 'Vina Setiawan', 'a0f4368da246a041dba4a267d1b41eb7', '2024-06-08', 'user'),
(465, 'Kiki Susanti', 'b121e05411a500b14a45d556c4a72d05', '2024-05-27', 'user'),
(466, 'Rini Setiawan', '5e5381469d75fa1564238b145d9b58fb', '2024-06-17', 'user'),
(467, 'Wawan Suryawan', '5a6bd20dffc7976b8b3a1e10575ec486', '2024-01-20', 'user'),
(468, 'Qori Wijaya', 'c051b1fd1ad10defce32337fdb17af5b', '2024-02-20', 'user'),
(469, 'Kiki Kurniawan', '1955af6bc1fbd0d142e82ca57a1e3075', '2024-05-28', 'user'),
(470, 'Eko Pratama', '177b06bdb95d8b3e76d8f5f108463778', '2024-01-02', 'user'),
(471, 'Kiki Wijaya', 'd9276695f76d23ddd383265f81f8da78', '2024-06-01', 'user'),
(472, 'Eko Santoso', 'a09fca7e44294d4898ab951e39d0692f', '2024-03-13', 'user'),
(473, 'Umar Gunawan', '765f2f631bcd25787372f60e8055512f', '2024-06-05', 'user'),
(474, 'Putu Nugroho', '83cd3ae2d6dde1a57cc0b3749c7cdbdd', '2024-06-27', 'user'),
(475, 'Yudi Rahman', '8ec3d8c59a7ef2c5970e4a7262dec1c4', '2024-04-06', 'user'),
(476, 'Umar Sari', '27f8c4eca9b13465e27c7ab46f0c7aa0', '2024-02-02', 'user'),
(477, 'Maya Lestari', 'e00d3725c52688dc85201abc8239301d', '2024-05-26', 'user'),
(478, 'Gita Suryawan', 'f50daad99f951248d3d30c678d1f873e', '2024-02-28', 'user'),
(479, 'Umar Suryadi', '3e16e1b11948b95a740b94209b12dfd1', '2024-06-06', 'user'),
(480, 'Xenia Putri', '106d978863b4c9fc0147fcd83df550ad', '2024-01-25', 'user'),
(481, 'Nina Susanti', '6f605c3a6fe6ae627f1f2ffd163e9573', '2024-02-23', 'user'),
(482, 'Oka Wibowo', '02122f59c1927b6b6d22ef43d4c0e369', '2024-02-21', 'user'),
(483, 'Xenia Susanti', 'd1be1269aa19cae667e2809bbb11ad96', '2024-04-29', 'user'),
(484, 'Budi Sari', '862a4420df22a34fce74bc6ff48d7dbc', '2024-04-25', 'user'),
(485, 'Eko Saputra', 'c602c16c64dae11d0061ca8e72b00a41', '2024-01-10', 'user'),
(486, 'Vina Rahman', '049f1af59282aeb3cdf34267b1680806', '2024-02-01', 'user'),
(487, 'Fajar Utomo', '11a12884406450dbd4ab4f19d2f40dcc', '2024-04-10', 'user'),
(488, 'Budi Gunawan', 'c4ccaad01875b5712735ddc79e83d5d7', '2024-02-05', 'user'),
(489, 'Zara Suryawan', '890bb0de25737bd5355348cc0cf6e9be', '2024-01-13', 'user'),
(490, 'Vina Santoso', '32acdb4645d7e6cb19120b546e534456', '2024-03-31', 'user'),
(491, 'Hari Utomo', 'cb2c4507df1f5a316d86179ba8ba6839', '2024-06-27', 'user'),
(492, 'Oka Rahman', '1a3fa8e67b2274267b1035a8df6d1112', '2024-05-11', 'user'),
(493, 'Eko Lestari', 'df0b05e6e0c83847bc5e25ae90d3c55c', '2024-02-10', 'user'),
(494, 'Sinta Pramono', 'ed148d900d96ccaf4ea2df98c75032ee', '2024-04-29', 'user'),
(495, 'Umar Pratama', 'dad771f17f1d0244cfc394a454d2649c', '2024-03-11', 'user'),
(496, 'Gita Saputra', '4100293178b12c8cdf967cda69d3cdac', '2024-01-28', 'user'),
(497, 'Qori Susanti', 'ce3e5454b7a895fe745b1b6ed58163bb', '2024-06-12', 'user'),
(498, 'Putu Wibowo', 'a1d14a84ab092915a5403fe578f1b904', '2024-06-10', 'user'),
(499, 'Nina Hartono', 'f00563d132f41c737c28e8d5e57d0ffe', '2024-01-19', 'user'),
(500, 'Intan Susanti', '241a0acbd5320db34cedaac795e72392', '2024-03-25', 'user'),
(501, 'Hari Santoso', 'fb8fb4eafcfec915c85e667cd5bc2acb', '2024-02-23', 'user');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `map`
--
ALTER TABLE `map`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `senjata`
--
ALTER TABLE `senjata`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idkategori` (`idkategori`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `kategori`
--
ALTER TABLE `kategori`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT untuk tabel `map`
--
ALTER TABLE `map`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `senjata`
--
ALTER TABLE `senjata`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=502;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `senjata`
--
ALTER TABLE `senjata`
  ADD CONSTRAINT `senjata_ibfk_1` FOREIGN KEY (`idkategori`) REFERENCES `kategori` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
