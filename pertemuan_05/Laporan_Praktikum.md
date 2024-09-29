|            |                   |
|------------|-------------------|
| NAMA       | Sandra Devia Arge |
| KELAS      | TI - 3F           |
| NIM        | 2241720222        |


# LAPORAN PRAKTIKUM JOBSHEET 5 -Aplikasi Pertama dan Widget Dasar Flutter

## *Praktikum 1 - Membuat Project Flutter Baru*

### **Langkah 1 :**
Buka VS Code, lalu tekan tombol **Ctrl + Shift + P** maka akan tampil Command Palette, lalu ketik **Flutter**. Pilih **New Application Project**.

>**Catatan :**

### **Langkah 2 :**
Kemudian buat folder **sesuai style** laporan praktikum yang Anda pilih. Disarankan pada folder dokumen atau desktop atau alamat folder lain yang tidak terlalu dalam atau panjang. Lalu pilih **Select a folder to create the project in**.

### **Langkah 3 :**
Buat nama project flutter **hello_world** seperti berikut, lalu tekan **Enter**. Tunggu hingga proses pembuatan project baru selesai.

### **Langkah 4 :**
Jika sudah selesai proses pembuatan project baru, pastikan tampilan seperti berikut. Pesan akan tampil berupa **"Your Flutter Project is ready!"** artinya Anda telah berhasil membuat project Flutter baru.


## *Praktikum 2 - Menghubungkan Perangkat Android atau Emulator*
### **Langkah 1 :**
1. Pastikan komputer dan perangkat Anda terhubung ke jaringan nirkabel yang sama.
2. Pastikan perangkat Anda menjalankan Android 11 atau yang lebih baru. Untuk informasi selengkapnya, lihat **Memeriksa & mengupdate versi Android**.
3. Pastikan komputer Anda telah memiliki Android Studio versi terbaru. Untuk mendownloadnya, lihat **Android Studio**.
4. Pastikan komputer Anda memiliki **SDK Platform Tools** versi terbaru.

### **Langkah 2 : Menyambungkan Perangkat ANda**
1. Di Android Studio, pilih **Pair Devices Using Wi-Fi** dari menu drop-down konfigurasi run.


Dialog **Pair devices over Wi-Fi** akan terbuka
 

2. Buka **Developer options**, scroll ke bawah ke bagian **Debugging**, lalu aktifkan **Wireless debugging**.


3. Pada pop-up **Izinkan proses debug nirkabel di jaringan ini?**, pilih **Allow**.


4. Jika Anda ingin menyambungkan perangkat dengan kode QR, pilih **Pair device with QR code**, lalu pindai kode QR di komputer Anda. Atau, jika Anda ingin menyambungkan perangkat dengan kode penghubung, pilih **Pair device with pairing code**, lalu masukkan 6 digit kode.
5. Klik jalankan dan Anda dapat men-deploy aplikasi ke perangkat.


## *Praktikum 3 - Membuat Repository GitHub*

> **Perhatian:** Diasumsikan Anda telah mempunyai akun GitHub dan Anda telah memahami konsep dasar dalam bekerja menggunakan Git pada pertemuan pertama.
Praktikum ini dapat Anda lewati langsung ke langkah 11 jika sudah paham cara membuat laporan praktikum sesuai style yang Anda pilih.

### **Langkah 1 :**
Login ke akun GitHub Anda, lalu buat repository baru dengan nama **"flutter-fundamental-part1"**


### **Langkah 2 :**
Lalu klik tombol **"Create repository"** lalu akan tampil seperti gambar berikut.

### **Langkah 3 :**
Kembali ke VS code, project flutter hello_world, buka terminal pada menu **Terminal > New Terminal**. Lalu ketik perintah berikut untuk inisialisasi git pada project Anda.

### **Langkah 4 :**
Pilih menu **Source Control** di bagian kiri, lalu lakukan **stages** (+) pada file **.gitignore** untuk mengunggah file pertama ke repository GitHub.

### **Langkah 5 :**
Beri pesan commit **"tambah gitignore"** lalu klik **Commit (✔)**

### **Langkah 6 :**
Lakukan push dengan klik bagian menu titik tiga > **Push**


### **Langkah 7 :**
Di pojok kanan bawah akan tampil seperti gambar berikut. Klik **"Add Remote"**


### **Langkah 8 :**
Salin tautan repository Anda dari browser ke bagian ini, lalu klik **Add remote**

### **Langkah 9 :**
Lakukan hal yang sama pada file **README.md** mulai dari Langkah 4. Setelah berhasil melakukan push, masukkan username GitHub Anda dan password berupa token yang telah dibuat (pengganti password konvensional ketika Anda login di browser GitHub). Reload halaman repository GitHub Anda, maka akan tampil hasil push kedua file tersebut seperti gambar berikut.


### **Langkah 10 :**
Lakukan push juga untuk semua file lainnya dengan pilih **Stage All Changes**. Beri pesan commit **"project hello_world"**. Maka akan tampil di repository GitHub Anda seperti berikut.

### **Langkah 11 :**
Kembali ke VS Code, ubah platform di pojok kanan bawah ke emulator atau device atau bisa juga menggunakan browser Chrome. Lalu coba running project **hello_world** dengan tekan **F5** atau **Run > Start Debugging**. Tunggu proses kompilasi hingga selesai, maka aplikasi flutter pertama Anda akan tampil seperti berikut.

### **Langkah 12 :**
Silakan screenshot seperti pada Langkah 11, namun teks yang ditampilkan dalam aplikasi berupa nama lengkap Anda. Simpan file screenshot dengan nama **01.png** pada folder **images** (buat folder baru jika belum ada) di project hello_world Anda. Lalu ubah isi README.md seperti berikut, sehingga tampil hasil screenshot pada file README.md. Kemudian push ke repository Anda.


## *Praktikum 4 - Menerapkan Widget Dasar*

Selesaikan langkah-langkah praktikum berikut ini dengan melanjutkan dari praktikum sebelumnya.

### **Langkah 1 : Text Widget**
Buat folder baru basic_widgets di dalam folder lib. Kemudian buat file baru di dalam basic_widgets dengan nama text_widget.dart. Ketik atau salin kode program berikut ke project hello_world Anda pada file text_widget.dart.

>**Perhatian:** Gantilah teks Fulan dengan nama lengkap Anda.

Lakukan import file text_widget.dart ke main.dart, lalu ganti bagian text widget dengan kode di atas. Maka hasilnya seperti gambar berikut. Screenshot hasil milik Anda, lalu dibuat laporan pada file README.md.

### **Langkah 2 : Image Widget**
Buat sebuah file image_widget.dart di dalam folder basic_widgets dengan isi kode berikut.

Lakukan penyesuaian asset pada file pubspec.yaml dan tambahkan file logo Anda di folder assets project hello_world.


Jangan lupa sesuaikan kode dan import di file main.dart kemudian akan tampil gambar seperti berikut.


## *Praktikum 5 - Menerapkan Widget Material Design dan iOS Cupertino*

