import 'package:belanja/models/item.dart';
import 'package:belanja/widgets/item_card.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final List<Item> items = [
    Item(
      name: 'Sugar',
      price: 5000,
      image:
          'https://cdn.britannica.com/73/239573-050-E9A4DB36/sugar-cubes.jpg',
      rating: 4.7,
    ),
    Item(
      name: 'Salt',
      price: 2000,
      rating: 4.5,
      image:
          'https://th.bing.com/th/id/OIP.sC7-MZFkiC8yJxjSK_TzRQAAAA?rs=1&pid=ImgDetMain',
    ),
    Item(
      name: 'Rice',
      price: 10000,
      rating: 4.9,
      image:
          'https://img.freepik.com/premium-photo/raw-jasmine-rice-grain-with-ear-paddy-agricultural-products-food-asian-thai-rice-white-bowl-sack-background_73523-3077.jpg?w=1000',
    ),
  ];

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shopping List'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(8),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 300,
                  childAspectRatio: 1,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                ),
                itemBuilder: (context, index) {
                  return ItemCard(item: items[index]);
                },
                itemCount: items.length,
              ),
            ),
          ),
          const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('Nama : Sandra Devia Arge')),
        ],
      ),
    );
  }
}
