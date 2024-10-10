import 'package:belanja/models/item.dart';
import 'package:belanja/widgets/item_details.dart';
import 'package:belanja/widgets/item_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ItemCard extends StatelessWidget {
  final Item item;

  const ItemCard({required this.item, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.go('/details', extra: item),
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ItemImage(imageUrl: item.image!, tag: item.name!),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ItemDetails(item: item),
            ),
          ],
        ),
      ),
    );
  }
}
