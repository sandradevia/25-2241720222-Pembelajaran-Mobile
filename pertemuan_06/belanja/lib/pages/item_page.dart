import 'package:belanja/models/item.dart';
import 'package:belanja/widgets/item_details.dart';
import 'package:belanja/widgets/item_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ItemPage extends StatelessWidget {
  const ItemPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Item itemArgs = GoRouterState.of(context).extra! as Item;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Shopping List'),
      ),
      body: GestureDetector(
        onTap: () {
          context.pop();
        },
        child: Center(
          child: Column(
            children: [
              ItemImage(imageUrl: itemArgs.image!, tag: itemArgs.name!),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ItemDetails(item: itemArgs),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
