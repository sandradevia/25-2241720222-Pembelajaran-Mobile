import 'package:belanja/models/item.dart';
import 'package:flutter/material.dart';

class ItemDetails extends StatelessWidget {
  final Item item;

  const ItemDetails({required this.item, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(item.name!),
            Text('Rp ${item.price}'),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              children: [
                Icon(
                  Icons.star,
                  color: Colors.yellow[700],
                ),
                Text(item.rating.toString()),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
