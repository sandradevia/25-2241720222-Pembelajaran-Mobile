<table>
    <thead>
        <th style="text-align: center;" colspan="2">Pertemuan 12</th>
    </thead>
    <tbody>
        <tr>
            <td>Nama</td>
            <td>Sandra Devia Arge</td>
        </tr>
        <tr>
            <td>Nim</td>
            <td>2241720222</td>
        </tr>
    </tbody>
</table>

<details>
<summary>

## Praktikum 1: Dart Streams
</summary>

### Langkah 1 : Membuat Project Baru
Membuat sebuah project flutter baru dengan nama **stream_nama** (beri nama panggilan Anda)

### Langkah 2 : Membuka file main.dart

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stream',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: const StreamHomePage(),
    );
  }
}

class StreamHomePage extends StatefulWidget {
  const StreamHomePage({super.key});

  @override
  State<StreamHomePage> createState() => -StreamHomePage();
}

class _StreamHomePage extends State<StreamHomePage> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
```

>**Soal 1**
>- Menambahkan nama panggilan pada `title` app sebagai identitas hasil pekerjaan
>- Mengganti warna tema aplikasi sesuai kesukaan Anda.

![hasil](/pertemuan_12/img/img1.png)

### Langkah 3 : Membuat baru stream.dart
Membuka file baru di folder lib 
```dart
import 'package:flutter/material.dart';

class ColorStream{

}
```

### Langkah 4 : Menambah variabel colors
Menambahkan variabel di dalam class ColorStream
![hasil](/pertemuan_12/img/Screenshot%202024-11-21%20154951.png)
```dart
final List <Color> colors = [
    Colors.blueGrey,
    Colors.amber,
    Colors.deepPurple,
    Colors.lightBlue,
    Colors.teal,
  ];
```
>**Soal 2**
>- Menambahkan 5 warna lainnya pada variabel `colors`

![hasil](/pertemuan_12/img/Screenshot%202024-11-21%20155353.png)

### Langkah 5 : Menambah method getColors()
Di dalam class ColorStream, tambahkan method berikut:

```dart
  Stream<Color> getColors() async* {}
}
```

### Langkah 6 : Menambah perintah yield*
Menambahkan kode berikut ini

![hasil](/pertemuan_12/img/Screenshot%202024-11-21%20155806.png)

```dart
Stream<Color> getColors() async* {
    yield* Stream.periodic(const Duration(seconds: 1), (int t) {
      int index = t % colors.length;
      return colors[index];
    });
```

>**Soal 3**
>- Jelaskan fungsi keyword yield* pada kode tersebut!
>- Apa maksud isi perintah kode tersebut?
>**Jawaban**
> - Keyword `yield*` di Dart dipakai untuk menghasilkan elemen-elemen dari stream lain. Ibaratnya, `yield*` itu seperti nge-"forward" semua elemen dari sumber lain ke stream kita.
>- Kode program diatas membuat stream warna yang akan berubah setiap 1 detik. Prosesnya :
> 1. Stream mengeluarkan warna dari daftar colors satu per satu.
> 2. Setelah sampai warna terakhir, dia akan balik ke awal (looping).
> 3. Semua elemen dari `Stream.periodic` diteruskan langsung ke `getColors` pakai `yield*`.

### Langkah 7 : Membuka main.dart
Ketik kode impor file ini pada file `main.dart`
`import 'stream.dart';`

### Langkah 8 : Menambah variabel
ketik dua properti ini di dalam class `_StreamHomePageState`
```dart
  Color bgColor = Colors.blueGrey;
  late ColorStream colorStream;
```
### Langkah9 : Menambah method changeColor()
Tetap di file main, Ketik kode seperti berikut

![hasil](/pertemuan_12/img/Screenshot%202024-11-21%20161449.png)

```dart
  void changeColor() async {
    await for (var eventColor in colorStream.getColors()) {
      setState(() {
        bgColor = eventColor;
      });
    }
  }
```
### Langkah 10 : Melakukan override `initState()`
Ketikkan kode seperti berikut
```dart
@override
  void initState() {
    super.initState();
    colorStream = ColorStream();
    changeColor();
  }
```

### Langkah 11 : MEngubah isi `Scaffold()`
sesuaikan kode seperti berikut
```dart
@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stream - Sandra'),
      ),
      body: Container(
        color: bgColor,
        child: Center(
          child: Text(
            'Warna background berubah!',
            style: TextStyle(color: Colors.white, fontSize: 24),
          ),
        ),
      ),
    );
  }
}
```
### Langkah 12 : Run


>**Soal 4**
>- Capture hasil praktikum Anda berupa GIF dan lampirkan di README.

![hasil]()

### Langkah 13 : Ganti isi method `changeColor()`
comment atau hapus kode sebelumnya, lalu ketika kode seperti berikut.
```dart
void changeColor() {
    colorStream.getColors().listen((eventColor) {
      setState(() {
        bgColor = eventColor;
      });
    });
  }
```


>**Soal 5**
>- Jelaskan perbedaan menggunakan listen dan await for (langkah 9) !
>
> **Jawaban**
>Perbedaan listen dan await for:
>- listen: Menangani stream dengan callback, cocok untuk stream yang menghasilkan data secara terus-menerus.
>- await for: Blokir sementara kode berikutnya sampai semua elemen stream selesai diproses.

</details>
<details>
<summary>

## Praktikum 2: Stream controllers dan sinks
</summary>

### Langkah 1 : Membuka file stream.dart
Lakukan impor dengan mengetik kode ini.
`import 'dart:async';`

### Langkah 2 : Menambah `class NumberStream`
Tetap di file `stream.dart` tambah class baru seperti berikut.

### Langkah 3 : Menambah `StreamController`
Di dalam class `NumberStream` buatlah variabel seperti berikut.
`final StreamController<int> controller = StreamController<int>();`

### Langkah 4 : Menambah method `addNumberToSink`
Tetap di class `NumberStream` buatlah method ini

### Langkah 5 : Menambah method `close()`

### Langkah 6 : Membuka `main.dart`

### Langkah 7 : Menambah variabel
Di dalam `class _StreamHomePageState` ketik variabel berikut

### Langkah 8 : Edit `iniState()`


### Langkah 9 : Edit dispose()


### Langkah 10 : Menambah method `addRandomNumber()`

### Langkah 11 : Edit method `build()`

### Langkah 12 : Run