void main() {
  var halogens = {'fluorine', 'chlorine', 'bromine', 'iodine', 'astatine'};
  print(halogens);

  var names1 = <String>{};
  Set<String> names2 = {}; // This works, too.
  var names3 = {}; // Creates a map, not a set.

  // Menambahkan elemen menggunakan .add()
  names1.add('Sandra Devia Arge');
  names1.add('2241720222');

  // Menambahkan elemen menggunakan .addAll()
  names2.addAll({'Sandra Devia Arge', '2241720222'});

  print(names1);
  print(names2);
  print(names3);
}
