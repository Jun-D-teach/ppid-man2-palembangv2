-- MIGRASI CMS MENU WEBSITE PPID MAN 2 PALEMBANG
-- Jalankan file ini di phpMyAdmin jika tabel menu_pages dan menu_page_files belum otomatis dibuat oleh backend.

CREATE TABLE IF NOT EXISTS `menu_pages` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `parent_menu` VARCHAR(100) NOT NULL,
  `menu_label` VARCHAR(150) NOT NULL,
  `slug` VARCHAR(180) NOT NULL UNIQUE,
  `judul` VARCHAR(255) NOT NULL,
  `isi` LONGTEXT NULL,
  `status_publish` VARCHAR(20) DEFAULT 'Tampil',
  `position` INT DEFAULT 1,
  `is_builtin` TINYINT(1) DEFAULT 0,
  `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP,
  `updated_at` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `menu_page_files` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `page_id` INT NOT NULL,
  `nama_file` VARCHAR(255) NOT NULL,
  `nama_asli` VARCHAR(255) DEFAULT NULL,
  `mime_type` VARCHAR(120) DEFAULT NULL,
  `ukuran` INT DEFAULT NULL,
  `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT `fk_menu_page_files_page`
    FOREIGN KEY (`page_id`) REFERENCES `menu_pages`(`id`)
    ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT IGNORE INTO `menu_pages` (`parent_menu`, `menu_label`, `slug`, `judul`, `isi`, `status_publish`, `position`, `is_builtin`) VALUES
('PROFIL','Profil PPID','profil-ppid','Profil PPID','Isi profil PPID dapat diedit melalui Panel Admin > Atur Menu Website.','Tampil',1,1),
('PROFIL','Visi & Misi','visi-misi','Visi & Misi','Visi dan misi PPID dapat diedit melalui Panel Admin > Atur Menu Website.','Tampil',2,1),
('PROFIL','Tugas & Fungsi','tugas-fungsi','Tugas & Fungsi','Tugas dan fungsi PPID dapat diedit melalui Panel Admin > Atur Menu Website.','Tampil',3,1),
('PROFIL','Struktur Organisasi','struktur-organisasi','Struktur Organisasi','Struktur organisasi dapat diedit dan dilengkapi berkas melalui Panel Admin.','Tampil',4,1),
('PROFIL','Maklumat Pelayanan','maklumat-pelayanan','Maklumat Pelayanan','Maklumat pelayanan dapat diedit melalui Panel Admin.','Tampil',5,1),
('REGULASI','UU KIP','uu-kip','UU KIP','Konten regulasi UU KIP dapat diedit dan dilengkapi berkas melalui Panel Admin.','Tampil',1,1),
('REGULASI','Peraturan Menteri','peraturan-menteri','Peraturan Menteri','Konten peraturan menteri dapat diedit dan dilengkapi berkas melalui Panel Admin.','Tampil',2,1),
('REGULASI','SOP PPID','sop-ppid','SOP PPID','SOP PPID dapat diedit dan dilengkapi berkas melalui Panel Admin.','Tampil',3,1),
('REGULASI','SK PPID','sk-ppid','SK PPID','SK PPID dapat diedit dan dilengkapi berkas melalui Panel Admin.','Tampil',4,1),
('INFORMASI PUBLIK','Informasi Berkala','informasi-berkala','Informasi Berkala','Klik menu ini untuk melihat daftar dokumen informasi berkala pada tabel informasi publik.','Tampil',1,1),
('INFORMASI PUBLIK','Informasi Serta Merta','informasi-serta-merta','Informasi Serta Merta','Klik menu ini untuk melihat daftar dokumen informasi serta merta pada tabel informasi publik.','Tampil',2,1),
('INFORMASI PUBLIK','Informasi Setiap Saat','informasi-setiap-saat','Informasi Setiap Saat','Klik menu ini untuk melihat daftar dokumen informasi setiap saat pada tabel informasi publik.','Tampil',3,1),
('INFORMASI PUBLIK','Informasi Dikecualikan','informasi-dikecualikan','Informasi Dikecualikan','Klik menu ini untuk melihat daftar dokumen informasi dikecualikan pada tabel informasi publik.','Tampil',4,1),
('LAYANAN','Prosedur Permohonan','prosedur-permohonan','Prosedur Permohonan','Prosedur permohonan informasi dapat diedit melalui Panel Admin > Atur Menu Website.','Tampil',1,1),
('LAYANAN','Prosedur Keberatan','prosedur-keberatan','Prosedur Keberatan','Prosedur keberatan dapat diedit melalui Panel Admin.','Tampil',2,1),
('LAYANAN','Biaya Layanan','biaya-layanan','Biaya Layanan','Informasi biaya layanan dapat diedit melalui Panel Admin.','Tampil',3,1),
('LAYANAN','Hak & Tata Cara','hak-tata-cara','Hak & Tata Cara','Hak dan tata cara memperoleh informasi dapat diedit melalui Panel Admin.','Tampil',4,1),
('LAPORAN','Laporan Tahunan','laporan-tahunan','Laporan Tahunan','Laporan tahunan dapat diedit dan dilengkapi berkas melalui Panel Admin.','Tampil',1,1),
('LAPORAN','Laporan Statistik','laporan-statistik','Laporan Statistik','Laporan statistik dapat diedit dan dilengkapi berkas melalui Panel Admin.','Tampil',2,1),
('LAPORAN','Laporan Akses','laporan-akses','Laporan Akses','Laporan akses informasi dapat diedit dan dilengkapi berkas melalui Panel Admin.','Tampil',3,1);
