# PPID MAN 2 Palembang - Versi Perbaikan Lanjutan

Versi ini sudah disiapkan untuk pengembangan lokal dan deploy Hostinger Cloud dengan pola satu root project: React Vite sebagai frontend dan Express sebagai backend.

## Perbaikan Utama

1. Backend tidak lagi error syntax pada error handler.
2. Endpoint permohonan, register, login, informasi publik, beranda, dan navbar sudah tersedia.
3. Frontend memakai `src/api.js`, sehingga tidak hardcode ke domain tertentu.
4. Backend memakai `.env` / environment variables untuk database, CORS, JWT, dan upload.
5. Password user baru otomatis di-hash memakai bcrypt.
6. Akun lama yang password-nya masih plaintext tetap bisa login; setelah login berhasil, password otomatis di-upgrade menjadi bcrypt.
7. API admin dilindungi token JWT dan role admin.
8. API permohonan user dilindungi token; user biasa tidak bisa membaca permohonan user lain.
9. Folder `backend/uploads` dibersihkan dari file test/backup lama agar tidak ikut terbuka ke publik.
10. Backend bisa serve hasil build frontend dari folder `dist`.

## Cara Jalan Lokal - Mode Development

1. Install dependency dari root project:

```bash
npm install
```

2. Siapkan environment lokal:

```bash
cp .env.example .env
```

Di Windows PowerShell:

```powershell
Copy-Item .env.example .env
```

3. Sesuaikan database di `.env`:

```env
DB_HOST=localhost
DB_USER=root
DB_PASSWORD=
DB_NAME=db_ppid_man2
PORT=5000
JWT_SECRET=ganti-dengan-random-secret-panjang-minimal-32-karakter
```

4. Jalankan frontend dan backend bersamaan:

```bash
npm run dev:full
```

Atau terpisah:

```bash
npm run dev
npm run dev:backend
```

Frontend lokal:

```txt
http://localhost:5173
```

Backend lokal:

```txt
http://localhost:5000/api/health
```

## Cara Simulasi Production Lokal

```bash
npm run build
npm start
```

Lalu buka:

```txt
http://localhost:5000
```

## Setup Hostinger Cloud

Di hPanel Node.js App:

```txt
Build command : npm install && npm run build
Start command : npm start
Output directory : dist
```

Pastikan environment variable di Hostinger diisi:

```env
NODE_ENV=production
PORT=3000
CORS_ORIGIN=https://ppid.man2plg.sch.id
JWT_SECRET=isi-dengan-random-secret-panjang
JWT_EXPIRES_IN=1d
DB_HOST=host_database_hostinger
DB_USER=user_database
DB_PASSWORD=password_database
DB_NAME=nama_database
DB_CONNECTION_LIMIT=10
MAX_UPLOAD_SIZE=10485760
```

Jika frontend dan backend berada di domain yang sama, `VITE_API_URL` boleh dikosongkan. Kalau backend beda domain, isi `VITE_API_URL` dengan URL backend.

## Catatan Login Admin

Akun admin dari dump database lama masih bisa login dengan password lama. Setelah login pertama berhasil, password akan otomatis diubah menjadi hash bcrypt di database.

## Catatan Penting Sebelum Online

- Ganti `JWT_SECRET` dengan teks random panjang, jangan pakai contoh bawaan.
- Jangan upload file `.env` lokal ke public repository.
- Ubah password admin setelah sistem online.
- Pastikan database Hostinger sudah diimport dari `db_ppid_man2.sql`.
- Cek endpoint `https://ppid.man2plg.sch.id/api/health` setelah deploy.
