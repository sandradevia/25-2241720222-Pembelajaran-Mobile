import 'package:flutter/material.dart';

import 'navigation_second.dart';

class NavigationFirst extends StatefulWidget {
  const NavigationFirst({super.key});

  @override
  State<NavigationFirst> createState() => _NavigationFirstState();
}

class _NavigationFirstState extends State<NavigationFirst> {
  Color color = Colors.yellow;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color,
      appBar: AppBar(
        title: const Text("Navigation First - Sandra"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            _navigateAndGetColor(context); // Panggil fungsi untuk navigasi dan mendapatkan warna
          },
          child: const Text('Change color'),
        ),
      ),
    );
  }

  Future<void> _navigateAndGetColor(BuildContext context) async {
    final selectedColor = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const NavigationSecond()),
    );
    if (selectedColor != null && selectedColor is Color) {
      setState(() {
        color = selectedColor;
      });
    }
  }
}
