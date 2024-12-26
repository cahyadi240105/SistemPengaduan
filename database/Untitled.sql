CREATE TABLE `user` (
  `user_id` integer PRIMARY KEY,
  `nama` varchar(100),
  `email` varchar(100),
  `password` varchar(255),
  `role` enum('Masyarakat','Petugas'),
  `created_at` timestamp,
  `update_at` timestamp
);

CREATE TABLE `pengaduan` (
  `id_pengaduan` integer PRIMARY KEY,
  `user_id` integer UNIQUE,
  `judul_pengaduan` text,
  `isi_pengaduan` text,
  `kategori` enum('Keamanan','Kebersihan','Infrastruktur','Layanan','Transportasi','Lingkungan','Pendidikan','Kesehatan','Lainnya'),
  `foto` varchar(255),
  `status` enum('Selesai','Tertolak','Tertunda','Terporses'),
  `created_at` timestamp,
  `update_at` timestamp
);

CREATE TABLE `tanggapan` (
  `id` integer PRIMARY KEY,
  `id_pengaduan` integer,
  `user_id` integer,
  `tanggapan` text,
  `created_at` timestamp
);

ALTER TABLE `pengaduan` ADD FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`);

ALTER TABLE `tanggapan` ADD FOREIGN KEY (`id_pengaduan`) REFERENCES `pengaduan` (`id_pengaduan`);

ALTER TABLE `tanggapan` ADD FOREIGN KEY (`id`) REFERENCES `user` (`user_id`);
