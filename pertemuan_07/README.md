# JOBSHEET 7 - Praktikum Menerapkan Plugin di Project Flutter
---
## **1. Selesaikan Praktikum tersebut, lalu dokumentasikan dan push ke repository Anda berupa screenshot hasil pekerjaan beserta penjelasannya di file README.md!**
## Langkah 1: Buat Project Baru
Buatlah sebuah project flutter baru dengan nama flutter_plugin_pubdev. Lalu jadikan repository di GitHub Anda dengan nama flutter_plugin_pubdev.
![hasil](/pertemuan_07/img/1.png)

## Langkah 2: Menambahkan Plugin
Tambahkan plugin auto_size_text menggunakan perintah berikut di terminal

![hasil](/pertemuan_07/img/2.png)

## Langkah 3: Buat file red_text_widget.dart
Buat file baru bernama red_text_widget.dart di dalam folder lib lalu isi kode seperti berikut.

![hasil](/pertemuan_07/img/3.png)

## Langkah 4: Tambah Widget AutoSizeText
Masih di file red_text_widget.dart, untuk menggunakan plugin auto_size_text, ubahlah kode return Container() menjadi seperti berikut.

![hasil](/pertemuan_07/img/4.png)

Terjadi eror, karena plugin auto_size_text belum di inisialisasi, sehingga terjadi error. Untuk mengatasi hal ini pada langkah 5 akan ditambahkan parameter.

## Langkah 5: Buat Variabel text dan parameter di constructor
Tambahkan variabel text dan parameter di constructor seperti berikut.

![hasil](/pertemuan_07/img/5.png)

## Langkah 6: Tambahkan widget di main.dart
Buka file main.dart lalu tambahkan di dalam children: pada class _MyHomePageState

![hasil](/pertemuan_07/img/6.png)

2. Jelaskan maksud dari langkah 2 pada praktikum tersebut!
>**Jawab :** 
>Pada langkah 2 AutoSizeText merupakan widget yang digunakan untuk menampilkan text secara otomatis namun menyesuaikan ukuran font-nya agar sesuai dengan batas yang ditentukan. 
>
>Untuk menggunakan widget ini, kita perlu menambahkan plugin auto_size_text ke dalam project

3. Jelaskan maksud dari langkah 5 pada praktikum tersebut!

>**Jawab :**
>Langkah 5 bertujuan untuk menambahkan variabel text dan parameter di constructor. Tujuannya untuk kustomisasi teks yang ditampilkan oleh widget.
>
>- final string text ini merupakan proses membuat variabel yang akan menyimpan teks yang ditampilkan oleh widget. 
>- const RedTextWidget({Key? key, required this.text}) : super(key: key);
> pada kode prgram diatas required this.text menunjukkan bahwa parameter text harus diberikan saat membuat objek RedTextWidget. Jadi, siapa pun yang menggunakan widget ini harus memasukkan teks yang akan ditampilkan.

4. Pada langkah 6 terdapat dua widget yang ditambahkan, jelaskan fungsi dan perbedaannya!

>**Jawab :**
> Pada langkah 6 terdapat dua widget yang ditambahkan, yaitu :
> - Container 1 memberikan tampilan warna kuning dengan lebarnya 50 dan teks tersebut bewarna merah dengan maksimal 2 baris.
> - Container 2 memberikan tampilan warna hijau dengan lebarnya 100 dan teksnya otomatis menyesuaikan ukuran teks AutoSizeText.

5. Jelaskan maksud dari tiap parameter yang ada di dalam plugin auto_size_text berdasarkan tautan pada dokumentasi ini !

>**Jawab :**
> Pada plugin auto_size_text terdapat beberapa parameter penting dalam plugin auto_size_text berdasarkan dokumentasi yang Anda buka:
>
>- style: Menentukan gaya teks, termasuk ukuran font awal.
> - maxLines: Menentukan jumlah baris maksimum yang dapat digunakan teks.
> - minFontSize: Menentukan ukuran font terkecil yang diizinkan.
> - maxFontSize: Menentukan ukuran font terbesar yang diizinkan.
> - stepGranularity: Menentukan seberapa besar penurunan ukuran font pada setiap langkah.
> - presetFontSizes: Menentukan ukuran font spesifik yang diizinkan, mengabaikan minFontSize, maxFontSize, dan stepGranularity1.
> - overflowReplacement: Widget yang ditampilkan jika teks meluap dan tidak sesuai dengan batasnya.
> - group: Mengelompokkan beberapa AutoSizeText agar memiliki ukuran font yang sama.

6. Kumpulkan laporan praktikum Anda berupa link repository GitHub kepada dosen!

---

## **TERIMA KASIH**