void main() {
  var gifts = {
    // Key:    Value
    'first': 'partridge',
    'second': 'turtledoves',
    'fifth': 1,
    'name': 'Sandra Devia Arge',
    'NIM': '2241720222',
  };

  var nobleGases = {
    2: 'helium',
    10: 'neon',
    18: 2,
    1: 'Sandra Devia Arge',
    0: '2241720222',
  };

  print(gifts);
  print(nobleGases);

  var mhs1 = Map<String, String>();
  gifts['first'] = 'partridge';
  gifts['second'] = 'turtledoves';
  gifts['fifth'] = 'golden rings';
  mhs1['name'] = 'Sandra Devia Arge';
  mhs1['NIM'] = '2241720222';

  var mhs2 = Map<int, String>();
  nobleGases[2] = 'helium';
  nobleGases[10] = 'neon';
  nobleGases[18] = 'argon';
  mhs2[1] = 'Sandra Devia Arge';
  mhs2[0] = '2241720222';

  print(gifts);
  print(nobleGases);
}
