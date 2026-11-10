import 'package:flutter/material.dart';

import 'shopping_cart_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const burgundy = Color(0xFF800020);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Cart',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: burgundy,
          primary: burgundy,
          onSurface: const Color(0xFF321019),
        ),
      ),
      home: const ShoppingCartPage(),
    );
  }
}
