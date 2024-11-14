import 'package:flutter/material.dart';
import 'package:prueba_tecnica/screens/home_screen.dart';
import 'package:prueba_tecnica/screens/profile_screen.dart';
import 'package:prueba_tecnica/screens/promotions_screen.dart';
import 'screens/catalog_screen.dart';
import 'screens/detail_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xFF5E9B8F),
        colorScheme: ColorScheme.fromSwatch().copyWith(
          surface: Colors.white,
        ),
        scaffoldBackgroundColor: Colors.white,
      ),
      home: MainScreen(),
      routes: {
        '/home': (context) => MainScreen(initialIndex: 0),
        '/catalog': (context) => MainScreen(initialIndex: 1),
        '/promotions': (context) => MainScreen(initialIndex: 2),
        '/profile': (context) => MainScreen(initialIndex: 3),
        '/details': (context) => DetailScreen(),
      },
    );
  }
}

class MainScreen extends StatefulWidget {
  final int initialIndex;

  MainScreen({this.initialIndex = 0});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    HomeScreen(),
    CatalogScreen(),
    PromotionsScreen(),
    ProfileScreen(),
  ];

  final List<String> _titles = [
    'Inicio',
    'Catálogo',
    'Promociones',
    'Perfil',
  ];

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.initialIndex;
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Container(
          alignment: Alignment.centerLeft,
          margin: EdgeInsets.only(top: 20.0),
          child: Text(
            _titles[_selectedIndex],
            style: TextStyle(
              color: Color(0xFF5E9B8F),
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        iconTheme: IconThemeData(color: Color(0xFF5E9B8F)),
      ),
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        currentIndex: _selectedIndex,
        selectedItemColor: Color(0xFF5E9B8F),
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.grid_view),
            label: 'Catálogo',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_offer),
            label: 'Promociones',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Perfil',
          ),
        ],
        onTap: _onItemTapped,
      ),
    );
  }
}
