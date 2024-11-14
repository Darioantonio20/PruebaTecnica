import 'package:flutter/material.dart';
import 'package:prueba_tecnica/screens/home_screen.dart';
import 'package:prueba_tecnica/screens/profile_screen.dart';
import 'package:prueba_tecnica/screens/promotions_screen.dart';
import 'screens/catalog_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Catalogo App',
      
      theme: ThemeData(
        primaryColor: Color(0xFF5E9B8F),
      ),
      home: CatalogScreen(),
      routes: {
        '/catalog': (context) => CatalogScreen(),
        '/promotions': (context) => PromotionsScreen(),
        '/profile': (context) => ProfileScreen(),
        '/home': (context) => HomeScreen(),
      },
    );
  }
}
