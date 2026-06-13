SI-PANTAU SERDIK - DATABASE ONLINE READY

Tujuan:
Agar aplikasi dapat dipakai dari banyak perangkat berbeda dengan data yang sama:
- Data Serdik sama
- Akun Tenaga Pendidik sama
- Input nilai sama
- Rekap penilaian sama
- Grafik dan laporan sama

Teknologi database:
Supabase PostgreSQL, disimpan pada tabel app_state.

LANGKAH SETUP DATABASE SUPABASE

1. Buka https://supabase.com
2. Buat project baru.
3. Buka menu SQL Editor.
4. Copy isi file schema.sql.
5. Jalankan / Run script SQL tersebut.
6. Buka Project Settings > API.
7. Copy:
   - Project URL
   - anon public key
8. Buka file config.js.
9. Ganti:
   - ISI_SUPABASE_URL_ANDA
   - ISI_SUPABASE_ANON_KEY_ANDA
10. Upload seluruh folder ini ke Vercel/Netlify/hosting lain.

CATATAN PENTING:
- Jika config.js belum diisi, aplikasi tetap berjalan tetapi hanya mode lokal.
- Jika config.js sudah benar dan schema.sql sudah dijalankan, semua perangkat memakai data yang sama.
- Untuk keamanan produksi yang lebih tinggi, disarankan tahap berikutnya memakai login Supabase Auth dan policy RLS yang lebih ketat.

AKUN DEFAULT:
- Admin awal mengikuti data aplikasi.
- Admin dapat mengubah username/password dari menu Pengaturan.
- Tenaga Pendidik harus didaftarkan oleh Admin.

FT. LANTAS BALI — 2026

UPDATE ADMINISTRATOR TUNGGAL (14 Juni 2026)
- Aplikasi sudah diperbaiki agar akun Administrator dikunci menjadi 1 akun utama melalui tabel Supabase `admin_accounts`.
- Jika akun Administrator sudah dibuat/diubah di satu perangkat, perangkat lain akan membaca akun yang sama dari database online.
- Jalankan ulang file `schema.sql` terbaru di Supabase SQL Editor sebelum hosting/menjalankan aplikasi.
- Setelah update, login Administrator divalidasi ulang ke database online agar tidak memakai data lokal perangkat yang berbeda.

UPDATE REVISI REKAP PENILAIAN:
- Halaman Rekap Penilaian sekarang dipisahkan berdasarkan Materi/Pelajaran.
- Setiap Materi/Pelajaran dirinci lagi per Pertemuan.
- Rekap menampilkan tanggal, pengamat, nilai indikator I-1 s.d. I-6, rata-rata, kategori, dan catatan.
- Pertemuan pada halaman input sekarang berbentuk tombol/list yang bisa diklik.
- Jumlah tombol/list pertemuan mengikuti pengaturan Jumlah Pertemuan/Pengamatan.
- Export CSV sekarang menghasilkan rekap lengkap per Materi/Pelajaran dan per Pertemuan.


UPDATE FORMAT INFOGRAFIS REKAP:
- Pada halaman Rekap Penilaian ditambahkan tombol `Lihat Infografis`.
- Ditambahkan tombol `Cetak / Simpan PDF` untuk menghasilkan laporan visual yang rapi dan terstruktur.
- Format infografis menampilkan ringkasan umum, ringkasan indikator I-1 s.d. I-6, ringkasan per Materi/Pelajaran, rincian per Pertemuan, dan peringkat keseluruhan Serdik.
- Format ini dapat dipakai sebagai laporan visual selain file CSV.
