
|            |                   |
|------------|-------------------|
| NAMA       | Sandra Devia Arge |
| KELAS      | TI - 3F|
| NIM        | 2241720222|



# LAPORAN PRAKTIKUM JOBSHEET 2 -Pemrograman Dart

> ## *Tugas Praktikum*

### **Soal 1**

Modifikasi Kode pada baris 3 di VS Code atau Editor Code favorit Anda berikut ini agar mendapatkan keluaran (output) sesuai yang diminta!

> Kode program sebelum modifikasi:

```dart
void main() {
  for (int i = 0; i < 10; i++) {
    print('Nama saya adalah Fulan, sekarang berumur ${18 - i}');
  }
}
```

> Outout yang diminta

![image desc](./img/Screenshot%202024-09-05%20132339.png)

## **Soal 2**
Mengapa sangat penting untuk memahami bahasa pemrograman Dart sebelum kita menggunakan framework Flutter ? Jelaskan!

>  *Jawaban: Bahasa pemrograman Dart sangat penting untuk dipahami sebelum menggunakan framework Flutter karena dapat memudahkan kita dalam penggunaan flutter dan membuat lebih nyaman dalam pengembangan flutter. Hal ini dikarenakan pengembangan framework Flutter melibatkan pengetahuan mendalam dengan bahasa Dart.*

## **Soal 3**

Rangkumlah materi dari codelab ini menjadi poin-poin penting yang dapat Anda gunakan untuk membantu proses pengembangan aplikasi mobile menggunakan framework Flutter.

> *Jawaban : 
---

### **Pentingnya Bahasa Dart untuk Flutter**

- **Dart sebagai Inti Flutter**: Dart adalah bahasa utama untuk pengembangan aplikasi dengan Flutter. Memahami Dart adalah dasar untuk bekerja dengan Flutter karena semua kode aplikasi dan plugin menggunakan Dart.
- **Fitur Utama Dart**:
  - **Productive Tooling**: Alat bantu analisis kode, plugin IDE, dan ekosistem paket.
  - **Garbage Collection**: Mengelola memori dengan efisien.
  - **Type Annotations (Opsional)**: Menjamin keamanan tipe data.
  - **Statically Typed**: Mendeteksi bug selama kompilasi.
  - **Portability**: Mendukung web dan kompilasi ke kode native ARM dan x86.

### **Evolusi Dart**

- **Sejarah**:
  - Diluncurkan pada 2011, versi stabil pertama pada 2013.
  - Fokus awal pada pengembangan web; sekarang lebih pada mobile development dengan Flutter.
- **Perkembangan**:
  - Mengatasi kekurangan JavaScript.
  - Menawarkan performa tinggi dan alat modern.
  - Fleksibel dengan fitur OOP.

### **Cara Kerja Dart**

- **Eksekusi Kode**:
  - **Dart VM**: Menjalankan kode dengan Just-In-Time (JIT) atau Ahead-Of-Time (AOT) compilation.
  - **JavaScript Compilation**: Mengonversi kode Dart untuk dijalankan di browser.
- **Hot Reload**: Memungkinkan perubahan kode cepat selama pengembangan aplikasi dengan Flutter.

### **Struktur Dasar Dart**

- **Sintaks Dasar**:
  - **Fungsi `main()`**: Titik awal eksekusi kode, harus ada di setiap aplikasi Dart.
  - **Operator**:
    - **Aritmetika**: `+`, `-`, `*`, `/`, `~/`, `%`.
    - **Inkrement/Decrement**: `++`, `--`.
    - **Kesetaraan/Relasional**: `==`, `!=`, `>`, `<`, `>=`, `<=`.
    - **Logika**: `!`, `||`, `&&`.
  - **Pemrograman Berorientasi Objek (OOP)**:
    - **Encapsulation**, **Inheritance**, **Composition**, **Abstraction**, **Polymorphism**.
    - **Method**: Fungsi dalam class dengan referensi instance menggunakan `this`.

### **Praktik dengan Dart**

- **DartPad**: Alat online untuk belajar dan bereksperimen dengan Dart.
- **Contoh Kode**:
  ```dart
  void main() { 
    for (int i = 0; i < 5; i++) { 
      print('hello ${i + 1}'); 
    } 
  }
  ```
  Menampilkan output `hello 1`, `hello 2`, dll.

---


## **Soal 4**
Buatlah slide yang berisi penjelasan dan contoh eksekusi kode tentang perbedaan Null Safety dan Late variabel ! (Khusus soal ini kelompok berupa link google slide)