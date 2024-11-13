# Pertemuan 11 - Dasar State Management     

## Praktikum 1: Dasar State dengan Model-View               
### Langkah 1: Buat Project Baru        
![hasil](/pertemuan_10/img/praktikum%201%20langkah%201.png)

### Langkah 2: Membuat model task.dart      
Praktik terbaik untuk memulai adalah pada lapisan data (data layer). Ini akan memberi Anda gambaran yang jelas tentang aplikasi Anda, tanpa masuk ke detail antarmuka pengguna Anda. **Di folder model, buat file bernama task.dart dan buat class Task.** Class ini memiliki atribut description dengan tipe data String dan complete dengan tipe data Boolean, serta ada konstruktor. Kelas ini akan menyimpan data tugas untuk aplikasi kita. Tambahkan kode berikut:

``` dart        
class Task {
  final String description;
  final bool complete;
  
  const Task({
    this.complete = false,
    this.description = '',
  });
}       
```             
### Langkah 3: Buat file plan.dart          
Kita juga perlu sebuah List untuk menyimpan daftar rencana dalam aplikasi to-do ini. Buat **file plan.dart** di dalam folder **models** dan isi kode seperti berikut. 

```dart
import './task.dart';

class Plan {
  final String name;
  final List<Task> tasks;
  
  const Plan({this.name = '', this.tasks = const []});
}  
``` 

### Langkah 4: Buat file data_layer.dart        
Kita dapat membungkus beberapa data layer ke dalam sebuah file yang nanti akan mengekspor kedua model tersebut. Dengan begitu, proses impor akan lebih ringkas seiring berkembangnya aplikasi. Buat file bernama **data_layer.dart** di folder **models**. Kodenya hanya berisi **export** seperti berikut.

```dart
export 'plan.dart';
export 'task.dart';
```

### Langkah 5: Pindah ke file main.dart     
Ubah isi kode main.dart sebagai berikut.

```dart
import 'package:flutter/material.dart';
import './views/plan_screen.dart';

void main() => runApp(MasterPlanApp());

class MasterPlanApp extends StatelessWidget {
  const MasterPlanApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     theme: ThemeData(primarySwatch: Colors.purple),
     home: PlanScreen(),
    );
  }
} 
```           

### Langkah 6: buat plan_screen.dart        
Pada folder **views**, buatlah sebuah file **plan_screen.dart** dan gunakan templat StatefulWidget untuk membuat class PlanScreen. Isi kodenya adalah sebagai berikut. Gantilah teks ‘Namaku' dengan nama panggilan Anda pada title AppBar.

``` dart        
import '../models/data_layer.dart';
import 'package:flutter/material.dart';

class PlanScreen extends StatefulWidget {
  const PlanScreen({super.key});

  @override
  State createState() => _PlanScreenState();
}

class _PlanScreenState extends State<PlanScreen> {
  Plan plan = const Plan();

  @override
  Widget build(BuildContext context) {
   return Scaffold(
    // ganti ‘Namaku' dengan Nama panggilan Anda
    appBar: AppBar(title: const Text('Master Plan Sandra')),
    body: _buildList(),
    floatingActionButton: _buildAddTaskButton(),
   );
  }
}        
```     
### Langkah 7: buat method _buildAddTaskButton()        
Anda akan melihat beberapa error di langkah 6, karena method yang belum dibuat. Ayo kita buat mulai dari yang paling mudah yaitu tombol Tambah Rencana. Tambah kode berikut di bawah method build di dalam **class _PlanScreenState**. 

```dart
  Widget _buildAddTaskButton() {
  return FloatingActionButton(
   child: const Icon(Icons.add),
   onPressed: () {
     setState(() {
      plan = Plan(
       name: plan.name,
       tasks: List<Task>.from(plan.tasks)
       ..add(const Task()),
     );
    });
   },
  );
} 
```     

### Langkah 8: buat widget _buildList()     
Kita akan buat widget berupa List yang dapat dilakukan scroll, yaitu ListView.builder. Buat widget **ListView** seperti kode berikut ini.

```dart
Widget _buildList() {
  return ListView.builder(
   itemCount: plan.tasks.length,
   itemBuilder: (context, index) =>
   _buildTaskTile(plan.tasks[index], index),
  );
}
```
  
### Langkah 9: buat widget _buildTaskTile       
Dari langkah 8, kita butuh ListTile untuk menampilkan setiap nilai dari **plan.tasks**. Kita buat dinamis untuk setiap index data, sehingga membuat **view** menjadi lebih mudah. Tambahkan kode berikut ini.

```dart
Widget _buildTaskTile(Task task, int index) {
    return ListTile(
      leading: Checkbox(
          value: task.complete,
          onChanged: (selected) {
            setState(() {
              plan = Plan(
                name: plan.name,
                tasks: List<Task>.from(plan.tasks)
                  ..[index] = Task(
                    description: task.description,
                    complete: selected ?? false,
                  ),
              );
            });
          }),
      title: TextFormField(
        initialValue: task.description,
        onChanged: (text) {
          setState(() {
            plan = Plan(
              name: plan.name,
              tasks: List<Task>.from(plan.tasks)
                ..[index] = Task(
                  description: text,
                  complete: task.complete,
                ),
            );
          });
        },
      ),
    );
  }
```
         
### Langkah 10: Tambah Scroll Controller        
Anda dapat menambah tugas sebanyak-banyaknya, menandainya jika sudah beres, dan melakukan scroll jika sudah semakin banyak isinya. Namun, ada salah satu fitur tertentu di iOS perlu kita tambahkan. Ketika keyboard tampil, Anda akan kesulitan untuk mengisi yang paling bawah. Untuk mengatasi itu, Anda dapat menggunakan **ScrollController** untuk menghapus focus dari semua **TextField** selama event scroll dilakukan. Pada file **plan_screen.dart**, tambahkan variabel scroll controller di class State tepat setelah variabel **plan**.   

```dart
late ScrollController scrollController;
```
### Langkah 11: Tambah Scroll Listener      
Tambahkan method **initState()** setelah deklarasi variabel **scrollController** seperti kode berikut. 
```dart
@override
void initState() {
  super.initState();
  scrollController = ScrollController()
    ..addListener(() {
      FocusScope.of(context).requestFocus(FocusNode());
    });
}  
```  

### Langkah 12: Tambah controller dan keyboard behavior     
Tambahkan controller dan keyboard behavior pada ListView di method _buildList seperti kode berikut ini.

```dart
Widget _buildList() {
  return ListView.builder(
    controller: scrollController,
    keyboardDismissBehavior: Theme.of(context).platform ==
    TargetPlatform.iOS
          ? ScrollViewKeyboardDismissBehavior.onDrag
          : ScrollViewKeyboardDismissBehavior.manual,
   itemCount: plan.tasks.length,
   itemBuilder: (context, index) =>
   _buildTaskTile(plan.tasks[index], index),
  );
}
```
### Langkah 13: Terakhir, tambah method dispose()       
```dart
@override
void dispose() {
  scrollController.dispose();
  super.dispose();
}
```   

##  Tugas Praktikum 1: Dasar State dengan Model-View        
1. Selesaikan langkah-langkah praktikum tersebut, lalu dokumentasikan berupa GIF hasil akhir praktikum beserta penjelasannya di file README.md! Jika Anda menemukan ada yang error atau tidak berjalan dengan baik, silakan diperbaiki.          

2. Jelaskan maksud dari langkah 4 pada praktikum tersebut! Mengapa dilakukan demikian?      
**Jawab:**          
* Langkah 4 bertujuan berfungsi sebagai pusat ekspor untuk semua model terkait, yaitu plan.dart dan task.dart.    
* Karena dilkukan untuk pendekatan yang berfungsi memproses impor menjadi lebih efisien,rapi, mempermudah pengelolaan data layer sehingga dapat mengurangi risiko kesalahan impor ganda, dan meningkatkan keterbacaan kode. 

3. Mengapa perlu variabel plan di langkah 6 pada praktikum tersebut? Mengapa dibuat konstanta ?     
**Jawab:**        
* Variabel plan berfungsi untuk menyimpan dan mengelola data yang akan ditampilkan dan dimodifikasi pada layar PlanScreen.
* Variabel ini dibuat sebagai konstanta agar nilai awalnya tetap dan tidak berubah, yang membantu menjaga stabilitas aplikasi sebelum ada data yang dimasukkan atau diubah oleh pengguna.

4. Lakukan capture hasil dari Langkah 9 berupa GIF, kemudian jelaskan apa yang telah Anda buat!     
**Jawab:**  

    ![alt text](../img/HP1L9.gif)       

5. Apa kegunaan method pada Langkah 11 dan 13 dalam lifecyle state ?        
**Jawab:**      
* Langkah 11: initState() digunakan untuk mengaktifkan kontrol scroll saat layar dibuka.   
* Langkah 13: dispose() untuk membersihkan kontrol, saat layar ditutup sehingga aplikasi tetap efisien.

## Praktikum 2: Mengelola Data Layer dengan InheritedWidget dan InheritedNotifier       
### Langkah 1: Buat file plan_provider.dart     
Buat **folder baru provider** di dalam **folder lib**, lalu buat file baru dengan nama **plan_provider.dart** berisi kode seperti berikut.

``` dart        
import 'package:flutter/material.dart';
import '../models/data_layer.dart';

class PlanProvider extends InheritedNotifier<ValueNotifier<Plan>> {
  const PlanProvider({super.key, required Widget child, required
   ValueNotifier<Plan> notifier})
  : super(child: child, notifier: notifier);

  static ValueNotifier<Plan> of(BuildContext context) {
   return context.
    dependOnInheritedWidgetOfExactType<PlanProvider>()!.notifier!;
  }
}
```
### Langkah 2: Edit main.dart       
Gantilah pada bagian atribut **home** dengan **PlanProvider** seperti berikut. Jangan lupa sesuaikan bagian impor jika dibutuhkan.   

```dart
import 'package:flutter/material.dart';
import 'package:master_plan/models/plan.dart';
import './views/plan_screen.dart';
import 'package:master_plan/provider/plan_provider.dart';

void main() => runApp(MasterPlanApp());

class MasterPlanApp extends StatelessWidget {
  const MasterPlanApp({super.key});

  @override
  Widget build(BuildContext context) {
  return MaterialApp(
  theme: ThemeData(primarySwatch: Colors.purple),
  home: PlanProvider(
    notifier: ValueNotifier<Plan>(const Plan()),
    child: const PlanScreen(),
   ),
  );
  }
}
```
  
### Langkah 3: Tambah method pada model plan.dart       
Tambahkan dua method di dalam model **class Plan**  di **foder models** dan di dalam file **plan.dart** seperti kode berikut. 

```dart
import 'task.dart';

class Plan {
  final String name;
  final List<Task> tasks;
  
  const Plan({this.name = '', this.tasks = const []});
  // Langkah 3 praktikum 2
  int get completedCount => tasks
  .where((task) => task.complete)
  .length;

  String get completenessMessage =>
  '$completedCount out of ${tasks.length} tasks';
}
```

### Langkah 4: Pindah ke PlanScreen     
Edit PlanScreen agar menggunakan data dari **PlanProvider**. Hapus deklarasi variabel **plan** (ini akan membuat error). Kita akan perbaiki pada langkah 5 berikut ini. Edit pada folder **views** di file **plan_screen.dart**.  

![alt text](../img/image2.png)

### Langkah 5: Edit method _buildTaskTile       
Tambahkan BuildContext sebagai parameter dan gunakan PlanProvider sebagai sumber datanya.Edit pada folder **views** di file **plan_screen.dart**. Edit bagian kode seperti berikut. 

```dart
Widget _buildAddTaskButton(BuildContext context) {
  ValueNotifier<Plan> planNotifier = PlanProvider.of(context);
  return FloatingActionButton(
    child: const Icon(Icons.add),
    onPressed: () {
      Plan currentPlan = planNotifier.value;
      planNotifier.value = Plan(
        name: currentPlan.name,
        tasks: List<Task>.from(currentPlan.tasks)..add(const Task()),
      );
    },
  );
}
```

### Langkah 6: Edit method _buildTaskTile      
Tambahkan parameter BuildContext, gunakan PlanProvider sebagai sumber data. Ganti TextField menjadi TextFormField untuk membuat inisial data provider menjadi lebih mudah.  Edit pada folder **views** di file **plan_screen.dart**.

```dart
Widget _buildTaskTile(Task task, int index, BuildContext context) {
  ValueNotifier<Plan> planNotifier = PlanProvider.of(context);
  return ListTile(
    leading: Checkbox(
       value: task.complete,
       onChanged: (selected) {
         Plan currentPlan = planNotifier.value;
         planNotifier.value = Plan(
           name: currentPlan.name,
           tasks: List<Task>.from(currentPlan.tasks)
             ..[index] = Task(
               description: task.description,
               complete: selected ?? false,
             ),
         );
       }),
    title: TextFormField(
      initialValue: task.description,
      onChanged: (text) {
        Plan currentPlan = planNotifier.value;
        planNotifier.value = Plan(
          name: currentPlan.name,
          tasks: List<Task>.from(currentPlan.tasks)
            ..[index] = Task(
              description: text,
              complete: task.complete,
            ),
        );
      },
    ),
  );
}
```

### Langkah 7: Edit _buildList
Sesuaikan parameter pada bagian _buildTaskTile seperti kode berikut.Edit pada folder **views** di file **plan_screen.dart**. 

```dart
Widget _buildList(Plan plan) {
   return ListView.builder(
     controller: scrollController,
     itemCount: plan.tasks.length,
     itemBuilder: (context, index) =>
        _buildTaskTile(plan.tasks[index], index, context),
   );
}
```

### Langkah 8: Tetap di class PlanScreen  
Edit method build sehingga bisa tampil progress pada bagian bawah (footer). Caranya, bungkus (wrap) _buildList dengan widget Expanded dan masukkan ke dalam widget Column seperti kode pada Langkah 9. 

### Langkah 9: Tambah widget SafeArea 
Terakhir, tambahkan widget SafeArea dengan berisi completenessMessage pada akhir widget Column. Perhatikan kode berikut ini.Edit pada folder **views** di file **plan_screen.dart**. 

```dart
@override
Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(title: const Text('Master Plan')),
     body: ValueListenableBuilder<Plan>(
       valueListenable: PlanProvider.of(context),
       builder: (context, plan, child) {
         return Column(
           children: [
             Expanded(child: _buildList(plan)),
             SafeArea(child: Text(plan.completenessMessage))
           ],
         );
       },
     ),
     floatingActionButton: _buildAddTaskButton(context),
   );
}
```
 
## Tugas Praktikum 2: InheritedWidget   
1. Selesaikan langkah-langkah praktikum tersebut, lalu dokumentasikan berupa GIF hasil akhir praktikum beserta penjelasannya di file README.md! Jika Anda menemukan ada yang error atau tidak berjalan dengan baik, silakan diperbaiki sesuai dengan tujuan aplikasi tersebut dibuat.   

2. Jelaskan mana yang dimaksud InheritedWidget pada langkah 1 tersebut! Mengapa yang digunakan InheritedNotifier?   
**Jawab:**        
* Pada langkah 1, PlanProvider berperan sebagai InheritedWidget, yang memungkinkan widget anak mengakses data tanpa perlu mengirim data secara eksplisit ke setiap widget.
* 'InheritedNotifier' dipilih karena, selain mewarisi fungsi InheritedWidget, dan widget akan memperbarui tampilan secara otomatis saat nilai notifier berubah. Jadi, setiap kali ValueNotifier<Plan> diperbarui, semua widget anak yang bergantung pada data Plan akan ikut diperbarui.

3. Jelaskan maksud dari method di langkah 3 pada praktikum tersebut! Mengapa dilakukan demikian?    
**Jawab:**    
* 'completedCount': Menghitung jumlah tugas yang telah selesai dalam daftar tasks.        
  'completenessMessage': Menghasilkan pesan yang menunjukkan jumlah tugas selesai dibandingkan dengan total tugas.
* Untuk memudahkan pemantauan kemajuan plan secara langsung, sehingga tampilan pada aplikasi dapat menampilkan informasi yang jelas tentang status penyelesaian tugas tanpa perlu dihitung lagi.

4. Lakukan capture hasil dari Langkah 9 berupa GIF, kemudian jelaskan apa yang telah Anda buat!   
**Jawab:** 

    ![alt text](../img/HP2L9.gif)

## Praktikum 3: Membuat State di Multiple Screens   
### Langkah 1: Edit PlanProvider 
Perhatikan kode berikut, edit **class PlanProvider** di **folder provider** di **file plan_provider.dart** sehingga dapat menangani List Plan.   
```dart
class PlanProvider extends
InheritedNotifier<ValueNotifier<List<Plan>>> {
  const PlanProvider({super.key, required Widget child, required
ValueNotifier<List<Plan>> notifier})
     : super(child: child, notifier: notifier);

  static ValueNotifier<List<Plan>> of(BuildContext context) {
    return context.
dependOnInheritedWidgetOfExactType<PlanProvider>()!.notifier!;
  }
}
``` 

### Langkah 2: Edit main.dart
Langkah sebelumnya dapat menyebabkan error pada **main.dart** dan **plan_screen.dart**. Pada method build, gantilah menjadi kode seperti ini.  

```dart
@override
Widget build(BuildContext context) {
  return PlanProvider(
    notifier: ValueNotifier<List<Plan>>(const []),
    child: MaterialApp(
      title: 'State management app',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const PlanScreen(),
    ),
  );
}
```

### Langkah 3: Edit plan_screen.dart    
Tambahkan variabel plan dan atribut pada constructor-nya seperti berikut.

```dart
final Plan plan;
const PlanScreen({super.key, required this.plan});
```
   
### Langkah 4: Error 
Itu akan terjadi error setiap kali memanggil PlanProvider.of(context). Itu terjadi karena screen saat ini hanya menerima tugas-tugas untuk satu kelompok Plan, tapi sekarang PlanProvider menjadi list dari objek plan tersebut.   

### Langkah 5: Tambah getter Plan  
Tambahkan getter pada _PlanScreenState seperti kode berikut. Tambahkan pada **lib/views/plan_screen.dart**

```dart
class _PlanScreenState extends State<PlanScreen> {
  late ScrollController scrollController;
  Plan get plan => widget.plan;  
``` 
 
### Langkah 6: Method initState()     
Pada bagian ini kode tetap seperti berikut. Tambahkan pada **lib/views/plan_screen.dart**

```dart
@override
void initState() {
   super.initState();
   scrollController = ScrollController()
    ..addListener(() {
      FocusScope.of(context).requestFocus(FocusNode());
    });
}
```

### Langkah 7: Widget build   
Pastikan Anda telah merubah ke List dan mengubah nilai pada currentPlan seperti kode berikut ini.Tambahkan pada **lib/views/plan_screen.dart**

```dart
 @override
  Widget build(BuildContext context) {
    ValueNotifier<List<Plan>> plansNotifier = PlanProvider.of(context);

    return Scaffold(
      appBar: AppBar(title: Text(_plan.name)),
      body: ValueListenableBuilder<List<Plan>>(
        valueListenable: plansNotifier,
        builder: (context, plans, child) {
          Plan currentPlan = plans.firstWhere((p) => p.name == plan.
name);
          return Column(
            children: [
              Expanded(child: _buildList(currentPlan)),
              SafeArea(child: Text(currentPlan.
completenessMessage)),
            ],);},),
      floatingActionButton: _buildAddTaskButton(context,)
  ,);
 }

  Widget _buildAddTaskButton(BuildContext context) {
    ValueNotifier<List<Plan>> planNotifier = PlanProvider.
of(context);
    return FloatingActionButton(
      child: const Icon(Icons.add),
      onPressed: () {
        Plan currentPlan = plan;
        int planIndex =
            planNotifier.value.indexWhere((p) => p.name == currentPlan.name);
        List<Task> updatedTasks = List<Task>.from(currentPlan.tasks)
          ..add(const Task());
        planNotifier.value = List<Plan>.from(planNotifier.value)
          ..[planIndex] = Plan(
            name: currentPlan.name,
            tasks: updatedTasks,
          );
        plan = Plan(
          name: currentPlan.name,
          tasks: updatedTasks,
        );},);
  }
```

### Langkah 8: Edit _buildTaskTile    
Pastikan ubah ke List dan variabel planNotifier seperti kode berikut ini. Tambahkan pada **lib/views/plan_screen.dart**
```dart
Widget _buildTaskTile(Task task, int index, BuildContext context){
    ValueNotifier<List<Plan>> planNotifier = PlanProvider.
     of(context);
    return ListTile(
      leading: Checkbox(
         value: task.complete,
         onChanged: (selected) {
           Plan currentPlan = plan;
           int planIndex = planNotifier.value
              .indexWhere((p) => p.name == currentPlan.name);
           planNotifier.value = List<Plan>.from(planNotifier.value)
             ..[planIndex] = Plan(
               name: currentPlan.name,
               tasks: List<Task>.from(currentPlan.tasks)
                 ..[index] = Task(
                   description: task.description,
                   complete: selected ?? false,
                 ),);
         }),
      title: TextFormField(
        initialValue: task.description,
        onChanged: (text) {
          Plan currentPlan = plan;
          int planIndex =
             planNotifier.value.indexWhere((p) => p.name ==
      currentPlan.name);
          planNotifier.value = List<Plan>.from(planNotifier.value)
            ..[planIndex] = Plan(
              name: currentPlan.name,
              tasks: List<Task>.from(currentPlan.tasks)
                ..[index] = Task(
                  description: text,
                  complete: task.complete,
                ),
            );
          },
        ),
      );
    }  
```

### Langkah 9: Buat screen baru   
Pada folder **view**, buatlah file baru dengan nama **plan_creator_screen.dart** dan deklarasikan dengan StatefulWidget bernama PlanCreatorScreen. Gantilah di **main.dart** pada atribut home menjadi seperti berikut. 

``` dart    
home: const PlanCreatorScreen(),
```     
### Langkah 10: Pindah ke class _PlanCreatorScreenState   
Kita perlu tambahkan variabel TextEditingController sehingga bisa membuat TextField sederhana untuk menambah Plan baru. Jangan lupa tambahkan dispose ketika widget unmounted seperti kode berikut.

```dart
final textController = TextEditingController();

@override
void dispose() {
  textController.dispose();
  super.dispose();
}
```
   
### Langkah 11: Pindah ke method build    
Letakkan method Widget build berikut di atas void dispose. Gantilah ‘Namaku' dengan nama panggilan Anda. Masih dalam folder **lib/views/plan_creator_screen.dart**.
```dart
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ganti ‘Namaku' dengan nama panggilan Anda
      appBar: AppBar(title: const Text('Master Plans Astrid')),
      body: Column(children: [
        _buildListCreator(),
        Expanded(child: _buildMasterPlans())
      ]),
    );
  }
```

### Langkah 12: Buat widget _buildListCreator   
Buatlah widget berikut setelah widget build. Masih dalam folder **lib/views/plan_creator_screen.dart**.

```dart
Widget _buildListCreator() {
  return Padding(
     padding: const EdgeInsets.all(20.0),
     child: Material(
       color: Theme.of(context).cardColor,
       elevation: 10,
       child: TextField(
          controller: textController,
          decoration: const InputDecoration(
             labelText: 'Add a plan',
             contentPadding: EdgeInsets.all(20)),
          onEditingComplete: addPlan),
     ));
}
```

### Langkah 13: Buat void addPlan()   
Tambahkan method berikut untuk menerima inputan dari user berupa text plan. Masih dalam folder **lib/views/plan_creator_screen.dart**.

```dart
void addPlan() {
  final text = textController.text;
    if (text.isEmpty) {
      return;
    }
    final plan = Plan(name: text, tasks: []);
    ValueNotifier<List<Plan>> planNotifier =
PlanProvider.of(context);
    planNotifier.value = List<Plan>.from(planNotifier.value)..
add(plan);
    textController.clear();
    FocusScope.of(context).requestFocus(FocusNode());
    setState(() {});
}   
```

### Langkah 14: Buat widget _buildMasterPlans()   
Tambahkan widget seperti kode berikut.Masih dalam folder **lib/views/plan_creator_screen.dart**.

```dart
Widget _buildMasterPlans() {
  ValueNotifier<List<Plan>> planNotifier = PlanProvider.of(context);
    List<Plan> plans = planNotifier.value;

    if (plans.isEmpty) {
      return Column(
         mainAxisAlignment: MainAxisAlignment.center,
         children: <Widget>[
           const Icon(Icons.note, size: 100, color: Colors.grey),
           Text('Anda belum memiliki rencana apapun.',
              style: Theme.of(context).textTheme.headlineSmall)
         ]);
    }
    return ListView.builder(
        itemCount: plans.length,
        itemBuilder: (context, index) {
          final plan = plans[index];
          return ListTile(
              title: Text(plan.name),
              subtitle: Text(plan.completenessMessage),
              onTap: () {
                Navigator.of(context).push(
                   MaterialPageRoute(builder: (_) =>
PlanScreen(plan: plan,)));
              });
        });
}
```
## Tugas Praktikum 3: State di Multiple Screens   
1. Selesaikan langkah-langkah praktikum tersebut, lalu dokumentasikan berupa GIF hasil akhir praktikum beserta penjelasannya di file README.md! Jika Anda menemukan ada yang error atau tidak berjalan dengan baik, silakan diperbaiki sesuai dengan tujuan aplikasi tersebut dibuat.   

2. Berdasarkan Praktikum 3 yang telah Anda lakukan, jelaskan maksud dari gambar diagram berikut ini!
![alt text](image.png)

    **Jawab:**    
* MaterialApp: Menginisialisasi aplikasi dan menjadi widget root yang membungkus seluruh aplikasi.    
* PlanProvider: Berfungsi menyimpan data terkait plan yang digunakan di dalam aplikasi, untuk mengakses data di seluruh widget.
* PlanCreatorScreen: Merupakan layar utama yang ditampilkan saat aplikasi dimulai, berisi:
  - Column: Menyusun elemen secara vertikal.
  - TextField: Untuk menginputkan teks rencana(plan).
  - Expanded: Menampung ListView yang menampilkan daftar rencana.    
* Navigator Push: Memindahkan pengguna dari PlanCreatorScreen ke PlanScreen.    
* Plan Screen
  - Scaffold: Struktur dasar layar yang menyediakan layout dan fitur seperti AppBar dan Drawer.
  - Column: Menyusun konten layar secara vertikal.    
  - Expanded: Menampung ListView untuk menampilkan daftar tugas.   
  - SafeArea: Memastikan konten tampil aman di area layar   
* Interaksi Pengguna: Pengguna dapat menambahkan rencana dan melihat daftar tugas setelah navigasi.

3. Lakukan capture hasil dari Langkah 14 berupa GIF, kemudian jelaskan apa yang telah Anda buat!    
**Jawab:**

    ![alt text](../img/HP3L14.gif)