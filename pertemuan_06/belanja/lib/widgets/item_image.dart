import 'package:flutter/material.dart';

class ItemImage extends StatelessWidget {
  final String imageUrl;
  final String tag;

  const ItemImage({required this.imageUrl, required this.tag, super.key});

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: tag,
      child: Image.network(
        imageUrl,
        fit: BoxFit.cover,
      ),
    );
  }
}
