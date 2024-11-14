import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CatalogScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            decoration: InputDecoration(
              filled: true,
              fillColor: Color(0xFFF0F1F5),
              prefixIcon: Icon(Icons.search, color: Color(0xFF9E9E9E), size: 30),
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
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed('/details', arguments: 'Productos');
                },
                child: _buildCategoryIcon(Icons.work, 'Productos'),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed('/details', arguments: 'Facial');
                },
                child: _buildCategoryIcon(Icons.face, 'Facial'),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed('/details', arguments: 'Cuerpo');
                },
                child: _buildCategoryIcon(FontAwesomeIcons.male, 'Cuerpo'),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed('/details', arguments: 'Manos');
                },
                child: _buildCategoryIcon(FontAwesomeIcons.handPaper, 'Manos'),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed('/details', arguments: 'Pies');
                },
                child: _buildCategoryIcon(FontAwesomeIcons.shoePrints, 'Pies'),
              ),
            ],
          ),
          SizedBox(height: 20),
          SizedBox(
            height: 250,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 6,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed(
                      '/details',
                      arguments: 'Procedimiento ${(index % 3) + 1}',
                    );
                  },
                  child: _buildProcedureCard(
                    'Procedimiento ${(index % 3) + 1}',
                    'Moldea tu ###',
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 20),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: 6,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed(
                      '/details',
                      arguments: 'Título $index',
                    );
                  },
                  child: _buildSmallCard(context),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryIcon(IconData icon, String label) {
    return Column(
      children: [
        CircleAvatar(
          radius: 25,
          backgroundColor: Colors.grey[200],
          child: Icon(icon, color: Colors.black, size: 28),
        ),
        SizedBox(height: 5),
        Text(label),
      ],
    );
  }

  Widget _buildProcedureCard(String title, String subtitle) {
    return Container(
      width: 260,
      margin: EdgeInsets.only(right: 10),
      child: Card(
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Image.asset(
                'lib/assets/images/imgCarrousel.png',
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
      ),
    );
  }

  Widget _buildSmallCard(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      height: 120,
      margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Container(
            width: 100,
            height: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8),
                bottomLeft: Radius.circular(8),
              ),
              image: DecorationImage(
                image: AssetImage('lib/assets/images/imgCarrousel.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Título',
                    style: TextStyle(
                      color: Colors.grey[800],
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Descripción',
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
