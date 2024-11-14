import 'package:flutter/material.dart';

class CatalogScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Catálogo',
            style: TextStyle(
              color: Color(0xFF5E9B8F),
              fontSize: 35, 
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Color(0xFF5E9B8F)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Color(0xFFF0F1F5), 
                prefixIcon: Icon(Icons.search, color: Color(0xFF9E9E9E)), 
                hintText: 'Buscar procedimientos',
                hintStyle: TextStyle(color: Color(0xFF9E9E9E)), 
                contentPadding: EdgeInsets.symmetric(vertical: 0), 
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25), 
                  borderSide: BorderSide.none, 
                ),
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildCategoryIcon(Icons.work, 'Productos'),
                _buildCategoryIcon(Icons.face, '###'),
                _buildCategoryIcon(Icons.checkroom, '###'),
                _buildCategoryIcon(Icons.person, '###'),
                _buildCategoryIcon(Icons.noise_aware, '###'),
              ],
            ),
            SizedBox(height: 20),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                children: [
                  _buildProcedureCard('Procedimiento ###', 'Moldea tu ###'),
                  _buildProcedureCard('Procedimiento ###', 'Moldea tu ###'),
                  _buildProcedurePlaceholder(),
                  _buildProcedurePlaceholder(),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
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
        onTap: (index) {
          switch (index) {
            case 0:
              Navigator.pushNamed(context, '/home');
              break;
            case 2:
              Navigator.pushNamed(context, '/promotions');
              break;
            case 3:
              Navigator.pushNamed(context, '/profile');
              break;
          }
        },
      ),
    );
  }

  Widget _buildCategoryIcon(IconData icon, String label) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: Colors.grey[200],
          child: Icon(icon, color: Colors.black),
        ),
        SizedBox(height: 5),
        Text(label),
      ],
    );
  }

  Widget _buildProcedureCard(String title, String subtitle) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Image.network(
              'https://via.placeholder.com/150',
              fit: BoxFit.cover,
              width: double.infinity,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
                Text(subtitle, style: TextStyle(color: Colors.grey)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProcedurePlaceholder() {
    return Container(
      color: Colors.grey[200],
    );
  }
}
