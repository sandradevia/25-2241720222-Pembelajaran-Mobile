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

![hasil](/pertemuan_12/img/praktikum1.gif)

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
```dart
class NumberStream {
  final StreamController<int> controller = StreamController<int>();
  void addNumberToSink(int newNumber) {
    controller.sink.add(newNumber);
  }
}
```

### Langkah 5 : Menambah method `close()`
```dart
class NumberStream {
  final StreamController<int> controller = StreamController<int>();
  void addNumberToSink(int newNumber) {
    controller.sink.add(newNumber);
  }

  close() {
    controller.close();
  }
}
```

### Langkah 6 : Membuka `main.dart`
```dart
import 'dart:async';
import 'dart:math';
```

### Langkah 7 : Menambah variabel
Di dalam `class _StreamHomePageState` ketik variabel berikut
```dart
int lastNumber = 0;
  late StreamController numberStreamController;
  late NumberStream numberStream;
```

### Langkah 8 : Edit `iniState()`
```dart
  @override
   void initState() {
    numberStream = NumberStream();
    numberStreamController = numberStream.controller;
    Stream stream = numberStreamController.stream;
    stream.listen((event) {
      setState(() {
        lastNumber = event;
      });
    });
    super.initState();
  }
```

### Langkah 9 : Edit dispose()
```dart
  @override
    void dispose() {
      numberStreamController.close();
      super.dispose();
    }
```

### Langkah 10 : Menambah method `addRandomNumber()`
```dart
void addRandomNumber() {
  Random random = Random();
  int myNum = random.nextInt(10);
  numberStream.addNumberToSink(myNum);
}
```

### Langkah 11 : Edit method `build()`
```dart
body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              lastNumber.toString(),
              style: TextStyle(fontSize: 24),
            ),
            ElevatedButton(
              onPressed: addRandomNumber,
              child: Text('New Random Number'),
            ),
          ],
        ),
      ),
```
### Langkah 12 : Run
![hasil](/pertemuan_12/img/praktikum2.gif)

> **Soal 6**
>- Jelaskan maksud kode langkah 8 dan 10 tersebut!
>* Jelaskan maksud kode langkah 8 dan 10 tersebut!
>
>**Jawab:**
>
>**Langkah 8**
>* numberStream = NumberStream();
>    Membuat instance dari kelas NumberStream yang berisi StreamController. Ini digunakan untuk menghasilkan dan mengelola data dalam bentuk aliran (stream).
>
>* numberStreamController = numberStream.controller;
>    Menghubungkan variabel numberStreamController ke StreamController yang ada di dalam kelas NumberStream. Dengan ini, kita dapat berkomunikasi dengan sink dan stream dari controller tersebut.
>
>* Stream stream = numberStreamController.stream;
>    Mendapatkan stream dari controller untuk mendengarkan data yang dikirim melalui sink.
>
>* stream.listen((event) {...});
>    Menambahkan pendengar (listener) ke dalam stream untuk menangkap data baru yang ditambahkan ke sink. Dalam hal ini, setiap data baru akan diperbarui ke variabel lastNumber menggunakan setState(), sehingga UI akan terupdate.
>
>**Langkah 10**
>
>* Random random = Random();
>    Membuat instance dari kelas Random untuk menghasilkan angka acak.
>
>* int myNum = random.nextInt(10);
>    Menghasilkan angka acak dari 0 hingga 9 menggunakan metode nextInt().
>
>* numberStream.addNumberToSink(myNum);
>    Memanggil metode addNumberToSink() dari instance NumberStream untuk mengirim angka acak yang dihasilkan ke sink. Data ini kemudian dapat didengar oleh listener di stream (Langkah 8).

### Langkah 13 : Buka stream.dart
Tambahkan method berikut ini.

```dart
addError() {
    controller.sink.addError('error');
  }
```

### Langkah 14 : Buka main.dart
Tambahkan method onError di dalam class StreamHomePageState pada method listen di fungsi initState() seperti berikut ini.

```dart
stream.listen((event) {
        setState(() {
          lastNumber = event;
        });
      },
      onError: (error) {
        setState(() {
          lastNumber = -1;
        });
      },
    );
```

### Langkah 15 : Edit method `addRandomNumber()`
Lakukan comment pada dua baris kode berikut, lalu ketik kode seperti berikut ini.

>**Soal 7**
>* Jelaskan maksud kode langkah 13 sampai 15 tersebut!
> **Jawab:** 
>**Langkah 13:**
    Metode addError() digunakan untuk memasukkan error ke dalam stream secara manual. Ini berguna untuk menguji pengelolaan error oleh aplikasi.
>
   > **Langkah 14:**
    onError pada listener diatur untuk menangani error yang diterima dari stream. Jika error diterima, nilai lastNumber diatur menjadi -1 untuk memberi tahu pengguna bahwa ada kesalahan.
>
   > **Langkah 15:**
    Metode addRandomNumber() dimodifikasi untuk menggabungkan logika pengiriman data dan simulasi error. Jika angka acak kurang dari 5, aplikasi memicu error menggunakan addError(); jika tidak, angka acak dikirim ke stream seperti biasa.

</details>
<details>
<summary>

## Praktikum 3: Injeksi data ke streams
</summary>


### **Langkah 1: Buka main.dart**
Tambahkan variabel baru di dalam class _StreamHomePageState
```dart
late StreamTransformer transformer;
```

### **Langkah 2: Tambahkan kode ini di initState**
```dart
 final transformer = StreamTransformer<int, int>.fromHandlers(
        handleData: (value, sink) {
          sink.add(value * 10);
        },
        handleError: (error, trace, sink) {
          sink.add(-1);
        },
        handleDone: (sink) => sink.close()
    );
```

### **Langkah 3: Tetap di initState**
Lakukan edit seperti kode berikut.
```dart
stream.transform(transformer).listen((event) {
        setState(() {
          lastNumber = event;
        });
      },
      onError: (error) {
        setState(() {
          lastNumber = -1;
        });
      },
    );
    super.initState();
```

### **Langkah 4: Run**
Terakhir, run atau tekan F5 untuk melihat hasilnya jika memang belum running. Bisa juga lakukan hot restart jika aplikasi sudah running. Maka hasilnya akan seperti gambar berikut ini. Anda akan melihat tampilan angka dari 0 hingga 90.

![hasil](/pertemuan_12/img/praktikum3img1.gif)

</details>
<details>
<summary>

## Praktikum 4: Subscribe ke stream events
</summary>

### **Langkah 1: Tambah variabel**
Tambahkan variabel berikut di class _StreamHomePageState
```dart
late StreamSubscription subscription;
```

### **Langkah 2: Edit initState()**
Edit kode seperti berikut ini.

```dart
void initState() {
    super.initState();
    numberStream = NumberStream();
    numberStreamController = numberStream.controller;

    // Menyusun stream dan mendengarkan perubahan data
    Stream stream = numberStreamController.stream;
    subscription = stream.listen(
      (event) {
        setState(() {
          lastNumber = event;
        });
      },
```

### **Langkah 3: Tetap di initState()**
Tambahkan kode berikut ini.

```dart
      subscription.onError((error) {
        setState(() {
          lastNumber = -1;
        });
      });
```

### **Langkah 4: Tambah properti onDone()**
Tambahkan dibawahnya kode ini setelah onError
```dart
subscription.onDone(() {
        print('OnDone was called');
      });
```

### **Langkah 5: Tambah method baru**
Ketik method ini di dalam class _StreamHomePageState
```dart
void stopStream() {
    numberStreamController.close();  
```

### **Langkah 6: Pindah ke method dispose()**
Jika method dispose() belum ada, Anda dapat mengetiknya dan dibuat override. Ketik kode ini didalamnya.
```dart
  @override
  void dispose() {
    subscription.cancel();  
    super.dispose();
  }
```

### **Langkah 7: Pindah ke method build()**
Tambahkan button kedua dengan isi kode seperti berikut ini.
```dart
ElevatedButton(
              onPressed: () => stopStream,
              child: const Text('Stop Subscription'),
            )
```

### **Langkah 8: Edit method addRandomNumber()**
Edit kode seperti berikut ini.

 ```dart
  void addRandomNumber() {
    Random random = Random();
    int myNum = random.nextInt(10);
    if (!numberStreamController.isClosed) {
      numberStream.addNumberToSink(myNum);
    } else {
      setState(() {
        lastNumber = -1;
      });
    }
  }
 ```

### **Langkah 9: Run**
Anda akan melihat dua button seperti gambar berikut.

![alt text](/pertemuan_12/img/praktikum4img1.gif)

### **Langkah 10: Tekan button ‘Stop Subscription'**
Anda akan melihat pesan di Debug Console seperti berikut.
![hasil](/pertemuan_12/img/praktikum%204.png)

>**Soal 9**
>Jelaskan maksud kode langkah 2, 6 dan 8 tersebut!
>**Langkah 2:**
Kode ini menginisialisasi stream dan mendengarkan perubahan data yang dikirimkan oleh stream. Ketika data baru diterima, setState() dipanggil untuk memperbarui UI.
>
>**Langkah 6:**
Pada langkah ini, kita membatalkan subscription pada stream ketika widget dibuang (dispose()) untuk mencegah kebocoran memori dan memastikan tidak ada data yang diterima lagi setelah widget dihapus.
>
>**Langkah 8:**
Kode ini memeriksa apakah StreamController masih terbuka sebelum menambahkan data baru ke stream. Jika stream sudah ditutup, nilai lastNumber diperbarui untuk menandakan kesalahan.
![hasil](/pertemuan_12/img/praktikum4img2.gif)

</details>
<details>
<summary>

## Praktikum 5: Multiple stream subscriptions
</summary>

### **Langkah 1: Buka file main.dart**
Ketik variabel berikut di class _StreamHomePageState
```dart
late StreamSubscription subscription2;
  String values = '';
```

### **Langkah 2: Edit initState()**
Ketik kode seperti berikut.
```dart
    subscription = stream.listen((event) {
        setState(() {
          values += '$event -';
          // lastNumber = event;
        });
      });
      subscription = stream.listen((event) {
        setState(() {
          values += '$event -';
        });
      });
```

### **Langkah 3: Run**
Lakukan run maka akan tampil error.
![hasil](/pertemuan_12/img/praktikum5.png)
>**Soal 10**
>Jelaskan mengapa error itu bisa terjadi ?
>**Jawab**
>
>Error terjadi karena variabel subscription diinisialisasi dua kali untuk stream yang sama, yang menyebabkan konflik dalam mendengarkan data. Untuk memperbaikinya, hanya satu subscription yang dibutuhkan untuk stream, dan kedua pembaruan dapat dilakukan dalam satu listener.

### **Langkah 4: Set broadcast stream**
```dart
Ketik kode seperti berikut di method initState()
numberStream = NumberStream();
    numberStreamController = numberStream.controller;
    Stream stream = numberStreamController.stream.asBroadcastStream();
```

### **Langkah 5: Edit method build()**
Tambahkan text seperti berikut
```dart
child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(values),
```

### **Langkah 6: Run**
Tekan button ‘New Random Number' beberapa kali, maka akan tampil teks angka terus bertambah sebanyak dua kali.

![hasil](/pertemuan_12/img/praktikum5.gif)

>**Soal 11**
>Jelaskan mengapa hal itu bisa terjadi ?
>**Jawab:**
>    Hal ini terjadi karena setelah stream diubah menjadi broadcast stream, event yang sama diterima oleh lebih dari satu listener. Oleh karena itu, setiap event yang dihasilkan akan diproses oleh semua listener, menyebabkan pembaruan pada UI dua kali.

</details>
<details>
<summary>

## Praktikum 6: StreamBuilder
</summary>

### **Langkah 1: Buat Project Baru**
Buatlah sebuah project flutter baru dengan nama streambuilder_nama (beri nama panggilan Anda) di folder week-13/src/ repository GitHub Anda.

![alt text](img/16.png)

### **Langkah 2: Buat file baru stream.dart**
Ketik kode ini

```dart
class NumberStream {}
```

### **Langkah 3: Tetap di file stream.dart**
Ketik kode seperti berikut.
```dart
import 'dart:math';

class NumberStream {
  Stream<int> getNumbers() async* {
    yield* Stream.periodic(const Duration(seconds: 1), (int t) {
      Random random = Random();
      int myNum = random.nextInt(10); // Menghasilkan angka acak antara 0 dan 9
      return myNum;
    });
  }
}
```

### **Langkah 4: Edit main.dart**
Ketik kode seperti berikut ini.
```dart
import 'package:flutter/material.dart';
import 'stream.dart';
import 'dart:async';

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
  State<StreamHomePage> createState() => _StreamHomePageState();
}

class _StreamHomePageState extends State<StreamHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stream'),
      ),
      body: Container(
      ),
    );
  }
}
```

### **Langkah 5: Tambah variabel**
Di dalam class _StreamHomePageState, ketika variabel ini.
```dart
late Stream<int> NumberStream;
```

### **Langkah 6: Edit initState()**
Ketik kode seperti berikut.

```dart
  @override
  void initState() {
    super.initState();
    numberStream = NumberStream().getNumbers(); 
  }

```
### **Langkah 7: Edit method build()**
```dart
body: StreamBuilder<int>(
        stream: numberStream, // Pastikan numberStream adalah Stream<int>
        initialData: 0,        // Nilai awal stream
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            print('Error!');
            // Jika ada error, Anda bisa menampilkan pesan atau widget lainnya
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          if (snapshot.hasData) {
            return Center(
              child: Text(
                snapshot.data.toString(),
                style: const TextStyle(fontSize: 96),
              ),
            );
          } else {
            // Menampilkan widget kosong jika tidak ada data
            return const SizedBox.shrink();
          }
        },
      ),
```

### **Langkah 8: Run**
Hasilnya, setiap detik akan tampil angka baru seperti berikut.

>**Soal 12**
>Jelaskan maksud kode pada langkah 3 dan 7 !
> **Jawab:**
> **Langkah 3:** 
  >  Membuat stream yang menghasilkan angka acak setiap detik menggunakan Stream.periodic dan Random.
>
  >  **Langkah 7:** 
    
 >   Menampilkan angka acak yang diterima dari stream menggunakan StreamBuilder yang mengupdate tampilan setiap kali ada data baru.   

![hasil](/pertemuan_12/img/praktikum6-ezgif.com-video-to-gif-converter.gif)

</details>
<details>
<summary>

## Praktikum 7: BLoC Pattern
</summary>

### **Langkah 1: Buat Project baru**
Buatlah sebuah project flutter baru dengan nama bloc_random_nama (beri nama panggilan Anda) di folder week-13/src/ repository GitHub Anda. Lalu buat file baru di folder lib dengan nama random_bloc.dart

![alt text](img/17.png)

### **Langkah 2: Isi kode random_bloc.dart**
Ketik kode impor berikut ini.
```dart
import 'dart:async';
import 'dart:math';
```

### **Langkah 3: Buat class RandomNumberBloc()**
```dart
class RandomNumberBloc {}
```

### **Langkah 4: Buat variabel StreamController**
Di dalam class RandomNumberBloc() ketik variabel berikut ini
```dart
// StreamController for input events
  final _generateRandomController = StreamController<void>();

// StreamController for output
  final _randomNumberController = StreamController<int>();

// Input Sink
  Sink<void> get generateRandom => _generateRandomController.sink;

// Output Stream
  Stream<int> get randomNumber => _randomNumberController.stream;
```

### **Langkah 5: Buat constructor**
```dart
RandomNumberBloc() {
    // Mendengarkan input dari _generateRandomController
    _generateRandomController.stream.listen((_) {
      // Menghasilkan angka acak antara 0 dan 9
      final random = Random().nextInt(10);

      // Menambahkan angka acak ke _randomNumberController
      _randomNumberController.sink.add(random);
    });
  }
```

### **Langkah 6: Buat method dispose()**
```dart
  void dispose() {
    _generateRandomController.close();
    _randomNumberController.close();
  }
```

### **Langkah 7: Edit main.dart**
```dart
import 'package:bloc_random_astrid/random_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
       primarySwatch: Colors.blue,
      ),
      home: const RandomScreen(),
    );
  }
}
```

### **Langkah 8: Buat file baru random_screen.dart**
Di dalam folder lib project Anda, buatlah file baru ini.

### **Langkah 9: Lakukan impor material dan random_bloc.dart**
Ketik kode ini di file baru random_screen.dart
```dart
import 'package:flutter/material.dart';
import 'random_bloc.dart';
```

### **Langkah 10: Buat StatefulWidget RandomScreen**
Buatlah di dalam file random_screen.dart
```dart
class RandomScreen extends StatefulWidget {
  const RandomScreen({super.key});

  @override
  State<RandomScreen> createState() => _RandomScreenState();
}
```

### **Langkah 11: Buat variabel**
Ketik kode ini di dalam class _RandomScreenState
```dart
final _bloc = RandomNumberBloc();
```

### **Langkah 12: Buat method dispose()**
Ketik kode ini di dalam class _StreamHomePageState
```dart
  @override
  void dispose() {
    _bloc.dispose(); // Menutup stream controller saat widget dihancurkan
    super.dispose();
  }

```

### **Langkah 13: Edit method build()**
Ketik kode ini di dalam class _StreamHomePageState
```dart
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Random Number Sandra'),
      ),
      body: Center(
        child: StreamBuilder<int>(
          stream: _bloc.randomNumber,
          initialData: 0, // Nilai awal
          builder: (context, snapshot) {
              return Text(
                'Random Number: ${snapshot.data}',
                style: const TextStyle(fontSize: 24),
              );
            },         
          ),
        ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _bloc.generateRandom.add(null), // Memicu event generateRandom
        child: const Icon(Icons.refresh),
      ),
    );
  }
```

Run aplikasi, maka Anda akan melihat angka acak antara angka 0 sampai 9 setiap kali menekan tombol FloactingActionButton.
![hasil](/pertemuan_12/img/praktikum7-ezgif.com-video-to-gif-converter.gif)

>**Soal 13**
>Jelaskan maksud praktikum ini ! Dimanakah letak konsep pola BLoC-nya ?
>**Jawab:**
>**Penjelasan Praktikum:**
>    **Tujuan:**
>
>    Menerapkan pola arsitektur BLoC (Business Logic Component) untuk memisahkan logika bisnis dari UI.

>    **Konsep BLoC:**
>
>    * StreamController: Digunakan untuk mengelola input dan output.
>    * Sink: Menerima input berupa event.
>    * Stream: Memberikan output berupa angka acak ke UI.
>    * StreamBuilder: Komponen Flutter untuk menghubungkan stream dengan widget.
>
>    **Letak Konsep BLoC:**
>
>    * Input event (tombol ditekan) diproses di BLoC (RandomNumberBloc).
>    * Hasil (angka acak) dikirimkan ke UI melalui stream.
>    * UI tidak memiliki logika untuk menghitung angka acak, tetapi hanya menampilkan data yang dikirim dari BLoC.
