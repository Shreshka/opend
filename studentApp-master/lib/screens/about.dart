import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('About'), backgroundColor: Colors.blue),
      body: Container(
        margin: EdgeInsets.only(top: 85),
        constraints: BoxConstraints.expand(height: 300),
        alignment: Alignment.center,
        child: Image.asset(
          "assets/edu.png",
          fit: BoxFit.cover,
        ),
      )
    );
  }
}