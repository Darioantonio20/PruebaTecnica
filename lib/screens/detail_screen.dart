import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final String itemTitle = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Color(0xFF5E9B8F)),
        title: Container(
          alignment: Alignment.centerLeft,
          margin: EdgeInsets.only(top: 20.0),
          child: Text(
            itemTitle,
            style: TextStyle(
              color: Color(0xFF5E9B8F),
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: Center(
        child: Text(
          'Información sobre $itemTitle',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
