<table>
    <thead>
        <th style="text-align: center;" colspan="2">Pertemuan 11</th>
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

## Praktikum 1: Mengunduh Data dari Web Service (API)
</summary>

### Langkah 1: Membuat Project Baru

Membuat project baru dengan nama `books` dan menambahkan dependencies `http`.

![hasil](/pertemuan_11/img/im1.png)

### Langkah 2: Cek file pubspec.yaml

Memastikan file `pubspec.yaml` sudah terdapat dependencies `http`.

![hasil](/pertemuan_11/img/img2.png)


### Langkah 3: Buka file main.dart

### Soal 1
Tambahkan nama panggilan Anda pada title app sebagai identitas hasil pekerjaan Anda.

![hasil](/pertemuan_11/img/img3.png)

```dart
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '2241720222 - Sandra Devia A',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const FuturePage(),
    );

  }
}

class FuturePage extends StatefulWidget {
  const FuturePage({super.key});

  @override
  State<FuturePage> createState() => _FuturePageState();
} 

class _FuturePageState extends State<FuturePage> {
  String result =  '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Back from the Future'),
      ),
      body: Center(
        child: Column(children: [
        const Spacer(),
          ElevatedButton(
            child: const Text('GO!'),
            onPressed: () {},
          ),
          const Spacer(),
          Text(result),
          const Spacer(),
          const CircularProgressIndicator(),
          const Spacer(),
        ]),
      ),
    );
  }
}
```

# Langkah 4: Tambah method getData()

Menambahkan method `getData()` untuk mengambil data dari web service.

![hasil](/pertemuan_11/img/img4.png)

```dart
Future<Response> getData() async {
    const authority = 'www.googleapis.com';
    const path = '/books/v1/volumes/e-ZDDwAAQBAJ';
    Uri url = Uri.https(authority, path);
    return http.get(url);
  }
```

## Soal 2

Carilah judul buku favorit Anda di Google Books, lalu ganti ID buku pada variabel path di kode tersebut.

![hasil](/pertemuan_11/img/img%205.png)
![hasil](/pertemuan_11/img/img6.png)

# Langkah 5: Tambah kode di ElevatedButton

Menambahkan kode untuk memanggil method `getData()` pada ElevatedButton.

```dart
class _FuturePageState extends State<FuturePage> {
  String result =  '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Back from the Future'),
      ),
      body: Center(
        child: Column(children: [
        const Spacer(),
          ElevatedButton(
            child: const Text('GO!'),
            onPressed: () {
              setState(() {
                  
                });
                getData().then((value){
                  result = value.body.toString().substring(0,450);
                  setState(() {
                    
                  });
                }).catchError((_){
                  result = 'An error occured';
                  setState(() {});
                });
            },
          ),
          const Spacer(),
          Text(result),
          const Spacer(),
          const CircularProgressIndicator(),
          const Spacer(),
        ]),
      ),
    );
  }
```

![hasil](/pertemuan_11/img/img7.png)

## Soal 3

Jelaskan maksud kode langkah 5 tersebut terkait `substring` dan `catchError`!

Capture hasil praktikum Anda berupa GIF dan lampirkan di README.

> **Jawaban**
`substring` dipakai untuk mengambil bagian tertentu dari sebuah string berdasarkan indeksnya. Sementara itu, `catchError` digunakan untuk menangkap error yang muncul saat kode dijalankan.


![hasil](/pertemuan_11/img/gif/soal3.gif)

</details>

<details>
<summary>

## Praktikum 2: Menggunakan await/async untuk menghindari callbacks
</summary>


### Langkah 1: Buka file main.dart

Menambahkan tiga method di dalam class _FuturePageState.

![hasil](/pertemuan_11/img/img8.png)
```dart
Future<int> returnOneAsync() async {
  await Future.delayed(const Duration(seconds: 3));
  return 1;
}

Future<int> returnTwoAsync() async {
  await Future.delayed(const Duration(seconds: 3));
  return 2;
}

Future<int> returnThreeAsync() async {
  await Future.delayed(const Duration(seconds: 3));
  return 3;
}
```

### Langkah 2: Tambah method count()

Menambahkan method `count()` untuk menghitung.

![hasil](/pertemuan_11/img/img10.png)
```dart
 Future count() async {
        int total = 0;
        total = await returnOneAsync();
        total += await returnTwoAsync();
        total += await returnThreeAsync();
        setState(() {
          result = total.toString();
        });
      }
```

### Langkah 3: Panggil count()

Menambahkan kode untuk memanggil method `count()` pada ElevatedButton.

![hasil](/pertemuan_11/img/img9.png)

### Langkah 4: Run

Menjalankan aplikasi.

![hasil](/pertemuan_11/img/gif/langkah%204.gif)

## Soal 4
Jelaskan maksud kode langkah 1 dan 2 tersebut!

>**Jawaban**
Langkah pertama adalah kode yang akan menghasilkan output berupa angka 1, 2, dan 3, dengan jeda waktu 3 detik di antara tiap angka. Langkah kedua adalah kode yang akan menjalankan proses di langkah pertama, kemudian menampilkan hasilnya.

</details>

<details>
<summary>

## Praktikum 3: Menggunakan Completer di Future
</summary>

### Langkah 1: Buka main.dart

Melakukan import package async.

![hasil](/pertemuan_11/img/img11.png)

### Langkah 2: Tambahkan variabel dan method

Menambahkan variabel late dan method di class _FuturePageState.
```dart
  late Completer completer;

  Future getNumber() {
    completer = Completer<int>();
    calculate();
    return completer.future;
  }

  Future calculate() async {
    await Future.delayed(const Duration(seconds: 5));
    completer.complete(42);
  }
```

![hasil](/pertemuan_11/img/img12.png)

### Langkah 3: Ganti isi kode onPressed()

Mengganti isi kode onPressed() pada ElevatedButton.
```dart
getNumber().then((value) {
                setState(() {
                  result = value.toString();
                });
              });
```

![hasil](/pertemuan_11/img/img13.png)

### Langkah 4: Run

![hasil](/pertemuan_11/img/gif/langkah4soal5.gif)

## Soal 5

Jelaskan maksud kode langkah 2 tersebut!

>**Jawaban**
Kode ini menggunakan Completer untuk mengatur penyelesaian (completion) dari sebuah Future secara manual, memberikan kontrol lebih terhadap kapan dan bagaimana Future tersebut selesai.
>
>- Variabel `completer` dideklarasikan dengan keyword late, yang berarti variabel tersebut akan diinisialisasi sebelum digunakan, namun tidak langsung saat dideklarasikan.
>- Fungsi `getNumber()` bertugas membuat instance baru dari Completer`<int>()`.
>- Di dalamnya, fungsi `calculate()` dipanggil untuk menyelesaikan (complete) proses pada Completer.
>- Akhirnya, completer.future dikembalikan sebagai hasil fungsi. Future ini akan berisi nilai yang diberikan ke Completer setelah prosesnya selesai.
>Dengan pendekatan ini, kode memberikan fleksibilitas untuk menentukan nilai pada Future di waktu yang tepat, sesuai kebutuhan.

### Langkah 5: Ganti method calculate()

Mengganti atau membuat calculate2().

![hasil](/pertemuan_11/img/img14.png)

### Langkah 6: Pindah ke onPressed()

Mengganti isi kode onPressed() pada ElevatedButton.

![hasil](/pertemuan_11/img/img15.png)

## Soal 6
Jelaskan maksud perbedaan kode langkah 2 dengan langkah 5-6 tersebut!

![hasil](/pertemuan_11/img/gif/langkah4soal5.gif)

>**Jawaban**
>Pada **langkah** 2, kode menggunakan `Completer` untuk mengelola penyelesaian (completion) dari sebuah Future secara manual, tetapi tidak menyertakan mekanisme penanganan error. Artinya, jika terjadi kesalahan, kode ini tidak akan menangkap atau mengelolanya.
>
>Sementara itu, pada langkah 5-6, `Completer` digunakan bersama dengan Future.delayed untuk menunda eksekusi selama 5 detik. Kode ini juga dilengkapi dengan try-catch untuk menangani error yang mungkin terjadi. Jika error terdeteksi, completer.completeError() dipanggil untuk menyelesaikan Completer dengan status error, sehingga memungkinkan pengguna untuk menangani masalah tersebut lebih lanjut.

</details>

<details>
<summary>

## Praktikum 4: Memanggil Future secara paralel
</summary>

### Langkah 1: Buka file main.dart

Menambahkan method returnFG ke dalam class _FuturePageState.

![hasil](/pertemuan_11/img/img16.png)

### Langkah 2: Edit onPressed()

Mengedit kode onPressed() pada ElevatedButton.

![hasil](/pertemuan_11/img/img17.png)

### Langkah 3: Run

Hasilnya muncul dalam 3 detik berupa angka 6, lebih cepat dibandingkan praktikum sebelumnya yang membutuhkan waktu hingga 9 detik
## Soal 7

Capture hasil praktikum Anda berupa GIF dan lampirkan di README

### Jawaban

![hasil](/pertemuan_11/img/gif/soal6.gif)

### Langkah 4: Ganti variabel futureGroup

Mengganti variabel futureGroup dengan `Future.wait`.

![hasil](/pertemuan_11/img/img18.png)

## Soal 8

Jelaskan maksud perbedaan kode langkah 1 dan 4!

>**Jawaban**
Pada Langkah 1, digunakan FutureGroup untuk mengelola beberapa Future secara bersamaan. Future ditambahkan satu per satu dengan futureGroup.add() dan ditutup menggunakan futureGroup.close(). Setelah semua Future selesai, hasilnya diproses di dalam then(). FutureGroup cocok untuk kasus di mana Future perlu ditambahkan secara dinamis.
>
>Sementara itu, Langkah 4 menggunakan Future.wait, yang langsung mengeksekusi semua Future dalam bentuk list secara paralel. Future.wait lebih sederhana karena tidak memerlukan proses add() dan close(), sehingga cocok untuk skenario dengan Future yang sudah diketahui.
>
>Perbedaan utama:
>
>- FutureGroup: Fleksibel untuk menambah Future secara dinamis.
>- Future.wait: Lebih ringkas dan efisien untuk Future yang sudah ada dalam list.

</details>
<details>
<summary>

## Praktikum 5: Menangani Respon Error pada Async Code
</summary>

### Langkah 1: Buka file main.dart

Menambahkan method `returnError` ke dalam class _FuturePageState.
```dart
Future returnError() async {
    await Future.delayed(const Duration(seconds: 2));
    throw Exception('Something terrible happened!');
  }
```

![hasil](/pertemuan_11/img/img20.png)

### Langkah 2: ElevatedButton

Ubah kode onPressed() pada ElevatedButton.

![hasil](/pertemuan_11/img/img21.png)

### Langkah 3: Run

Menjalankan aplikasi.

## Soal 9

Capture hasil praktikum Anda berupa GIF dan lampirkan di README.
![hasil](/pertemuan_11/img/gif/soal9.gif)

### Jawaban

Pada bagian debug console akan melihat teks Complete seperti berikut.
![hasil](/pertemuan_11/img/img19.png)

### Langkah 4: Tambah method handleError()

Menambahkan method `handleError` ke dalam class _FuturePageState.
```dart
  Future handleError() async {
      try {
        await returnError();
      }
    catch (error) {
      setState(() {
        result = error.toString();
      });
    }
    finally {
      print('Complete');
    }
  }
```

![hasil](/pertemuan_11/img/img22.png)

## Soal 10

Panggil method handleError() tersebut di ElevatedButton, lalu run. Apa hasilnya? Jelaskan perbedaan kode langkah 1 dan 4!
![hasil](/pertemuan_11/img/img23.png)

>**Jawaban**
>Hasilnya akan mencetak complete di console. Perbedaan antara langkah 1 dan langkah 4 adalah:
>
>- Langkah 1 menggunakan catchError untuk menangkap error yang terjadi dan onComplete untuk menampilkan hasil di console.
>- Langkah 4 memakai try-catch di dalam method returnError untuk menangani error dan finally untuk memastikan hasil tetap ditampilkan di console, bahkan jika terjadi error.

![hasil](/pertemuan_11/img/img24.png)

</details>
<details>
<summary>

## Praktikum 6: Menggunakan Future dengan StatefulWidget
</summary>

### Langkah 1: install plugin geolocator

Menambahkan plugin geolocator dengan mengetik perintah berikut di terminal.

`flutter pub add geolocator`

![hasil](/pertemuan_11/img/img25.png)

### Langkah 2: Tambah permission GPS

Menambahkan permission GPS.
```dart
<uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
<uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
```
![hasil](/pertemuan_11/img/img26.png)

### Langkah 3: Buat file geolocation.dart

Membuat file geolocation.dart.
![hasil](/pertemuan_11/img/img27.png)

### Langkah 4: Buat StatefulWidget

Buat class LocationScreen di dalam file geolocation.dart.

### Langkah 5: Isi kode geolocation.dart

Isi kode di dalam class LocationScreen.
```dart
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  String myPosition = '';
  @override
  void initState() {
    super.initState();
    getPosition().then((Position myPos) {
      myPosition =
          'Latitude: ${myPos.latitude.toString()} - Longitude: {myPos.longitude.toString()}';
      setState(() {
        myPosition = myPosition;
    });
  });

}
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Current Location')),
      body: Center(child: Text(myPosition)),
    );
  }
  Future<Position> getPosition() async {
    await Geolocator.requestPermission();
    await Geolocator.isLocationServiceEnabled();
    Position? position = await Geolocator.getCurrentPosition();
    return position;
  }
}
```

## Soal 11
Tambahkan nama panggilan Anda pada tiap properti title sebagai identitas pekerjaan Anda.

## Jawaban

![hasil](/pertemuan_11/img/img28.png)

### Langkah 6: Edit main.dart

Panggil screen baru tersebut di file main.dart.

![hasil](/pertemuan_11/img/img29.png)

### Langkah 7: Run

Menjalankan aplikasi.

![hasil](/pertemuan_11/img/img41.png)

### Langkah 8: Tambahkan animasi loading

Menambahkan animasi loading.

```dart
  @override
  Widget build(BuildContext context) {
    final myWidget = myPosition == ''
    ? const CircularProgressIndicator()
    : Text(myPosition);

      return Scaffold(
      appBar: AppBar(title: const Text('Current Location-Astrid')),
      body: Center(child:myWidget),
    );
  }
```

## Soal 12
Jika Anda tidak melihat animasi loading tampil, kemungkinan itu berjalan sangat cepat. Tambahkan delay pada method getPosition() dengan kode await Future.delayed(const Duration(seconds: 3));

```dart
Future<Position> getPosition() async {
    await Geolocator.requestPermission();
    await Geolocator.isLocationServiceEnabled();
    await Future.delayed(const Duration(seconds: 3));
    Position? position = await Geolocator.getCurrentPosition();
    return position;
  }
```

Apakah Anda mendapatkan koordinat GPS ketika run di browser? Mengapa demikian?

Capture hasil praktikum Anda berupa GIF dan lampirkan di README.

> **Jawaban**
Tidak, GPS tidak akan bekerja di browser karena browser tidak memiliki izin untuk mengakses layanan GPS perangkat secara langsung seperti halnya pada device fisik atau emulator mobile.

Hasil run di device.

![hasil](/pertemuan_11/img/gif/soal%2012.gif)

</details>

<details>

<summary>

## Praktikum 7: Manajemen Future dengan FutureBuilder
</summary>

### Langkah 1: Modifikasi method getPosition()

![hasil](/pertemuan_11/img/img31.png)

### Langkah 2: Tambah variabel

Menambahkan variabel position di class _LocationScreenState.

![hasil](/pertemuan_11/img/img32.png)

### Langkah 3: Tambah initState()

Tambah method ini dan set variabel position

```dart
  @override
  void initState() {
    super.initState();
    position = getPosition();
}
```
![hasil](/pertemuan_11/img/img33.png)

### Langkah 4: Edit method build()

Mengedit method build().

```dart
@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(title: const Text('Current Location - Sandra')),
    body: Center(
      child: FutureBuilder<Position>(
        future: position,
        builder: (BuildContext, AsyncSnapshot<Position> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (snapshot.connectionState == ConnectionState.done) {
            return Text(
              snapshot.data.toString()
            );
          }
          else {
            return const Text('');
          }
        },
      ),
    ),
  );
}
```

## Soal 13

Apakah ada perbedaan UI dengan praktikum sebelumnya? Mengapa demikian?

Capture hasil praktikum Anda berupa GIF dan lampirkan di README.

## Jawaban

Tidak, tidak ada perbedaan UI dengan praktikum sebelumnya. Hal ini dikarenakan menggunakan FutureBuilder yang akan menampilkan widget sesuai dengan status Future.

![hasil](/pertemuan_11/img/gif/soal13.gif)

### Langkah 5: Tambah handling error

Menambahkan handling error.

```dart
@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(title: const Text('Current Location - Sandra')),
    body: Center(
      child: FutureBuilder<Position>(
        future: position,
        builder: (BuildContext, AsyncSnapshot<Position> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (snapshot.connectionState == ConnectionState.done) {
            return Text(
              snapshot.data.toString()
            );
          } else if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return const Text('Something terrible happened!');
            }
            return Text(snapshot.data.toString());
          }
          else {
            return const Text('');
          }
        },
      ),
    ),
  );
}
```

## Soal 14
Apakah ada perbedaan UI dengan langkah sebelumnya? Mengapa demikian?

Capture hasil praktikum Anda berupa GIF dan lampirkan di README.

>**Jawaban**
Tidak ada perubahan pada tampilan UI dibandingkan langkah sebelumnya. Hal ini karena menggunakan FutureBuilder, yang akan menampilkan widget berdasarkan status Future dan sudah dilengkapi dengan penanganan error jika terjadi kesalahan.
![hasil](/pertemuan_11/img/gif/7.gif)

</details>

<details>
<summary>

## Praktikum 8: Navigation route dengan Future Function
</summary>

### Langkah 1: Buat file baru navigation_first.dart

Membuat file navigation_first.dart.

![hasil](/pertemuan_11/img/img34.png)

### Langkah 2: Isi kode navigation_first.dart

Isi kode di dalam class NavigationFirstScreen.

![hasil](/pertemuan_11/img/img35.png)

## Soal 15

Tambahkan nama panggilan Anda pada tiap properti title sebagai identitas pekerjaan Anda.

Silakan ganti dengan warna tema favorit Anda.

## Jawaban

![hasil](/pertemuan_11/img/img40.png)

### Langkah 3: Tambah method di class _NavigationFirstState

Menambahkan method `_navigateAndGetColor` di dalam class _NavigationFirstState.

```dart
Future _navigateAndGetColor(BuildContext context) async {
   color = await Navigator.push(context,
        MaterialPageRoute(builder: (context) => const NavigationSecond()),) ?? Colors.blue;
   setState(() {});
   });
}
```

### Langkah 4: Buat file baru navigation_second.dart

Membuat file navigation_second.dart.

### Langkah 5: Buat class NavigationSecond dengan StatefulWidget

Membuat class NavigationSecond dengan StatefulWidget.

```dart
import 'package:flutter/material.dart';

class NavigationSecond extends StatefulWidget {
  const NavigationSecond({super.key});

  @override
  State<NavigationSecond> createState() => _NavigationSecondState();
}

class _NavigationSecondState extends State<NavigationSecond> {
  @override
  Widget build(BuildContext context) {
    Color color;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Navigation Second - Sandra'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              child: const Text('Red'),
              onPressed: () {
                color = Colors.red.shade700;
                Navigator.pop(context, color);
              },
            ),
            ElevatedButton(
              child: const Text('Green'),
              onPressed: () {
                color = Colors.green.shade700;
                Navigator.pop(context, color);
              },
            ),
            ElevatedButton(
              child: const Text('Blue'),
              onPressed: () {
                color = Colors.blue.shade700;
                Navigator.pop(context, color);
              },
            ),
          ],
        ),
      ),
    );
  }
}
```

### Langkah 6: Edit main.dart

Lakukan edit properti home.

`home: const NavigationFirst(),`

### Langkah 7: Run

Menjalankan aplikasi.

## Soal 16

Cobalah klik setiap button, apa yang terjadi ? Mengapa demikian ?

Capture hasil praktikum Anda berupa GIF dan lampirkan di README.

>**Jawaban**
Ketika tombol Change Color diklik, pengguna akan diarahkan ke halaman kedua. Di halaman kedua, ada 3 tombol yang masing-masing berfungsi untuk mengubah warna latar belakang halaman utama sesuai dengan warna yang dipilih.

Hasil run aplikasi.

![hasil](/pertemuan_11/img/gif/8.gif)

</details>

<details>

<summary>

## Praktikum 9: Memanfaatkan async/await dengan Widget Dialog
</summary>

### Langkah 1: Buat file baru navigation_dialog.dart

Membuat file navigation_dialog.dart.
![hasil](/pertemuan_11/img/img39.png)

### Langkah 2: Isi kode navigation_dialog.dart

menambahkan kode di dalam class NavigationDialogScreen.

```dart
import 'package:flutter/material.dart';

class NavigationDialogScreen extends StatefulWidget {
  const NavigationDialogScreen({super.key});

  @override
  State<NavigationDialogScreen> createState() => _NavigationDialogScreenState();
}

class _NavigationDialogScreenState extends State<NavigationDialogScreen> {
  Color color = Colors.blue.shade700;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color,
      appBar: AppBar(
        title: const Text('Navigation Dialog Screen'),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text('Change Color'),
          onPressed: () {
          },
        ),
      ),
    );
  }
}
```

### Langkah 3: Tambah method async

Menambahkan method `_showColorDialog` dengan async.

```dart
  _showColorDialog(BuildContext context) async {
  await showDialog(
    barrierDismissible: false,
    context: context,
    builder: (_) {
      return AlertDialog(
        title: const Text('Very important question'),
        content: const Text('Please choose a color'),
        actions: <Widget>[
          TextButton(
            child: const Text('Red'),
            onPressed: () {
              Navigator.pop(context, Colors.red.shade700);
            },
          ),
          TextButton(
            child: const Text('Green'),
            onPressed: () {
              Navigator.pop(context, Colors.green.shade700);
            },
          ),
          TextButton(
            child: const Text('Blue'),
            onPressed: () {
              Navigator.pop(context, Colors.blue.shade700);
            },
          ),
        ],
      );
    },
  );
    setState(() {});
  }
```

### Langkah 4: Panggil method di ElevatedButton

Panggil method `_showColorDialog` di ElevatedButton.

![hasil](/pertemuan_11/img/img38.png)

### Langkah 5: Edit main.dart

Lakukan edit properti home.

`home: const NavigationDialogScreen(),`

### Langkah 6: Run

Menjalankan aplikasi.

## Soal 17

Cobalah klik setiap button, apa yang terjadi ? Mengapa demikian ?

Gantilah 3 warna pada langkah 3 dengan warna favorit Anda!

>**Jawaban**
Saat tombol `Change Color` diklik, akan muncul dialog yang menampilkan 3 tombol. Setiap tombol tersebut berfungsi untuk mengubah warna latar belakang halaman utama sesuai dengan warna yang dipilih.

Mengganti warna menjadi warna favorit.

![hasil](/pertemuan_11/img/img37.png)

Hasil run aplikasi.

![hasil](/pertemuan_11/img/gif/9.gif)

</details>